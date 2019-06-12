using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;
using WebApplication6.ViewModels;

namespace WebApplication6.Controllers
{
    
    public class HomeController : Controller
    {
        public FoodEntities db = new FoodEntities();
        public ActionResult Index()
        {
            var list1 = (from p in db.FoodShare  select p).OrderBy(p => p.Fs_id ).Take(8);
            var news = (from p in db.News select p).OrderByDescending(p => p.News_addtime).Take(5);
            var video = from m in db.Video
                        join n in db.UserInfo on m.User_id equals n.User_id
                        select new VideoUserViewModel
                        {
                            Video_id = m.Video_id,
                            Video_title = m.Video_decription,
                            //Addtime= m.Addtime,
                            Video_lable = m.Video_lable,
                            Video_img = m.Video_img,
                            User_id = n.User_id,
                            User_name = n.User_name,
                        };
            var video1 = (from m in video.Where(p => p.Video_lable == "推荐").OrderByDescending(p => p.Video_id) select m).Take(8);
            var video2 = (from m in video.Where(p => p.Video_lable == "最新").OrderByDescending(p => p.Video_id) select m).Take(8);
            var video3 = (from m in video.Where(p => p.Video_lable == "最热").OrderByDescending(p => p.Video_id) select m).Take(8);
            var index = new IndexViewModel()
            {
                News = news,
                Video1 = video1,
                Video2 = video2,
                Video3 = video3,
                FOODSHARE = list1,
            };
            return View(index);         
        }
        public ActionResult News(int id)
        {
            var news = db.News.Where(p => p.News_id == id).FirstOrDefault();
            ViewBag.News_title = news.News_title;
            ViewBag.News_content = news.News_content;
            ViewBag.News_img = news.News_img;
            ViewBag.News_addtime = news.News_addtime;
            return View();
        }

        public ActionResult MoreNews()
        {
            var news = db.News;
            return View(news);
        }

    }
}