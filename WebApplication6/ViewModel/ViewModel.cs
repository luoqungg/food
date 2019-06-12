using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    public class ViewModel
    {
        //public string  FS_TITLE { get; set; }
        //public string FS_IMG { get; set; }
        //public string FS_LABLE { get; set; }
        //public string VIDEO_URL { get; set; }
        //public string VIDEO_DECRIPTION { get; set; }
        //public string VIDEO_IMG { get; set; }
        //public string VIDEO_LABEL{ get; set; }
        public IEnumerable<FoodShare > FOODSHARE { get; set; }
        public IEnumerable<Video > VIDEO { get; set; }
        //public IEnumerable<Post> POST { get; set; }
        public IEnumerable<UserPostModel > USERPOST { get; set; }




    }
}