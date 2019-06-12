using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication6.Models;

namespace WebApplication6.ViewModel
{
    public class VideoDetailViewModel
    {
        public  IEnumerable<Video> Video1 { get; set; }
        public  IEnumerable<Video> Video { get; set; }
        public IEnumerable<VideoCommentViewModel> Comment1 { get; set; }
        public IEnumerable<VideoUserViewModel> Video2 { get; set; }
        public IEnumerable<VideoReplyViewModel> Reply { get; set; }
        public IEnumerable<VideoReplyViewModel> Reply1 { get; set; }
        
    }
}