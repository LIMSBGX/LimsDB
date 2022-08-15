using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaliberEdap_Sample
{
    public partial class prtAjax : System.Web.UI.Page
    {

        public string ErrorMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorMessage = string.Empty;
            int InstId = Int32.Parse(Request.QueryString["InstId"]);
            int Status = Int32.Parse(Request.QueryString["Status"]);
            int StatusType = Int32.Parse(Request.QueryString["StatusType"]);
            string resString = string.Empty;
            Response.ClearContent();
            Response.ContentType = "";

            if (StatusType == 1)
            {
                if (deleteInstrumentRecord(InstId, Status)) //update status
                    Response.Write("Status Updated");
                else
                    Response.Write(ErrorMessage);
            }
            else
            {
                if (updateProtocolStatus(InstId, Status))
                    Response.Write("Status Updated");
                else
                    Response.Write(ErrorMessage);
            }
            Response.End();
        }


        
        [System.Web.Services.WebMethod]
        public string updateStatus(List<int> Data)
        {
            ErrorMessage = string.Empty;
            int InstId = Int32.Parse(Request.QueryString["InstId"]);
            int Status = Int32.Parse(Request.QueryString["Status"]);
            int StatusType = Int32.Parse(Request.QueryString["StatusType"]);
            string resString = string.Empty;
            Response.ClearContent();
            Response.ContentType = "";
            if(deleteInstrumentRecord(InstId, Status))
                Response.Write("Status Updated");
            /* if (StatusType == 1)
            {

                if (updateInstStatus(InstId, Status))
                    Response.Write("Status Updated");
                else
                    Response.Write(ErrorMessage);
            }
            else
            {
                if (updateProtocolStatus(InstId, Status))
                    Response.Write("Status Updated");
                else
                    Response.Write(ErrorMessage);
            }*/
            Response.End();
            return "";
 
        }

        
        [System.Web.Services.WebMethod]
        public string updateUserStatus(List<int> Data)
        {
            ErrorMessage = string.Empty;
            int InstId = Int32.Parse(Request.QueryString["UserID"]);
            int StatusType = Int32.Parse(Request.QueryString["StatusType"]);
            string resString = string.Empty;
            Response.ClearContent();
            Response.ContentType = "";
            if(deleteUser(InstId))
                Response.Write("User Record Deleted");
           
            Response.End();
            return "";
 
        }

        public bool deleteUser(int id)
        {
            string query = string.Empty;
            query = " delete from LM_USER WHERE ID=" + id;
            try
            {
                DBUtil.executeQuery(query);
                return true;
            }
            catch (Exception e)
            {
                ErrorMessage = e.Message.ToString();
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
                return false;
            }
           
        }



        public bool updateProtocolStatus(int id, int status)
        {
            string query = string.Empty;
            if (status == 0)
                query = " Update PRT_DET_MAST Set PRT_STATUS=1 WHERE PRT_ID=" + id;
            else
                query = " Update PRT_DET_MAST Set PRT_STATUS=0 WHERE PRT_ID=" + id;
            
            try
            {
                DBUtil.executeQuery(query);
                return true;
            }
            catch (Exception e)
            {
                ErrorMessage = e.Message.ToString();
             //   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
                return false;
            }
        }
        [System.Web.Services.WebMethod]
        public bool PrintProtcolLabels(int id, int status)
        {
            string query = string.Empty;
            if (status == 0)
                query = " Update PRT_DET_MAST Set PRT_STATUS=1 WHERE PRT_ID=" + id;
            else
                query = " Update PRT_DET_MAST Set PRT_STATUS=0 WHERE PRT_ID=" + id;

            try
            {
                DBUtil.executeQuery(query);
                return true;
            }
            catch (Exception e)
            {
                ErrorMessage = e.Message.ToString();
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
                return false;
            }
        }



        public bool deleteInstrumentRecord(int id, int status)
        {
            string query = string.Empty;
            query = " delete from INS_DET_MAST WHERE INS_ID=" + id;
            try
            {
                 DBUtil.executeQuery(query);
                 return true;
            }
            catch (Exception e)
            {
                 ErrorMessage = e.Message.ToString();
                 //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
                 return false;
            }
            return true;
        }
        public bool updateInstStatus(int id, int status)
        {
            string query = string.Empty;
            if (status == 0)
                query = " Update INS_DET_MAST Set INS_STATUS=1 WHERE INS_ID=" + id;
            else
                query = " Update INS_DET_MAST Set INS_STATUS=0 WHERE INS_ID=" + id;
            try
            {
                DBUtil.executeQuery(query);
                return true;
            }
            catch (Exception e)
            {
                ErrorMessage = e.Message.ToString();
                //   ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
                return false;
            }
        }


    }
}