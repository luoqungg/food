using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.ViewModel
{
    public class PostUserViewModel
    {
        public int Post_id { get; set; }
        public int User_id { get; set; }
        public int ReadCount{ get; set; }
        public string Post_content { get; set; }
        public DateTime Addtime { get; set; }
        public string Post_title { get; set; }
        public string Post_lable { get; set; }
        public string Post_img { get; set; }
        public string User_name { get; set; }
        public string User_img { get; set; }
        public int Collection { get; set; }
    }
}