using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiogenexLims
{
    public class HttpSession
    {
        public static void GenerateCookie(string strUserID)
        {

            /*HttpCookie userInfo = new HttpCookie("userInfo");
            userInfo["UserName"] = strUserID;
            userInfo.Expires = DateTime.Now.AddHours(10);
            Response.Cookies.Add(userInfo);  */

        }


        public static string GetCookie()
        {
            string strUsername = null;

            return strUsername;
            /*

            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null)
            {
                User_name = reqCookies["UserName"].ToString();
                User_color = reqCookies["UserColor"].ToString();
            }*/  
        }
    }
}