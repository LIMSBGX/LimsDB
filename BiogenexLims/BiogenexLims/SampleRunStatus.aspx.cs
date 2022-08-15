using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CaliberEdap_Sample;
using System.Data;

namespace BiogenexLims
{
    public partial class SampleRunStatus : System.Web.UI.Page
    {
        string fromdate = string.Empty;
        string todate = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                fromdate = datepickerFrom.Value;
                todate = datepickerTO.Value;
                try
                {
                    todate = DateTime.Parse(todate).AddDays(1).ToString("MM/dd/yyyy");
                }
                catch (Exception)
                {
                }
                LoadExistingRecords(fromdate, todate);
            }
            else
            {
                datepickerTO.Value = DateTime.Now.ToString("MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                datepickerFrom.Value = DateTime.Today.AddDays(-15).ToString("MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                LoadExistingRecords();
            }

        }

        public void SyncRunStatus(object sender, EventArgs e)
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
            //LoadExistingRecords();
        }

        public string GetSystemIp()
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

        public void LoadExistingRecords()
        {
            System.Data.DataSet ds = null;
            string query = "select SMP_ACP_ID,SMP_ACP_PRT_DESC,SMP_ACP_REQ_NUM,SMP_ACP_PRT_UCODE,SMP_ACP_PHY_NME,SMP_ACP_PAT_ID,SMP_ACP_EXT_REF,SMP_ACP_REMARKS,SMP_ACP_INST_ID,SMP_ACP_SPL_OBS,SMP_ACP_REG_ON,SMP_ACP_PRINTED,SMP_ACP_RUNSTATUS  from  SMP_ACP_MAST where datediff('d',SMP_ACP_REG_ON,DATE())<15 order by SMP_ACP_REG_ON desc";
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


        public void LoadExistingRecords(string dfrom, string dTo)
        {
            System.Data.DataSet ds = null;
            string query = "select SMP_ACP_ID,SMP_ACP_PRT_DESC,SMP_ACP_REQ_NUM,SMP_ACP_PRT_UCODE,SMP_ACP_PHY_NME,SMP_ACP_PAT_ID,SMP_ACP_EXT_REF,SMP_ACP_REMARKS,SMP_ACP_INST_ID,SMP_ACP_SPL_OBS,SMP_ACP_REG_ON,SMP_ACP_PRINTED,SMP_ACP_RUNSTATUS  from  SMP_ACP_MAST where SMP_ACP_REG_ON >= " + "#" + dfrom + "# and SMP_ACP_REG_ON <= " + "#" + dTo + "# order by SMP_ACP_REG_ON desc";
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

                System.Data.DataRowView dr = (System.Data.DataRowView)e.Row.DataItem;
               /* if (e.Row.Cells[9].Text == "0")
                    e.Row.Cells[9].Text = "<span   style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + dr.Row.ItemArray[0] + "," + (e.Row.RowIndex + 1).ToString() + ",0)'" + "> Print </span>";
                else
                    e.Row.Cells[9].Text = "<span   style=" + "'color:red;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + dr.Row.ItemArray[0] + "," + (e.Row.RowIndex + 1).ToString() + ",0)'" + "> Printed </span>";
                */
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();

            }

        }
    }
}