using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaliberEdap_Sample
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = null;
            HttpCookie reqCookies = Request.Cookies["userInfo"];

            if (reqCookies != null)
            {

                userId = reqCookies["UserName"].ToString();
                user.InnerText = userId;
            }

            if (string.IsNullOrEmpty(userId))
            {
                Response.Redirect("UserLogin.aspx");
            }

        }

        [System.Web.Services.WebMethod]
        public void MenuButtonClick(object sender, EventArgs e)
        {
            Button btnNewReq = (Button)sender;
            string btnId = btnNewReq.ID.ToString().ToLower();
            string urlIframe = null;
            switch (btnId)
            {
                case "Dashboard":
                    urlIframe = "New-Dashboard.aspx";
                    break;
                case "protocolinfo":
                    urlIframe = "ProtocolDet.aspx";
                    break;
                case "consumableinformation":
                    urlIframe = "ConsumablesPage.aspx";
                    break;
                case "updateconsumables":
                    urlIframe = "UpdateConsumables.aspx";
                    break;
                case "ReagentInfo":
                    urlIframe = "ReagentInfo.aspx";
                    break;
                case "samplerequest":
                    urlIframe = "SampleRequest.aspx";
                    break;
                case "sampleacceptence":
                    urlIframe = "SampleRequestListForAcceptence.aspx";
                    break;
                case "sampleacceptedlist":
                    urlIframe = "SampleAcceptanceList.aspx";
                    break;
                case "samplerequestlist":
                    urlIframe = "SampleRequestList.aspx";
                    break;
                case "userslist":
                    urlIframe = "userlist.aspx";
                    break;
                case "samplereport":
                    urlIframe = "SampleRunStatus.aspx";
                    break;
                case "insreg":
                    urlIframe = "InstrumentDet.aspx";
                    break;
                case "reagentinfo":
                    urlIframe = "ReagentInformation.aspx";
                    break;
                case "pipetteifno":
                    urlIframe = "PipetteInformation.aspx";
                    break;
                case "coveslipinfo":
                    urlIframe = "CoverslipInfo.aspx";
                    break;
                case "bufferinfo":
                    urlIframe = "BufferInformation.aspx";
                    break;
                default:
                    urlIframe = "New-dashboard.aspx";
                    break;
            }
            AppBody.Attributes.Add("src", urlIframe);
        }

        protected void Logout_Click(object sender, ImageClickEventArgs e)
        {

            if (Response.Cookies["userInfo"] != null)
            {
                Response.Cookies["UserName"].Value = string.Empty;
                Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
            }
            Response.Redirect("userlogin.aspx");
        }

        private void ValidateUser()
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies == null)
            {
                Response.Redirect("userlogin.aspx");
            }
        }
    }
}