using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class SampStsRpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sampleID = string.Empty;
            if (IsPostBack)
            {
                sampleID = ReqNoTxt.Text;

                if (!string.IsNullOrEmpty(sampleID))
                {
                    LoadExistingRecords(sampleID);
                }
            }

        }


        public void LoadExistingRecords(string Id)
        {
            DataSet ds = null;
            string query = "SELECT TxID,PhysicianName,PatientName,StartTime,Comment,RunNumber,slidenumber from Slide where TxID='" + Id + "'";

            
            
            try
            {
                UpdateslidePatientID(Id);
                ds = DBUtil.GetDataFromReports(query);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                    ReqNoLbl.Text = "Inavalid Request No";
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
                e.Row.Cells[5].Text = "<a style='color:Blue;font-weight:bold;cursor:hand' runat='server' href='RunLogReport.aspx?sampleId=" + dr.Row.ItemArray[0] + "&RunNumber=" + dr.Row.ItemArray[5] + "&SlideNumber=" + dr.Row.ItemArray[6] + "'>" + e.Row.Cells[5].Text + "</a>";
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = (e.Row.RowIndex + 1).ToString();

            }

        }

        public void  UpdateslidePatientID(string Id)
       {
            DataSet ds = null;
            string patientID = string.Empty;
            string physicianName = string.Empty;
            int sampleupdated=0;
            string query = "SELECT SMP_ACP_PHY_NME,SMP_ACP_PAT_ID,SMP_ACP_UPDATED from SMP_ACP_MAST where SMP_ACP_REQ_NUM='" + Id + "'";
            ds = DBUtil.GetData(query);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    physicianName = ds.Tables[0].Rows[0].ItemArray[0].ToString();
                    patientID = ds.Tables[0].Rows[0].ItemArray[1].ToString();
                    sampleupdated = Int16.Parse(ds.Tables[0].Rows[0].ItemArray[2].ToString());
                    if (sampleupdated==0)
                    {
                        query = "Update Slide Set PhysicianName='" + physicianName + "'" + ",PatientName='" + patientID + "'" + " where TxID='" + Id + "'";
                        DBUtil.executeReportQuery(query);
                        query = "Update SMP_ACP_MAST Set SMP_ACP_UPDATED=1 where SMP_ACP_REQ_NUM='" + Id + "'";
                        DBUtil.executeQuery(query);
                      //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Data Updated')", true);
                    }

                }

       }



    }
}