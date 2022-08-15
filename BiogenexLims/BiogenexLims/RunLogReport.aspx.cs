using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    
    public partial class RunLogReport : System.Web.UI.Page
    {
        string ProtocolNumber;
        protected void Page_Load(object sender, EventArgs e)
        {
            int SlideNumber = Int32.Parse(Request.QueryString["SlideNumber"]);
            string RunNumber=Request.QueryString["RunNumber"];
            string sampleId=Request.QueryString["sampleId"];

            LoadExistingRecords(RunNumber, SlideNumber);
            DataSet ds = null ,rds=null;
            string query  = "SELECT * FROM Slide where TxID='" + sampleId + "';";
            string runQuery = " select Rundate ,RunEndDate,StartTime,EndTime,SerialNo from run where RunNumber='" + RunNumber + "'";

            try
            {
                ds = DBUtil.GetDataFromReports(query);
                rds = DBUtil.GetDataFromReports(runQuery);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ReqNoValTd.Text = ds.Tables[0].Rows[0]["TxID"].ToString();
                    RunNoValTd.Text = ds.Tables[0].Rows[0]["RunNumber"].ToString();
                    ProtNoValTd.Text = ProtocolNumber;
                    //  
                  
                    SlidNoValTd.Text = ds.Tables[0].Rows[0]["SlideNumber"].ToString();
                    SStsValTd.Text = ds.Tables[0].Rows[0]["Comment"].ToString();
                    SStDateValTd.Text = ds.Tables[0].Rows[0]["StartTime"].ToString();
                    SEdDateValTd.Text = ds.Tables[0].Rows[0]["EndTime"].ToString();
                }
                if (rds.Tables[0].Rows.Count > 0)
                {
                    SnoValTd.Text = rds.Tables[0].Rows[0]["SerialNo"].ToString();
                    DateTime date = (DateTime)rds.Tables[0].Rows[0]["Rundate"];


                    RStDateValTd.Text = date.ToShortDateString() + " " + ds.Tables[0].Rows[0]["StartTime"].ToString();
                    date = (DateTime)rds.Tables[0].Rows[0]["RunEndDate"];
                    REdDateValTd.Text = date.ToShortDateString() + " " + ds.Tables[0].Rows[0]["EndTime"].ToString();

                }
              
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message.ToString() + "')", true);

            }

 
             
       }
          public void LoadExistingRecords(string Runnumber, int slideno)
        {
            DataSet ds = null;
            string query = "SELECT * FROM RunLog where RunNumber='" + Runnumber + "' and SlideNumBer=" + slideno + " order by ComplexStepNo,BasicStepNo ASC";

            try
            {
                ds = DBUtil.GetDataFromReports(query);
                GridView1.DataSource = ds;
                GridView1.DataBind();

                if (ds != null && ds.Tables[0].Rows.Count > 0)
                    ProtocolNumber = ds.Tables[0].Rows[0].ItemArray[3].ToString();
            }
            catch (Exception e)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+e.Message.ToString()+"')", true);
                
            }

        }

          public void GridView_RowDataBound(Object sender, GridViewRowEventArgs e)
          {

            /*  if (e.Row.RowType == DataControlRowType.DataRow)
              {
                  // Display the company name in italics.
                  if (e.Row.Cells[6].Text == "0")
                      e.Row.Cells[6].Text = "<span  id='span-" + e.Row.Cells[1].Text + "' style=" + "'color:Blue;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + e.Row.Cells[1].Text + "," + e.Row.Cells[6].Text + "," + (e.Row.RowIndex + 1).ToString() + ",1)'" + "> Active </span>";
                  else
                      e.Row.Cells[6].Text = "<span  id='span-" + e.Row.Cells[1].Text + "' style=" + "'color:red;font-weight:bold;cursor:hand'" + "runat=" + "'server'" + "OnClick=" + "'AjaxItemType(" + e.Row.Cells[1].Text + "," + e.Row.Cells[6].Text + "," + (e.Row.RowIndex + 1).ToString() + ",1)'" + "> IN Active </span>";

                  Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                  lblSerial.Text = (e.Row.RowIndex + 1).ToString();

              }*/
          }
    }
}