using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WebApplication6.Models;

namespace WebApplication6.Controllers
{
    public class LoginController : Controller
    {
        FoodEntities db = new FoodEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserInfo us)
        {
            if (ModelState.IsValid)
            {
                string vCode = Request.Form["txtverifcode1"];

                if (vCode != Session["ValidateCode"].ToString())
                {
                    return Content("<script>;alert('验证码错误！');history.go(-1)</script>");
                }
                //var user = db.Userinfo.Where(u => u.Username == us.Username).FirstOrDefault();
                //if (user != null)
                //    return Content("<script>;alert('用户名已被占用！');history.go(-1)</script>");
            }

             
            //Session["img"]=   user.User_img
            if (db.UserInfo.Where(n => n.User_phone == us.User_phone).FirstOrDefault() != null)
            {
                var user = db.UserInfo.Where(n => n.User_phone == us.User_phone).FirstOrDefault();
                Session["user"] = user;
                Session["img"]  = user.User_img ;
                Session["Username"] = user.User_name;
                Session["Sex"] = user.User_sex;
                Session["Sign"] = user.User_sign;
                //ViewBag.Userimg=us.User_img;
                //ViewBag.Username = us.User_name;
                //ViewBag.Usersex = us.User_sex;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View("Login");
            }
        }
        public ActionResult Regist()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Regist(UserInfo us)
        {
            db.UserInfo.Add(us);
            int result = db.SaveChanges();
            if (result > 0)
            {
                return RedirectToAction("Login");
            }
            else
            {
                return RedirectToAction("Regist");
            }

        }
    }
}