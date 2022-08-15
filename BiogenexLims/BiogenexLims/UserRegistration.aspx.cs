using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                // Validate initially to force asterisks
                // to appear before the first roundtrip.
                // Validate();
                
                ValidateAndSubmitData();

            }
        }
            //LoadExistingRecords();

        bool ValidateAndSubmitData()
        {

            string texUserName = txtName.Text;
            string texUserID = textUserID.Text;
            string texUserEmail = txtEmail.Text;
            string texUserPassword = txtPassword.Text;

            string dtCurrent = DateTime.Now.ToString();
            
            if (String.IsNullOrEmpty(texUserID) || String.IsNullOrEmpty(texUserName) || String.IsNullOrEmpty(texUserID)
                || String.IsNullOrEmpty(texUserEmail) || String.IsNullOrEmpty(texUserPassword))
            {
                return false;
            }

            if (!String.IsNullOrEmpty(texUserID))
            {
                string query = "SELECT LM_USERID,LM_PASSWORD FROM LM_USER where LM_USERID='" + texUserID + "'";
                DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    ErrorMessgae.Text = "Id Already Exist";
                        return false;
                }
                else
                {
                    string date = DateTime.Today.Date.ToString("yyyy-MM-dd");

                  //  string formatForMySql = dateValue.ToString("yyyy-MM-dd HH:mm");

                    //string InsQuery = "insert into lm_user values('" + texUserID + "', '" + texUserName + "', '" + texUserEmail + "','" + texUserPassword + "',STR_TO_DATE('" + date + "','%y-%m-%d'))";

                    string InsQuery = "insert into lm_user (LM_USERID,LM_USERNAME,LM_EMAIL,LM_PASSWORD,LM_REGDATE) values('" + texUserID + "', '" + texUserName + "', '" + texUserEmail + "','" + texUserPassword + "','" + date + "')";
                    /*@"insert into lm_user (LM_USERID	,LM_USERNAME,LM_EMAIL,LM_PASSWORD,LM_REGDATE) values (InsID,InsDesc,InsRemarks,dtCurrent)";*/
                    try
                    {
                        CaliberEdap_Sample.DBUtil.executeQuery(InsQuery);
                        Response.Redirect("UserLogin.aspx");
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