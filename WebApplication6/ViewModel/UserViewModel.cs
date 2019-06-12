using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication6.Models;

namespace WebApplication6.ViewModel
{
    public class UserViewModel
    {
        public IEnumerable<FoodShareComment> FOODSHARECOMMENT { get; set; }
        public IEnumerable<Video> VIDEO { get; set; }
        public IEnumerable<Post> POST { get; set; }
        public IEnumerable<UserInfo> USERINFO { get; set; }
        public IEnumerable<FoodShare> FOODSHARE { get; set; }
        public IEnumerable<FoodShare> FOODSHARE1 { get; set; }



    }
}