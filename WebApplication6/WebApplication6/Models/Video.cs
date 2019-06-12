//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication6.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Video
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Video()
        {
            this.VideoCollection = new HashSet<VideoCollection>();
            this.VideoComment = new HashSet<VideoComment>();
            this.VideoReply = new HashSet<VideoReply>();
        }
    
        public int Video_id { get; set; }
        public Nullable<int> User_id { get; set; }
        public string Video_url { get; set; }
        public string Video_decription { get; set; }
        public string Video_img { get; set; }
        public string Video_lable { get; set; }
        public Nullable<System.DateTime> Addtime { get; set; }
        public Nullable<int> ReadCount { get; set; }
        public Nullable<int> Collection { get; set; }
    
        public virtual UserInfo UserInfo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VideoCollection> VideoCollection { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VideoComment> VideoComment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VideoReply> VideoReply { get; set; }
    }
}
