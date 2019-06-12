using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication6.Models;

namespace WebApplication6.ViewModel
{
    public class PostDetailViewModel
    {
        public IEnumerable<PostUserViewModel> post_user { get; set; } 
        public IEnumerable<Post> post { get; set; }
        public IEnumerable<PostCommentViewModel> post_comment { get; set; }
        public IEnumerable<PostReplyViewModel> post_reply { get; set; }
        public IEnumerable<PostReplyViewModel> post_reply1 { get; set; }
    }
}