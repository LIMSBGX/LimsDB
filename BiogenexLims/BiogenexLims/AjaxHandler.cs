using System;
using System.Web;

namespace CaliberEdap_Sample
{
    public class AjaxHandler : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members
        public string ErrorMessage;

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            //write your handler implementation here.

       
            ErrorMessage = string.Empty;
            int InstId = Int32.Parse(context.Request.QueryString["InstId"]);
            int Status = Int32.Parse(context.Request.QueryString["Status"]);
            int StatusType = Int32.Parse(context.Request.QueryString["StatusType"]);
            string resString = string.Empty;
            context.Response.ClearContent();
            context.Response.ContentType = "";

            if (StatusType == 1)
            {

                if(updateInstStatus(InstId, Status))
                    context.Response.Write("Status Updated");
                else
                    context.Response.Write(ErrorMessage);
            }
            else
            {
                if (updateProtocolStatus(InstId, Status))
                    context.Response.Write("Status Updated");
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

        #endregion
    }
}
