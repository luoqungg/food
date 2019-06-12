using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;

namespace WebApplication6.Controllers
{
    public class CaipuController : Controller
    {
        
        public FoodEntities db = new FoodEntities();
        // GET: shicai
        public ActionResult Index(string searchString, int page = 1)
        {
            var list = from n in db.FoodShare select n;
            ViewBag.SearchString = searchString;

            if (!string.IsNullOrEmpty(searchString))
            {
                list = list.Where(s => s.Fs_title.Contains(searchString.ToUpper()));
            }
            list = list.OrderBy(s => s.Fs_id);
            return View(list.ToPagedList(page, 5));
        }
        public ActionResult Detail(int id)
        {
            //var food =  db.FoodShare.Where(n => n.Fs_id == id).FirstOrDefault();
            //Session["Fs_img"] = food.Fs_img;
            var list = from n in db.FoodShare.Where(n => n.Fs_id == id) select n;
            var list1 = from n in db.FoodShareComment
                        where  n.Fs_id == id
                        select new UserCommentModel
                        {
                            FS_COMMENTID =n.FsComment_id ,
                            COMMENT =n.FsComment_content ,
                            USER_ID =n.UserInfo .User_id ,
                            USER_IMG =n.UserInfo.User_img,
                            USER_NAME =n.UserInfo.User_name
                        };
            var index = new WebApplication6.Models.UserCommentDetailModel()
            {
                FOODSHARE = list,
                 USERCOMMENT  = list1,
               
            };
            return View(index);
        }
        [HttpPost ]
        public ActionResult Detail(string a,FoodShareComment foodShareComment    )
        {
            db.FoodShareComment.Add(foodShareComment );
            db.SaveChanges();
            return Content(a);
        }


        //public ActionResult Pingluen(string a)
        //{
        //    string name = a;
        //    return Content(name);
        //}

    }
}