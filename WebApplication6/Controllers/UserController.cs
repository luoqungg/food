using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;
using WebApplication6.ViewModel;

namespace WebApplication6.Controllers
{
    public class UserController : Controller
    {
        
        // GET: User
        public FoodEntities db = new FoodEntities();
        public ActionResult Index()
        {
            int id = (int)Session["userid"];
            var list1 = from n in db.FoodShareComment
                        where n.User_id == id
                        select n;
            var list2 = from n in db.Video
                        where n.User_id == id
                        select n;
            var list3 = from n in db.FoodShare
                        where n.User_id == id
                        select n;
            var list4 = from n in db.FoodShare
                        join m in db.FoodShareCollection on n.Fs_id equals m.Fs_id
                        where m.User_id == id
                        select n;
            var list5 = from n in db.UserInfo
                        where n.User_id == id
                        select n;


            var index = new UserViewModel()
            {
                FOODSHARECOMMENT = list1,
                VIDEO = list2,
                FOODSHARE = list3,
                FOODSHARE1 = list4,
                USERINFO = list5
            };
            return View(index);
        }
        [HttpPost]
        public ActionResult Xiugai(UserInfo us)
        {
            try
            {
                HttpPostedFileBase postimageBase = Request.Files["User_img"];
                if (postimageBase != null)
                {
                    string filePath = postimageBase.FileName;
                    string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                    string serverpath = Server.MapPath(@"/images/User/") + filename;
                    string relativepath = @"/images/User/" + filename;
                    postimageBase.SaveAs(serverpath);
                    us.User_img = relativepath;
                }
                    int id = (int)Session["userid"];
                UserInfo us1 = db.UserInfo.Where(n => n.User_id == id).FirstOrDefault();
                us1.User_img = us.User_img;
                us1.User_name = us.User_name;
                us1.User_sex = us.User_sex;
                us1.User_sign = us.User_sign;
                int result = db.SaveChanges();
                if (result > 0)
                {
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    return Content("<scrip> 修改有误</script>");
                }
            }
            catch (Exception e)
            {
                return Content(e.Message);
            }
        }
    }
}