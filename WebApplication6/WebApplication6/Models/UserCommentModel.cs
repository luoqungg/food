using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    public class UserCommentModel
    {
        public int FS_COMMENTID { get; set; }
        public string COMMENT { get; set; }
        public int USER_ID { get; set; }
        public string USER_NAME { set; get; }
        public string USER_IMG { set; get; }
    }
}