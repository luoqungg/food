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
        public ActionResult LoginAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginAdmin(Admin admin)
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
            if (db.Admin.Where(n => n.Admin_id == admin.Admin_id).FirstOrDefault() != null)
            {
                var user = db.Admin.Where(n => n.Admin_id == admin.Admin_id).FirstOrDefault();
                Session["adminid"] = admin.Admin_id;
               
                Session["adminname"] = admin.Admin_name;
                
                //ViewBag.Userimg=us.User_img;
                //ViewBag.Username = us.User_name;
                //ViewBag.Usersex = us.User_sex;
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                Session["adminname"] = 0;
                return View("LoginAdmin");
            }
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
                Session["userid"] = user.User_id;
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
                Session["Username"] =0;
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