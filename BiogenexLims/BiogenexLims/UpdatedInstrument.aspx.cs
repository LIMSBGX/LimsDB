using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CaliberEdap_Sample;

namespace BiogenexLims
{
    public partial class UpdatedInstrument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ValidateAndSubmitData();
                return;
            }
            else
            {
                string InsID = null;
                if (Request.QueryString["INSID"] != null && Request.QueryString["INSID"] != string.Empty)
                  InsID = Request.QueryString["INSID"];  
  
               InstDescTxt.Text=null;
               InstIdTxt.Text = null;
               txtInsRemarks.Text=null;
               InsIP.Text= null;

               if (!String.IsNullOrEmpty(InsID))
               {
                   string query = "SELECT INS_UCODE,INS_DESC,INS_IP,INS_REMARKS FROM INS_DET_MAST where INS_ID=" + InsID  ;
                   DataSet ds = (DataSet)DBUtil.GetData(query);
                   int count = ds.Tables[0].Rows.Count;
                   if (count > 0)
                   {
                       InstDescTxt.Text = ds.Tables[0].Rows[0].Field<string>("INS_DESC");
                       InstIdTxt.Text = ds.Tables[0].Rows[0].Field<string>("INS_UCODE");
                       txtInsRemarks.Text = ds.Tables[0].Rows[0].Field<string>("INS_REMARKS");
                       InsIP.Text = ds.Tables[0].Rows[0].Field<string>("INS_IP"); ;
                   }
                }
            }

        }

        void ValidateAndSubmitData()
        {
            string InsDesc = null;
            string InsID = null;
            string strInsIP = null;
            string dtCurrent = DateTime.Now.ToString();
            string InsRemarks = null;
            InsID = InstIdTxt.Text;

            if (!String.IsNullOrEmpty(InsID))
            {
                  InsDesc = InstDescTxt.Text;
                  InsID = InstIdTxt.Text;
                  InsRemarks = txtInsRemarks.Text;
                  strInsIP = InsIP.Text;

                  //if (!String.IsNullOrEmpty(InsID))
                  {
                      /*string query = "SELECT INS_UCODE,INS_DESC,INS_IP,INS_REMARKS FROM INS_DET_MAST where INS_UCODE='" + InsID+"'";
                      DataSet ds = (DataSet)DBUtil.GetData(query);
                      int count = ds.Tables[0].Rows.Count;
                      if (count > 0)
                      {
                          INSIDError.Text = "Id Already Exist";
                          return;
                      }*/



                      string InsQuery = @"Update INS_DET_MAST  set " + "INS_DESC='" + InsDesc + "',INS_IP='" + strInsIP + "',INS_REMARKS='" + InsRemarks + "' where INS_UCODE='" + InsID + "'";
                      try
                      {
                          DBUtil.executeQuery(InsQuery);
                          InstIdTxt.Text = "";
                          InstDescTxt.Text = "";
                          txtInsRemarks.Text = "";
                          Response.Redirect("InstrumentDet.aspx");
                      }
                      catch (Exception e)
                      {

                      }
                  }
            }
        }
    }
}