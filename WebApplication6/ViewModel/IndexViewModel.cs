using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication6.Models;

namespace WebApplication6.ViewModel
{
    public class IndexViewModel
    {
        public IEnumerable<News> News { get; set; }
        public IEnumerable<Post> Post { get; set; }
        public IEnumerable<FoodShare> FOODSHARE { get; set; }
        public IEnumerable<VideoUserViewModel> Video1 { get; set; }
        public IEnumerable<VideoUserViewModel> Video2 { get; set; }
        public IEnumerable<VideoUserViewModel> Video3 { get; set; }
    }
}