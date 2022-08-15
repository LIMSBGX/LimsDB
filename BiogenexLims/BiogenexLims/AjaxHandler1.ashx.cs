using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaliberEdap_Sample
{
    /// <summary>
    /// Summary description for AjaxHandler1
    /// </summary>
    public class AjaxHandler1 : IHttpHandler
    {
        private string ErrorMessage;
        public void ProcessRequest(HttpContext context)
        {
            ErrorMessage = string.Empty;
            int InstId = Int32.Parse(context.Request.QueryString["InstId"]);
            int Status = Int32.Parse(context.Request.QueryString["Status"]);
            int StatusType = Int32.Parse(context.Request.QueryString["StatusType"]);
            string resString = string.Empty;
            context.Response.ClearContent();
            context.Response.ContentType = "";

            if (StatusType == 1)
            {

                if (updateInstStatus(InstId, Status))
                    context.Response.Write("Status Updated " + InstId);
                else
                    context.Response.Write(ErrorMessage);
            }
            else
            {
                if (updateProtocolStatus(InstId, Status))
                    context.Response.Write("Status Updated " + InstId);
                else
                    context.Response.Write(ErrorMessage);
            }
            context.Response.End();


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


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}