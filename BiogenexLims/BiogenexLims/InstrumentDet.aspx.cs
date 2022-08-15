using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class InstrumentDet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                  // Validate initially to force asterisks
                  // to appear before the first roundtrip.
                 // Validate();
                
                ValidateAndSubmitData();

            }
            LoadExistingRecords();

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
                string query = "SELECT * FROM INS_DET_MAST where INS_UCODE='" + InsID+"'";
                DataSet ds = (DataSet)DBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    INSIDError.Text = "Id Already Exist";
                    return;
                }
                else
                {
                    InsDesc=InstDescTxt.Text;
                    InsID=InstIdTxt.Text;
                    //InsRemarks = txtInsRemarks.Text;
                    strInsIP = InsIP.Text;
                    string InsQuery = @"insert into INS_DET_MAST (INS_UCODE	,INS_DESC,INS_IP,INS_REMARKS,INS_REG_ON) values ('" + InsID + "','" + InsDesc + "','" + strInsIP + "','" + InsRemarks + "','" + dtCurrent + "')";
                    try
                    {
                        DBUtil.executeQuery(InsQuery);
                        InstIdTxt.Text = "";
                        InstDescTxt.Text = "";
                        //txtInsRemarks.Text = "";
                        Response.Redirect("InstrumentDet.aspx");
                    }
                    catch (Exception e)
                    {

                    }
                }
              }
          }
        
        public void LoadExistingRecords()
        {
            DataSet ds = null;
            string query = "SELECT INS_ID,INS_UCODE	,INS_DESC,INS_IP,INS_REMARKS,INS_STATUS,INS_REG_ON FROM INS_DET_MAST";
            try
            {
                ds = DBUtil.GetData(query);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception e)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+e.Message.ToString()+"')", true);
            }

        }

        public void GridView_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Display the company name in italics.
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string text1 = null,text2=null;
                text1="<span  id='span-" + dr.Row.ItemArray[1] + "' style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[6].Text + "," + (e.Row.RowIndex + 1).ToString() + ",1)'" + "> Delete </span>  ";
                text2 = "<span  id='span-" + dr.Row.ItemArray[1] + "' style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "Update(" + dr.Row.ItemArray[0] + ")" + "> Update </span><span>|</span>";
                e.Row.Cells[6].Text = text2 + text1;
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex+1).ToString();

            }

        }
    }
}