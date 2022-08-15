using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class InstrumentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
              
                ValidateAndSubmitData();
            }
        }

        bool ValidateAndSubmitData()
        {

           
            string strInsID = texInsID.Text;
            string strUseid="biogenex";
            string strInsname = txtInsName.Text;
            string strDescription= txtInsDescription.Text;
            string strInsIP = txtInsIP.Text;

            string dtCurrent = DateTime.Now.ToString();
            
            if (String.IsNullOrEmpty(strInsID) || String.IsNullOrEmpty(strInsname) || String.IsNullOrEmpty(strDescription)
                || String.IsNullOrEmpty(strInsIP))
            {
                return false;
            }

            if (!String.IsNullOrEmpty(strInsID))
            {
                string query = "SELECT INSID,name FROM lm_instrument where INSID='" + strInsID + "'";
                DataSet ds = (DataSet)SQLDBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    ErrorMessgae.Text = "This Instrument Already Exist";
                        return false;
                }
                else
                {
                    string date = DateTime.Today.Date.ToString("yyyy-MM-dd");

                  //  string formatForMySql = dateValue.ToString("yyyy-MM-dd HH:mm");

                    //string InsQuery = "insert into lm_user values('" + texUserID + "', '" + texUserName + "', '" + texUserEmail + "','" + texUserPassword + "',STR_TO_DATE('" + date + "','%y-%m-%d'))";


                    string InsQuery = "insert into lm_instrument values('" + strInsID + "', '" + strUseid + "', '" + strInsname + "','" + strDescription + "','" + strInsIP + "','" + date + "','" + date + "')";
                    /*@"insert into lm_user (userid	,INS_DESC,INS_REMARKS,INS_REG_ON) values (InsID,InsDesc,InsRemarks,dtCurrent)";*/
                    try
                    {
                        SQLDBUtil.executeQuery(InsQuery);
                        Response.Redirect("InstrumentInfo.aspx");
                    }
                    catch (Exception ex)
                    {

                        ErrorMessgae.Text = ex.Message.ToString();

                    }
                 }
                    

            }

            return true;

        }

        }
    }
