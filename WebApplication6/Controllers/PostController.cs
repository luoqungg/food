using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;
using WebApplication6.ViewModel;
using PagedList;

namespace WebApplication6.Controllers
{
    public class PostController : Controller
    {
        Models.FoodEntities db = new FoodEntities();
        // GET: Post
        public ActionResult PostIndex(int page=1)//帖子主页
        {
            var post = from p in db.Post select p;
            post = post.OrderBy(p => p.Post_addtime);
            return View(post.ToPagedList(page,6));
        }
        public ActionResult PostDetail(int id,int uid)//帖子细节
        {
            Session["Post_id"] = id;
            if (Session["userid"] != null)
            {
                var userid = Convert.ToInt32(Session["userid"]);
                var coll2 = (from m in db.PostCollection.Where(p => p.User_id == userid).Where(p => p.Post_id == id) select m).FirstOrDefault();
                if (coll2 != null && coll2.State == 1)
                {
                    ViewBag.rel = 1;
                }
                else
                {
                    ViewBag.rel = 0;
                }
            }
            else
            {
                ViewBag.rel = 0;
            }
            var post = from p in db.Post
                       join n in db.UserInfo on p.User_id equals n.User_id
                       where p.Post_id == id
                       select new PostUserViewModel
                       {
                           User_id = (int)p.User_id,
                           User_img = n.User_img,
                           User_name = n.User_name,
                           Post_content = p.Post_content,
                           Post_id = p.Post_id,
                           Post_lable=p.Post_lable,
                           Post_title=p.Post_title,
                           Post_img=p.Post_img,
                           Collection=(int)p.Collection,
                           ReadCount=(int)p.ReadCount,
                       };
            var post1 = from p in post.Where(p => p.Post_id == id) select p;
            var post2 = from p in db.Post.Where(p => p.User_id == uid).OrderByDescending(p => p.Post_addtime).Take(5) select p;
            var comment = from p in db.PostComment
                          join n in db.UserInfo on p.User_id equals n.User_id
                          join m in db.Post on p.Post_id equals m.Post_id
                          select new PostCommentViewModel
                          {
                              AddTime = (DateTime)p.Addtime,
                              Post_id=(int)p.Post_id,
                              PostComment_content=p.PostComment_content,
                              PostComment_id=p.PostComment_id,
                              User_id=(int)p.User_id,
                              User_img=n.User_img,
                              User_name=n.User_name,
                          };
            var comment1=from p in comment.Where(p=>p.Post_id==id).OrderByDescending(p=>p.AddTime).Take(5)select p;
            var postdetail = new PostDetailViewModel
            {
                post_comment=comment1,
                post_user=post1,
                post=post2,
            };
            return View(postdetail);
        }
        [HttpPost]
        public string PostComment(PostComment post)//评论帖子
        {
            string content = Request["Content1"];
            int Post_id = Convert.ToInt32(Request["Video_id"]);
            if (content == "")
            {
                return "kong";
            }
            if (Session["userid"] != null)
            {
                if (ModelState.IsValid)
                {
                    post.Post_id = Post_id;
                    post.PostComment_content = content;
                    post.User_id = Convert.ToInt32(Session["userid"].ToString());
                    post.Addtime = System.DateTime.Now;
                    db.PostComment.Add(post);
                    db.SaveChanges();
                    return "aa";
                }
                else
                {
                    return "bb";
                }
            }
            else
            {
                return "nn";
            }
        }
        [HttpPost]
        public string PostReply(PostReply rep)
        {
            string content = Request["Reply1"];
            int Com_id = Convert.ToInt32(Request["Com_id"]);
            if (content == "")
            {
                return "kong";
            }
            if (Session["userid"] != null)
            {
                if (ModelState.IsValid)
                {
                    rep.PostComment_id = Com_id;
                    rep.PostReply_content = content;
                    rep.User_id = Convert.ToInt32(Session["userid"].ToString());
                    rep.Addtime = System.DateTime.Now;
                    db.PostReply.Add(rep);
                    db.SaveChanges();
                    return "aa";
                }
                else
                {
                    return "bb";
                }
            }
            else
            {
                return "nn";
            }
        }//回复评论
        public ActionResult PostReplyShow(int id)//显示回复
        {
            var msr = (from n in db.PostReply
                       join m in db.PostComment on n.PostComment_id equals m.PostComment_id
                       join q in db.UserInfo on n.User_id equals q.User_id
                       where n.PostComment_id == id
                       select new PostReplyViewModel
                       {
                           PostReply_id = n.PostReply_id,
                           PostComment_id = m.PostComment_id,
                           ReplyContent = n.PostReply_content,
                           Addtime = (DateTime)n.Addtime,

                           User_id = (int)n.User_id,
                           User_name = q.User_name,
                           User_img = q.User_img,
                       });
            var reply = (from m in msr.Where(p => p.PostComment_id == id).OrderByDescending(p => p.Addtime) select m).Take(3);
            var reply1 = (from m in msr.Where(p => p.PostComment_id == id).OrderByDescending(p => p.Addtime) select m);
            var postreply = new PostDetailViewModel
            {
                 post_reply= reply,
                post_reply1 = reply1,
            };
            return PartialView(postreply);
        }

        [HttpPost]
        public string AddClick(int PoId)//点击量
        {
            var ms = db.Post.Find(PoId);            
            var mscount = ms.ReadCount + 1;
            ms.ReadCount = ms.ReadCount + 1;
            db.SaveChanges();
            return mscount.ToString();
        }

        [HttpPost]
        public string Collection(PostCollection vi)//收藏帖子
        {
            int Vi_id = Convert.ToInt32(Request["vid"]);
            int User_id = Convert.ToInt32(Session["userid"]);
            var vi1 = db.PostCollection.Where(o => o.User_id == User_id).Where(o => o.Post_id == Vi_id).FirstOrDefault();
            var vi2 = db.Post.Where(p => p.Post_id == Vi_id).FirstOrDefault();
            if (Session["userid"] != null)
            {
                if (ModelState.IsValid)
                {
                    if (vi1 == null)
                    {
                        vi.User_id = User_id;
                        vi.Post_id = Vi_id;
                        vi.State = 1;
                        db.PostCollection.Add(vi);
                        db.SaveChanges();
                        vi2.Collection = vi2.Collection + 1;
                        db.SaveChanges();
                        return "success";
                    }
                    if (vi1.State == 1)
                    {
                        vi1.State = 0;
                        db.SaveChanges();
                        vi2.Collection = vi2.Collection - 1;
                        db.SaveChanges();
                        return "cancel";
                    }
                    if (vi1.State == 0)
                    {
                        vi1.State = 1;
                        db.SaveChanges();
                        vi2.Collection = vi2.Collection + 1;
                        db.SaveChanges();
                        return "success";
                    }
                    else
                    {
                        return "";
                    }
                }
                else
                {
                    return "";
                }
            }
            else
            {
                return "login"; ;
            }
        }
    }
}