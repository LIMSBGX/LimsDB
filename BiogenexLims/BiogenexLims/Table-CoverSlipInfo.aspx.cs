using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class Table_CoverSlipInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadExistingRecords();
        }
        public void LoadExistingRecords()
        {
            System.Data.DataSet ds = null;
            string query = "SELECT LM_COVERSLIPTYPE,LM_CONSUMED,LM_EntryStock, FORMAT(LM_STOCKUPDATED, 'dd-MM-YYYY') as LM_STOCKUPDATED  FROM lm_coverslip";//" where LM_INSID='" + InsId + "'";
            try
            {
                ds = CaliberEdap_Sample.DBUtil.GetData(query);
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
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string text1 = null, text2 = null;
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();

            }

        }
    }
}