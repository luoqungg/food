using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.ViewModel
{
    public class PostReplyViewModel
    {
        //public int Post_id { get; set; }
        public int PostComment_id { get; set; }
        public int PostReply_id { get; set; }
        public DateTime Addtime { get; set; }
        public string ReplyContent { get; set; }
        public int User_id { get; set; }
        public  string User_name { get; set; }
        public string User_img { get; set; }
    }
}