using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.ViewModel
{
    public class PostCommentViewModel
    {
        public int PostComment_id { get; set; }
        public string PostComment_content { get; set; }
        public DateTime AddTime { get; set; }
        public int Post_id { get; set; }
        public  int User_id { get; set; }
        public  string User_img { get; set; }
        public string User_name { get; set; }
    }
}