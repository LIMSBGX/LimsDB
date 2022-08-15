using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiogenexLims;

namespace CaliberEdap_Sample
{
    public partial class ProtocolDet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // Validate initially to force asterisks
                // to appear before the first roundtrip.
               // Validate();
                //string data = null;
                //ValidateAndSubmitData();
             }
            LoadExistingRecords();

        }
        void ValidateAndSubmitData()
        {
            string InsDesc = null;
            string InsID = null;
            string dtCurrent = DateTime.Now.ToString();
            string InsRemarks = null;
           // InsID = PrtIdTxt.Text;
          
            if (!String.IsNullOrEmpty(InsID))
            {
                string query = "SELECT * FROM PRT_DET_MAST where PRT_UCODE='" + InsID+"'";
                DataSet ds = (DataSet)DBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                   // PRTIDError.Text = "Id Already Exist";
                                        
                    return;
                }
                else
                {
                   
                    try
                    {
                        string InsQuery = @"insert into PRT_DET_MAST (PRT_UCODE	,PRT_DESC,PRT_REMARKS,PRT_REG_ON) values ('" + InsID + "','" + InsDesc + "','" + InsRemarks + "','" + dtCurrent + "')";
                        DBUtil.executeQuery(InsQuery);
              
                        Response.Redirect("ProtocolDet.aspx");
                    }
                    catch (Exception e)
                    {
                    }
                }
            }

        }

        public void SyncProtocols(object sender, EventArgs e)
        {
            string strFileServer = string.Empty;
            strFileServer = GetSystemIp();
            if (strFileServer != null)
                PotocolsSynchronise.UpdateDatFile(strFileServer);
            else
            {
                string strMessage = "Instrument Adress Is Empty. Please verify instuement IP from instrument information";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + strMessage + "')", true);
            }
            LoadExistingRecords();
        }

        public void LoadExistingRecords()
        {
            DataSet ds = null;
            string query = "SELECT PRT_ID,PRT_UCODE,PRT_NAME,PRT_SNO_CNT,PRT_REMARKS,PRT_TYPE2,PRT_STATUS,PRT_REG_ON FROM PRT_DET_MAST";
            try
            {
                ds = DBUtil.GetData(query);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception e)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
            }
        }

        public void GridView_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Display the company name in italics.
                DataRowView dr = (DataRowView)e.Row.DataItem;
               
                if (e.Row.Cells[5].Text == "0")
                    e.Row.Cells[5].Text = "<span   style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[5].Text + "," + (e.Row.RowIndex + 1).ToString() + ",0)'" + "> Active </span>";
                else
                    e.Row.Cells[5].Text = "<span   style=" + "'color:red;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[5].Text + "," + (e.Row.RowIndex + 1).ToString() + ",0)'" + "> IN Active </span>";
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();
            }
        }

        public string  GetSystemIp()
        {
            string strSysIp = string.Empty;
            string query = "SELECT * FROM INS_DET_MAST";
            try
            {
                DataSet ds = (DataSet)DBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    strSysIp = ds.Tables[0].Rows[0]["INS_IP"].ToString();
                }
            }
            catch (Exception e)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
            }
            return strSysIp;
        }


        public void LoadSearchgRecords(object sender, EventArgs eArgs)
        {
            string protocolId;
            int Limit=0;
            protocolId = FindTxt.Text;
            if (!string.IsNullOrEmpty(FetchSizeTxt.Text))
                Limit = Int32.Parse(FetchSizeTxt.Text);
            DataSet ds = null;
            if (Limit <= 0)
                Limit = 100;

            if (protocolId.StartsWith("%"))
                protocolId = "'" + protocolId + "%'";
            else
                protocolId = "'%" + protocolId + "%'";

            string query = "SELECT PRT_UCODE,PRT_NAME,PRT_REMARKS,PRT_STATUS,PRT_REG_ON FROM PRT_DET_MAST WHERE PRT_UCODE like '%" + protocolId + "  or PRT_NAME like '%" + protocolId + " and PRT_STATUS=0';// Limit 0," + Limit;
            query = "SELECT top " + Limit + " PRT_ID,PRT_UCODE,PRT_NAME,PRT_SNO_CNT,PRT_REMARKS,PRT_TYPE2,PRT_STATUS,PRT_REG_ON FROM PRT_DET_MAST WHERE PRT_STATUS=0 and  ( PRT_NAME like " + protocolId + " or PRT_UCODE like " + protocolId + ")";
            try
            {
                ds = DBUtil.GetData(query);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception e)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
            }
        }
    }
}