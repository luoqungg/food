using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.ViewModel
{
    public class VideoCommentViewModel
    {
        public int Comment_id { get; set; }
        public int User_id { get; set; }
        public int Video_id { get; set; }
        public string VideoComment_content { get; set; }
        public System.DateTime Addtime { get; set; }
        public string User_name { get; set; }
        public string User_img { get; set; }
    }
}