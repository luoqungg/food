using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;
namespace WebApplication6.Controllers
{
    
    public class VideoController : Controller
    {
        Models.FoodEntities db = new FoodEntities();
        // GET: Video
        public ActionResult VideoIndex()
        {
            var video = db.Video;
            return View(video);
        }
        public ActionResult VideoDetails(int id)
        {
            var video = db.Video.Where(p => p.Video_id == id).FirstOrDefault();
            ViewBag.Video_title = video.Video_decription;
            ViewBag.Video_img = video.Video_img;
            ViewBag.Video_url = video.Video_url;
            return View(video);
        }
    }
}