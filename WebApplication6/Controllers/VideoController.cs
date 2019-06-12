using PagedList;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using WebApplication6.Models;
using WebApplication6.ViewModel;
namespace WebApplication6.Controllers
{
    
    public class VideoController : Controller
    {
        Models.FoodEntities db = new FoodEntities();
        // GET: Video
        public ActionResult VideoIndex(int page = 1)
        {
            var video = from p in db.Video select p;
            video= video.OrderBy(s => s.Addtime);
            return View(video.ToPagedList(page, 6));
        }//视频主页
        public ActionResult VideoDetails(int id,int uid)//视频细节
        {
            Session["Video_id"] = id;
            if (Session["userid"] != null)
            {
                var userid = Convert.ToInt32(Session["userid"]);
                var coll2 = (from m in db.VideoCollection.Where(p => p.User_id == userid).Where(p => p.Video_id == id) select m).FirstOrDefault();
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
            var video = (from m in db.Video.Where(p => p.Video_id == id) select m);
            var video1 = (from m in db.Video.Where(p => p.User_id== uid) select m).Take(3);
            var comment = from m in db.VideoComment
                          join n in db.UserInfo on m.User_id equals n.User_id
                          join a in db.Video on m.Video_id equals a.Video_id
                          select new VideoCommentViewModel
                           {
                              Video_id= a.Video_id,
                              Comment_id=m.VideoComment_id,
                              Addtime=(DateTime)m.Addtime,
                              VideoComment_content=m.VideoComment_content,
                              User_img=n.User_img,
                              User_id = n.User_id,
                              User_name = n.User_name,
                            };
            var comment1 = (from p in comment.Where(p => p.Video_id == id).OrderByDescending(p => p.Addtime) select p).Take(5);
            var videodetail = new VideoDetailViewModel
            {
                Comment1 = comment1,
                Video = video,
                Video1 = video1,
            };
            return View(videodetail);
        }
        
        [HttpPost]
        public string Comment(VideoComment VC)//评论视频
        {
            string content = Request["Content1"];
            int Video_id = Convert.ToInt32(Request["Video_id"]);
            if (content == "")
            {
                return "kong";
            }
            if (Session["userid"] != null)
            {
                if (ModelState.IsValid)
                {
                    VC.Video_id = Video_id;
                    VC.VideoComment_content = content;
                    VC.User_id = Convert.ToInt32(Session["userid"].ToString());
                    VC.Addtime = System.DateTime.Now;
                    db.VideoComment.Add(VC);
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
        public string Collection(VideoCollection vi)//收藏视频
        {
            int Vi_id = Convert.ToInt32(Request["vid"]);
            int User_id = Convert.ToInt32(Session["userid"]);
            var vi1 = db.VideoCollection.Where(o => o.User_id == User_id).Where(o => o.Video_id == Vi_id).FirstOrDefault();
            var vi2 = db.Video.Where(p => p.Video_id == Vi_id).FirstOrDefault();
            if (Session["userid"] != null)
            {
                if (ModelState.IsValid)
                {
                    if(vi1==null)
                    {
                        vi.User_id = User_id;
                        vi.Video_id = Vi_id;
                        vi.State = 1;
                        db.VideoCollection.Add(vi);
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

        [HttpPost]
        
        public string VideoReply(VideoReply rep)//回复评论
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
                    rep.VideoComment_id = Com_id;
                    rep.VideoReply_content = content;
                    rep.User_id = Convert.ToInt32(Session["userid"].ToString());
                    rep.Video_id = (int)Session["Video_id"];
                    rep.Addtime = System.DateTime.Now;
                    db.VideoReply.Add(rep);
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
        //[ChildActionOnly]
        public ActionResult VideoReplyShow(int id)//显示回复
        {
            //var msc = (from p in db.VideoComment.Where(p => p.VideoComment_id==id) select p);
            var msr = (from n in db.VideoReply
                       join m in db.VideoComment on n.VideoComment_id equals m.VideoComment_id
                       join q in db.UserInfo on n.User_id equals q.User_id
                       //join p in msc on m.User_id equals p.User_id
                       where n.VideoComment_id==id
                       select new VideoReplyViewModel
                       {
                           VideoReply_id = n.VideoReply_id,
                           VideoComment_id = m.VideoComment_id,
                           Reply_content = n.VideoReply_content,
                           Addtime = (DateTime)n.Addtime,

                           User_id = (int)n.User_id,
                           User_name=q.User_name,
                           User_img = q.User_img,
                       });
            var reply = (from m in msr.Where(p => p.VideoComment_id == id).OrderByDescending(p => p.Addtime) select m).Take(3);
            var reply1 = (from m in msr.Where(p => p.VideoComment_id == id).OrderByDescending(p => p.Addtime) select m);
            var videoreply = new VideoDetailViewModel
            {
                Reply=reply,
                Reply1=reply1,
            };
            return PartialView(videoreply);
        }


        [HttpPost]
        public string AddClick(int ViId)//点击量
        {
            var ms = db.Video.Find(ViId);
            if(ms.ReadCount==null)
            {
                ms.ReadCount = 0;
                //var mscount = ms.ReadCount + 1;
                //ms.ReadCount = ms.ReadCount + 1;
                db.SaveChanges();
                return ms.ReadCount.ToString();
            }
            else
            {
                var mscount = ms.ReadCount + 1;
                ms.ReadCount = ms.ReadCount + 1;
                db.SaveChanges();
                return mscount.ToString();
            }
        }
    }
}