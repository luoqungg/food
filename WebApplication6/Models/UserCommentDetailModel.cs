using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    public class UserCommentDetailModel
    {
        public IEnumerable<FoodShare> FOODSHARE { get; set; }
        public IEnumerable<UserCommentModel> USERCOMMENT { get; set; }
        public IEnumerable<UserReplyModel> FOODSHAREREPLY{ get; set; }
    }
}