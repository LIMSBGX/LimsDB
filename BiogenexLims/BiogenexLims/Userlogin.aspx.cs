using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class Userlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {

                MySql.Data.MySqlClient.MySqlConnection con = SQLDBUtil.GetConnection();
                string strUserID = textUserID.Text;
                string strPassword = txtPassword.Text;
                string dtCurrent = DateTime.Now.ToString();


                //HttpCookie userInfoTest = new HttpCookie("userInfo");
                //userInfoTest["UserName"] = "Test";
                //userInfoTest.Expires = DateTime.Now.AddHours(10);
                //Response.Cookies.Add(userInfoTest);
                //Response.Redirect("MainPage.aspx");

                if (!String.IsNullOrEmpty(strUserID))
                {
                    string query = "SELECT LM_USERID,LM_PASSWORD FROM lm_User where LM_USERID='" + strUserID + "'";
                    DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
                    int count = ds.Tables[0].Rows.Count;
                    if (count > 0)
                    {
                        string strExtuserid = null;
                        string strExtPassword = null;
                        try
                        {
                            strExtuserid = ds.Tables[0].Rows[0]["LM_USERID"].ToString();
                            strExtPassword = ds.Tables[0].Rows[0]["LM_PASSWORD"].ToString();
                        }
                        catch (Exception ex)
                        {
                        }

                        if (strUserID == strExtuserid && strPassword == strExtPassword)
                        {

                            HttpCookie userInfo = new HttpCookie("userInfo");
                            userInfo["UserName"] = strExtuserid;
                            userInfo.Expires = DateTime.Now.AddHours(10);
                            Response.Cookies.Add(userInfo);
                            //Session["UserName"] = strExtuserid;
                            Response.Redirect("MainPage.aspx");
                        }
                        else
                        {
                            ErrorMessgae.Text = "Invalid UserID or Password";
                        }
                        return;
                    }
                    else
                    {
                        ErrorMessgae.Text = "Invalid UserID";
                        
                    }


                }
            }


        }
    }
}
 
 