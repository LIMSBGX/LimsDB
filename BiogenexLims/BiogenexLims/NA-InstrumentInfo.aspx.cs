using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class InstrumentInfo : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadExistingRecords();
        }

        public void LoadExistingRecords()
        {
            System.Data.DataSet ds = null;
            string query = "select INSID, name, description, ip, regdate, Lastmaintenence FROM lm_instrument";

            try
            {
                ds = SQLDBUtil.GetData(query);
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
               /* if (e.Row.Cells[5].Text == "0")
                    e.Row.Cells[5].Text = "<span  id='span-"+ dr.Row.ItemArray[0]+"' style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[5].Text + "," + (e.Row.RowIndex + 1).ToString() + ",1)'" + "> Active </span>";
                else
                    e.Row.Cells[5].Text = "<span  id='span-" + dr.Row.ItemArray[0] + "' style=" + "'color:red;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + "," + e.Row.Cells[5].Text + "," + (e.Row.RowIndex + 1).ToString() + ",1)'" + "> IN Active </span>";
                */
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex+1).ToString();

            }

        }

        [System.Web.Services.WebMethod]
        public void AddNewButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("InstrumentRegistration.aspx");
        }
    }
}