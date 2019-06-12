using MVCRazorDemo.YZM;
using System.Web.Mvc;

namespace MVCRazorDemo.Controllers
{

    public class YZMController : Controller
    {
        // GET: YZM
        public ActionResult Index()
        {
            return View();
        }
        public FileContentResult GetYZM()
        {
            MVCRazorDemo.YZM.ValidateCode vCode = new ValidateCode();
            string code = vCode.CreateValidateCode(4);
            Session["ValidateCode"] = code;
            byte[] bytes = vCode.CreateValidateGraphic(code);
            return File(bytes, @"image/jpeg");
        }

        /// <summary>
        /// 输入验证
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public string Check(string input)
        {
            string code = Session["ValidateCode"].ToString();
            if (input.Trim() == code.ToLower().Trim())
            {
                return "true";
            }
            return "false";
        }
    }
}