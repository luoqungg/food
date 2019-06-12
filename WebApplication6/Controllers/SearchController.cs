using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebApplication6.Models;

namespace WebApplication6.Controllers
{
    public class SearchController : Controller
    {
        public FoodEntities db = new FoodEntities();
        // GET: Search
        public ActionResult Index(string searchString)
        {
            var list = from n in db.FoodShare select n;
            ViewBag.SearchString = searchString;

            if (!string.IsNullOrEmpty(searchString))
            {
                list = list.Where(s => s.Fs_title.Contains(searchString.ToUpper()));
            }
            list = list.OrderBy(s => s.Fs_id);
            return View(list);
            
        }
    }
}