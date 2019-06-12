using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;
using WebApplication6.ViewModel;

namespace WebApplication6.Controllers
{
    public class CaipuController : Controller
    {
        
        public FoodEntities db = new FoodEntities();
    
        public ActionResult Index(string searchString, int page = 1)
        {
            var list = from n in db.FoodShare select n;
            var list1 = from n in db.FoodShare.Where(n=>n.Fs_lable=="甜食类") select n;
            var list2 = from n in db.FoodShare.Where(n => n.Fs_lable == "荤菜类") select n;
            var list3 = from n in db.FoodShare.Where(n => n.Fs_lable == "油炸类") select n;
            var list4 = from n in db.FoodShare.Where(n => n.Fs_lable == "烧烤类") select n;
            var list5 = from n in db.FoodShare.Where(n => n.Fs_lable == "素食类") select n;
            ViewBag.SearchString = searchString;
            if (!string.IsNullOrEmpty(searchString))
            {
                list = list.Where(s => s.Fs_title.Contains(searchString.ToUpper()));
            }
            list = list.OrderBy(s => s.Fs_id);
            //return View(list.ToPagedList(page, 12));
            var index = new FoodDetailViewModel()
            {
                FOODSHARE1=list1,
                FOODSHARE2=list2,
                FOODSHARE3 = list3,
                FOODSHARE4 = list4,
                FOODSHARE5 = list5,
                FOODSHARE6=list.ToPagedList(page,12),
             
            };
            return View(index);

           
        }
        public ActionResult Detail(int id,FoodShare fs)
        {
            //var food =  db.FoodShare.Where(n => n.Fs_id == id).FirstOrDefault();
            //Session["Fs_img"] = food.Fs_img;
            var list = from n in db.FoodShare.Where(n => n.Fs_id == id) select n;
            int id1 =Convert.ToInt32(Session["userid"]);
            Session["Fs_id"] = id;
            var list2 = from m in db.FoodShareReply
                        join n in db.FoodShareComment on m.FsComment_id equals n.FsComment_id
                        //where  m.FsComment_id==id
                         select new UserReplyModel
                          {
                             REPLY = m.FsReply_content,
                             ADDTIME = (m.Addtime).ToString(),
                             USER_IMG = m.UserInfo.User_img,
                         };
            var list1 = from n in db.FoodShareComment
                        where  n.Fs_id == id
                      
                        select new UserCommentModel
                        {
                            FS_COMMENTID =n.FsComment_id ,
                            COMMENT =n.FsComment_content ,
                            USER_ID =n.UserInfo .User_id ,
                            USER_IMG =n.UserInfo.User_img,
                            USER_NAME =n.UserInfo.User_name,
                           

                        };
            int comment_id = Convert.ToInt32(Request["comment_id"]);
            
            var index = new WebApplication6.Models.UserCommentDetailModel()
            {
                FOODSHARE = list,
                USERCOMMENT = list1,
                FOODSHAREREPLY = list2
            };
            return View(index);
        }
        //[HttpPost]
        //public ActionResult Detail(string a, FoodShareComment foodShareComment)
        //{
        //    //db.FoodShareComment.Add(foodShareComment );
        //    //db.SaveChanges();
        //    return Content(a);
        //}

        [HttpPost]
        public ActionResult Pingluen(string a,FoodShareComment foodShareComment)
        {
            
            if (Session["user"] != null)
            {
                if (a!="")
                {
                    string comment = a;
                    foodShareComment.FsComment_content = comment;
                    foodShareComment.Fs_id = (int)Session["Fs_id"];
                    foodShareComment.User_id = (int)Session["userid"];
                    foodShareComment.Addtime = System.DateTime.Now;
                    db.FoodShareComment.Add(foodShareComment);
                    db.SaveChanges();
                    return Content(a);
                }
                else
                {
                    return Content("<script> alert('评论不能为空！'); </script>");
                }
              
            }
            else
            {
                return Content("<script>;alert('请先登录!');</script>");
            }
        }
        [HttpPost]
        public ActionResult Reply(string reply,FoodShareReply foodShareReply)
        {
            int comment_id = Convert.ToInt32(Request["comment_id"]);
            if (Session["user"] != null)
            {
                string comment = reply;
                foodShareReply.FsComment_id = comment_id;
                foodShareReply.FsReply_content = comment;
                foodShareReply.Fs_id = (int)Session["Fs_id"];
                foodShareReply.User_id = (int)Session["userid"];
                foodShareReply.Addtime = System.DateTime.Now;
                //foodShareReply.FsComment_id =;
                db.FoodShareReply.Add(foodShareReply);
                db.SaveChanges();
                return Content(reply);
            }
            else
            {
                return Content("<script>;alert('请先登录!');</script>");
            }

        }
        //[HttpGet]
        //public ActionResult Dianzan(int id)
        //{
        //    FoodShare fs = db.FoodShare.Where(n => n.Fs_id == id).First();
        //    return View();
        //}
        [HttpPost]
        public string Dianzan()
        {
            if (Session["user"] != null)
            {
                int id = (int)Session["Fs_id"];
                FoodShare fs1 = db.FoodShare.Where(n => n.Fs_id == id).First();
                fs1.ReadCount = fs1.ReadCount + 1;
                string a = (fs1.ReadCount).ToString();
                db.SaveChanges();
                return (a);
            }
            else
            {
               return ("<script>;alert('请先登录!');</script>");
            }
        }
        [HttpPost]
        public ActionResult Collection(FoodShareCollection foodShareCollection)
        {
            if (Session["user"] != null)
            {
                int id = (int)Session["Fs_id"];
                foodShareCollection.User_id = (int)Session["userid"];
                foodShareCollection.Fs_id = id;
                db.FoodShareCollection.Add(foodShareCollection);
                db.SaveChanges();
                return Content("1");
            }
            else
            {
                return Content("<script>;alert('请先登录!');</script>");

            }
        }


    }
}