using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;

namespace WebApplication6.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public FoodEntities db = new FoodEntities();
        public ActionResult Index()
        {

            return View();
        }
    }
}