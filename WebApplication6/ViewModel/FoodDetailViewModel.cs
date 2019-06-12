using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication6.Models;

namespace WebApplication6.ViewModel
{
    public class FoodDetailViewModel
    {
        public IEnumerable<FoodShare> FOODSHARE1 { get; set; }
        public IEnumerable<FoodShare> FOODSHARE2 { get; set; }
        public IEnumerable<FoodShare> FOODSHARE3 { get; set; }
        public IEnumerable<FoodShare> FOODSHARE4 { get; set; }
        public IEnumerable<FoodShare> FOODSHARE5 { get; set; }
        //public IEnumerable<FoodShare> FOODSHARE6 { get; set; }
        public PagedList.IPagedList<FoodShare> FOODSHARE6 { get; set; }
    }
}