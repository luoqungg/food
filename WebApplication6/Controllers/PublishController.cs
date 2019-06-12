using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication6.Models;


namespace WebApplication6.Controllers
{
    public class PublishController : Controller
    {
        public FoodEntities db = new FoodEntities();
        // GET: Publish
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Menu()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Menu(FoodShare fs)
        {
            try
            {
                HttpPostedFileBase postimageBase = Request.Files["img"];
                if (Session["user"] != null)
                {
                    if (postimageBase != null)
                    {
                        string filePath = postimageBase.FileName;
                        string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                        string serverpath = Server.MapPath(@"/images/Food/") + filename;
                        string relativepath = @"/images/Food/" + filename;
                        postimageBase.SaveAs(serverpath);
                        fs.Fs_img = relativepath;

                        fs.User_id = (int)Session["userid"];
                        if (fs.Fs_detail != null && fs.Fs_title != null && fs.Fs_lable != null)
                        {
                            db.FoodShare.Add(fs);
                            db.SaveChanges();
                            return Content("<script> alert('发布菜谱成功！'); history.go(-1)</script>");
                        }
                        else { return Content("发布内容有为空!"); }


                    }
                    else
                    {
                        return Content("<script>;alert('请先上传菜品图片！');history.go(-1)</script>");
                    }
                }


                else
                {
                    return Content("<script> alert('您还没有登录!'); history.go(-1);</script>");
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }
        }
        [HttpGet]
        public ActionResult Video()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Video(Video video)
        {
            HttpPostedFileBase postimageBase = Request.Files["img"];
            HttpPostedFileBase postvideoBase = Request.Files["VideoFile"];
            if (ModelState.IsValid)
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        if (postimageBase != null)
                        {
                            string filePath = postimageBase.FileName;
                            string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                            string serverpath = Server.MapPath(@"../images/Video/") + filename;
                            string relativepath = @"../images/Video/" + filename;
                            postimageBase.SaveAs(serverpath);
                            video.Video_img = relativepath;
                        }

                        else
                        {
                            return Content("<script>;alert('请先上传封面！');history.go(-1)</script>");

                        }
                        if (postvideoBase != null)
                        {
                            string filePath = postvideoBase.FileName;
                            string fileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                            string serverpath = Server.MapPath(@"../Video/") + fileName;
                            string relativepath = @"../Video/" + fileName;
                            postvideoBase.SaveAs(serverpath);
                            video.Video_url = relativepath;
                        }

                        else
                        {
                            return Content("<script>;alert('视频没有上传！');history.go(-1)</script>");

                        }
                        video.User_id = Convert.ToInt32(Session["userid"].ToString());
                        //publish_food.Amount = 0;
                        video.Addtime = System.DateTime.Now;
                        video.Collection = 0;
                        video.ReadCount = 0;
                        db.Video.Add(video);
                        db.SaveChanges();
                        //return Content("<script>;alert('分享成功!');window.location.href='/Publish_Food/Index_PF'</script>");
                        return Content("<script>;alert('发布成功!');history.go(-1)</script>");
                    }
                    else
                    {
                        return Content("<script>;alert('发布失败！');history.go(-1)</script>");
                    }
                }
                catch (Exception ex)
                {
                    return Content(ex.Message);
                }

            }
            return View();
        }
        public ActionResult Post()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Post(Post fs)
        {
            try
            {
                HttpPostedFileBase postimageBase = Request.Files["img"];
                if (Session["user"] != null)
                {
                    if (postimageBase != null)
                    {
                        string filePath = postimageBase.FileName;
                        string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                        string serverpath = Server.MapPath(@"/images/Post/") + filename;
                        string relativepath = @"/images/Post/" + filename;
                        postimageBase.SaveAs(serverpath);
                        fs.Post_img = relativepath;
                        fs.Collection = 0;
                        fs.ReadCount = 0;
                        fs.User_id = (int)Session["userid"];
                        if (fs.Post_content != null && fs.Post_title != null)
                        {
                            db.Post.Add(fs);
                            db.SaveChanges();
                            return Content("<script> alert('发布帖子成功！'); history.go(-1)</script>");
                        }
                        else { return Content("发布内容有为空!"); }


                    }
                    else
                    {
                        return Content("<script>;alert('请先上传帖子图片！');history.go(-1)</script>");
                    }
                }


                else
                {
                    return Content("<script> alert('您还没有登录!'); history.go(-1);</script>");
                }
            }
            catch (Exception ex)
            {
                return Content(ex.Message);
            }
        }
    }
}