using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication6.Models
{
    public class UserReplyModel
    {
        public int FS_COMMENTID { get; set; }
        public string REPLY { get; set; }
        public string FS_ID { get; set; }
        public string ADDTIME { get; set; }
        public int USER_ID { get; set; }
        public string USER_NAME { set; get; }
        public string USER_IMG { set; get; }

    }
}