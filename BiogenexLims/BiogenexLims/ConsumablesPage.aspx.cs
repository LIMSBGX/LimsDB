using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiogenexLims
{
    public partial class ConsumablesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public void OnSelectedIndexChangedMethod(object sender, EventArgs e)
        {
            string value = DropDownList1.SelectedItem.Value;
           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + value + "')", true);
            string urlIframe = null;
            switch (value)
            {
                case "SlideInfo"         :   urlIframe = "Table-SlideIfo.aspx";
                                             break;
                case "CoverSlipInfo"     :   urlIframe = "Table-CoverSlipInfo.aspx";
                                             break;
                case "PipetteIno"        :   urlIframe = "Table-pipetteInfo.aspx";
                                             break;
                case "BufferInfo"        :   urlIframe = "Table-BufferInfo.aspx";
                                             break;
                case "UserInfo"          :   urlIframe = "userlist.aspx";
                                             break;
                case "InstrumentInfo"    :   urlIframe = "InstrumentDet.aspx";
                                             break;
                default                  :   urlIframe = "CoverslipInfo.aspx";
                                             break;
            }
            AppBody.Attributes.Add("src", urlIframe);

        }
    }
}