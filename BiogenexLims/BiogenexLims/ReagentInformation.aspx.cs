using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class ReagentInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadExistingRecords();
        }

        public void LoadExistingRecords()
        {
            DataSet ds = null;
            string query = "SELECT LM_INSID,LM_REAGENT_CATLOGNUMBER,REAGENT_DESCRIPTION,SERIALNUMBER,LOTNUMBER,EXPIREDATE,REGDATE,STRARTVOLUME,"+"CURRENTVOLUME FROM lm_reagent";
            try
            {
                ds = CaliberEdap_Sample.DBUtil.GetData(query);
                ReagnetGridView.DataSource = ds;
                ReagnetGridView.DataBind();
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
                //DataRowView dr = (DataRowView)e.Row.DataItem;

               /* if (e.Row.Cells[5].Text == "0")
                    e.Row.Cells[5].Text = "<span   style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[5].Text + "," + (e.Row.RowIndex + 1).ToString() + ",0)'" + "> Active </span>";
                else
                    e.Row.Cells[5].Text = "<span   style=" + "'color:red;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[5].Text + "," + (e.Row.RowIndex + 1).ToString() + ",0)'" + "> IN Active </span>";

                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();*/

                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();

            }

        }

        public void LoadSearchgRecords(object sender, EventArgs eArgs)
        {
            string catlog;
            int Limit = 0;
            catlog = FindTxt.Text;
            if (!string.IsNullOrEmpty(FetchSizeTxt.Text))
                Limit = Int32.Parse(FetchSizeTxt.Text);
            DataSet ds = null;
            if (Limit <= 0)
                Limit = 100;

            if (catlog.StartsWith("%"))
                catlog = "'" + catlog + "%'";
            else
                catlog = "'%" + catlog + "%'";



            string query = "SELECT LM_INSID,LM_REAGENT_CATLOGNUMBER,REAGENT_DESCRIPTION,SERIALNUMBER,LOTNUMBER,EXPIREDATE,REGDATE,STRARTVOLUME,CURRENTVOLUME FROM lm_reagent WHERE LM_REAGENT_CATLOGNUMBER like '%" + catlog + "  or REAGENT_DESCRIPTION like '%" + catlog + ";// Limit 0," + Limit;
            query = "SELECT top " + Limit + " LM_INSID,LM_REAGENT_CATLOGNUMBER,REAGENT_DESCRIPTION,SERIALNUMBER,LOTNUMBER,EXPIREDATE,REGDATE,STRARTVOLUME,CURRENTVOLUME FROM lm_reagent WHERE ( LM_REAGENT_CATLOGNUMBER like " + catlog + " or REAGENT_DESCRIPTION like " + catlog + ")";
            try
            {
                ds = CaliberEdap_Sample.DBUtil.GetData(query);
                ReagnetGridView.DataSource = ds;
                ReagnetGridView.DataBind();
            }
            catch (Exception e)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
            }
        }
    }
}