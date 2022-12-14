using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class SampleRequestListForAcceptence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadExistingRecords();

        }

        public void LoadExistingRecords()
        {
            System.Data.DataSet ds = null;
            string query = "SELECT SMP_REQ_ID,SMP_REQ_UCODE,SMP_REQ_PHY_NME,SMP_REQ_PATIENT_ID,SMP_REQ_REMARKS,SMP_REQ_EXT_REF,SMP_REQ_REG_ON FROM SMP_REQ_MAST";
            try
            {

                ds = DBUtil.GetData(query);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception e)
            {
            }

        }

        public void GridView_RowDataBound(Object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                e.Row.Cells[1].Text = "<a   style='color:Blue;font-weight:bold;cursor:hand' runat='server' href='SampleAcceptance.aspx?sampleId=" + dr.Row.ItemArray[0] + "'>" + e.Row.Cells[1].Text + "</a>";
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();

            }

        }


    }
}