using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.ViewModels
{
    public class VideoUserViewModel
    {
        public int Video_id { set; get; }
        public string Video_title { set; get; }
        public string Video_img { set; get; }
        //public DateTime Addtime { set; get; }
        public string Video_lable { set; get; }
        public int User_id { set; get; }
        public string User_name { set; get; }
    }
}