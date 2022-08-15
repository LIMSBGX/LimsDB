using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 
            if (IsPostBack)
            {
                ValidateAndSubmitData();
            }

            else
            {
                string UserID = null;
                if (Request.QueryString["UserID"] != null && Request.QueryString["UserID"] != string.Empty)
                    UserID = Request.QueryString["UserID"];

                    textUserID.Text = null;
                    txtName.Text = null;
                    txtEmail.Text = null;
                    txtPassword.Text = null;
                    txtConfirmPassword.Text = null;

                    if (!String.IsNullOrEmpty(UserID))
                    {
                        string query = "SELECT LM_USERID,LM_USERNAME,LM_EMAIL,LM_PASSWORD FROM LM_USER where ID=" + UserID;
                        DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
                        int count = ds.Tables[0].Rows.Count;
                        if (count > 0)
                        {
                            textUserID.Text = ds.Tables[0].Rows[0].Field<string>("LM_USERID");
                            txtName.Text = ds.Tables[0].Rows[0].Field<string>("LM_USERNAME");
                            txtEmail.Text = ds.Tables[0].Rows[0].Field<string>("LM_EMAIL");
                            txtPassword.Text = ds.Tables[0].Rows[0].Field<string>("LM_PASSWORD");
                            txtConfirmPassword.Text = ds.Tables[0].Rows[0].Field<string>("LM_PASSWORD");
                            //LM_USERID,LM_USERNAME, LM_EMAIL, LM_PASSWORD,LM_REGDATE
                           /* InstDescTxt.Text = ds.Tables[0].Rows[0].Field<string>("INS_DESC");
                            InstIdTxt.Text = ds.Tables[0].Rows[0].Field<string>("INS_UCODE");
                            txtInsRemarks.Text = ds.Tables[0].Rows[0].Field<string>("INS_REMARKS");
                            InsIP.Text = ds.Tables[0].Rows[0].Field<string>("INS_IP"); ;*/
                        }
                    }
                }

        }

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

                string query = "update LM_USER Set LM_USERID ='" + texUserID + "'" + " , LM_USERNAME='" + texUserName + "'" + ",LM_EMAIL='" + texUserEmail + "'" + " ,LM_PASSWORD='" + texUserPassword + "'" + "  where LM_USERID='" + texUserID + "'";
                CaliberEdap_Sample.DBUtil.executeQuery(query);

            }

            return true;

        }
    }
}