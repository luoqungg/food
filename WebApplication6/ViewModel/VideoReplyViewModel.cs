using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.ViewModel
{
    public class VideoReplyViewModel
    {
        public int VideoReply_id { get; set; }
        public int VideoComment_id { get; set; }
        public int User_id { get; set; }
        public  string Reply_content { get; set; }
        public DateTime Addtime { get; set; }
        public string User_img { get; set; }
        public string User_name { get; set; }
    }
}