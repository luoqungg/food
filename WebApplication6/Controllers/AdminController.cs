using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;

namespace WebApplication6.Controllers
{
    public class AdminController : Controller
    {
        public FoodEntities db = new FoodEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Edit(int id)
        {
            FoodShare fs = db.FoodShare.Where(n => n.Fs_id == id).FirstOrDefault();
            return View(fs);
        }
        [HttpPost]
        public ActionResult Edit(FoodShare us)
        {
            FoodShare user1 = db.FoodShare.Where(n => n.Fs_id == us.Fs_id).First();
            user1.Fs_title = us.Fs_title;
            user1.Fs_lable = us.Fs_lable;
            user1.Fs_detail = us.Fs_detail;
            int result = db.SaveChanges();
            if (result > 0)
            { return RedirectToAction("Index", "User"); }
            else
            { return Content("<script> alert('没有修改');history.go(-1); </script>"); }

        }
    }
}