using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class UserList : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["userInfo"] == null)
            {
                Response.Redirect("userlogin.aspx");
            }

            LoadExistingRecords();

        }

        public void LoadExistingRecords()
        {
            System.Data.DataSet ds = null;
            string query = "SELECT ID,LM_USERID,LM_USERNAME, LM_EMAIL, LM_PASSWORD,LM_REGDATE FROM LM_USER";
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
                text1 = "<span  id='span-" + dr.Row.ItemArray[1] + "' style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + dr.Row.ItemArray[0] + ",0," + (e.Row.RowIndex + 1).ToString() + ",1)'" + "> Delete </span>  ";
                text2 = "<span  id='span-" + dr.Row.ItemArray[1] + "' style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "Update(" + dr.Row.ItemArray[0] + ")" + "> Update </span><span>|</span>";
                // e.Row.Cells[6].Text = text2 + text1;
                Label lblAction = (Label)e.Row.FindControl("lblAction");
                lblAction.Text = text2 + text1;


                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();

            }

        }



    }
}