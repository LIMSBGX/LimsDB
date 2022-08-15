using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CaliberEdap_Sample;

namespace BiogenexLims
{
    public partial class UpdateConsumables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public void OnSelectedIndexChangedMethod(object sender, EventArgs e)
        {


            //AppBody.Attributes.Add("src", urlIframe);

        }

        public void UpdateKitInformation(object sender, EventArgs e)
        {
            string Kit = DropDownList1.SelectedItem.Value;
            int Qty = Int32.Parse(DropDownList2.SelectedItem.Value);
            switch (Kit)
            {
                case "HK016-XAK": UpdateDewaxInfo(Qty);
                    break;
                case "HK583-5KE": UpdateBufferInfo(Qty);
                    break;
                case "XT148-YCD": UpdateConsumableInfo(Qty);
                    break;
                case "QD550-YCDE": UpdateDetectionKitInfo(Qty);
                    break;
                default: ;
                    break;
            }
        }

        public void UpdateDetectionKitInfo(int nQty)
        {
        }
        public void UpdateConsumableInfo(int nQty)
        {
            UpdateSlideInfo("25X40", 3 * nQty);
            UpdateCoverSlipInfo("25X40", 2 * nQty);
            UpdatePipetteInfo("small", 6 * nQty);
            UpdatePipetteInfo("large", 3 * nQty);
          /*  int coverlips25X40 = 2; 25X40
            int smallTips = 576;  small
            int largeTips = 288;   large*/

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Kit Successfully')", true);
        }
        public void UpdateBufferInfo(int nQty)
        {
            int nBuffer = 10000;
            string query = "SELECT LM_INSID,LM_BUFFERTYPE,LM_STOCK,LM_CONSUMED,LM_STOCKUPDATED FROM LM_BUFFERS where LM_BUFFERTYPE='IHC'";
            DataSet ds = (DataSet)DBUtil.GetData(query);
            int nConsumed, nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                try
                {
                    nConsumed = int.Parse(ds.Tables[0].Rows[0]["LM_CONSUMED"].ToString());
                    nStock = int.Parse(ds.Tables[0].Rows[0]["LM_STOCK"].ToString()); ;
                    string dtCurrent = DateTime.Now.ToString();
                    nStock = nStock + (nBuffer * nQty);
                    query = "update lm_Buffers set LM_STOCK=" + nStock + ",LM_STOCKUPDATED='" + dtCurrent + "'" + " where LM_BUFFERTYPE='IHC'";
                    DBUtil.executeQuery(query);
                }
                catch (Exception ex)
                {
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Kit Successfully')", true);
            }      
        }
        public void UpdateDewaxInfo(int nQty)
        {
            int nDewax = 2000;
            string query = "SELECT LM_INSID,LM_BUFFERTYPE,LM_STOCK,LM_CONSUMED,LM_STOCKUPDATED FROM LM_BUFFERS where LM_BUFFERTYPE='Dewax'";
            DataSet ds = (DataSet)DBUtil.GetData(query);
            int  nConsumed, nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                int i = 0;
                try
                {
                    nConsumed = int.Parse(ds.Tables[0].Rows[0]["LM_CONSUMED"].ToString());
                    nStock = int.Parse(ds.Tables[0].Rows[0]["LM_STOCK"].ToString());
                    string dtCurrent = DateTime.Now.ToString();

                    nStock = nStock + (nDewax * nQty);
                    query = "update lm_Buffers set LM_STOCK=" + nStock + ", LM_STOCKUPDATED='" + dtCurrent + "'" + " where LM_BUFFERTYPE='DEWAX'";
                    DBUtil.executeQuery(query);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Kit Successfully')", true);
                }
                catch (Exception ex)
                {
                }
            }      
               
        }

        public void UpdateCoverSlipInfo(string strType,int nQty)
        {
            int ncoverSLips = 100;
            string query = "SELECT LM_INSID,LM_COVERSLIPTYPE,LM_ENTRYSTOCK,LM_CONSUMED,LM_STOCKUPDATED FROM LM_COVERSLIP where LM_COVERSLIPTYPE='" + strType + "'";
            DataSet ds = (DataSet)DBUtil.GetData(query);
            int nConsumed, nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                try
                {
                    nConsumed = int.Parse(ds.Tables[0].Rows[0]["LM_CONSUMED"].ToString());
                    nStock = int.Parse(ds.Tables[0].Rows[0]["LM_ENTRYSTOCK"].ToString()); ;
                    string dtCurrent = DateTime.Now.ToString();

                    nStock = nStock + (ncoverSLips * nQty);
                    query = "update LM_COVERSLIP set LM_ENTRYSTOCK=" + nStock +",LM_STOCKUPDATED='" + dtCurrent + "'" + " where  LM_COVERSLIPTYPE='" + strType + "'";
                    DBUtil.executeQuery(query);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Kit Successfully')", true);
                    
                }
                catch (Exception ex)
                {
                }
            }
        }

        public void UpdatePipetteInfo(string strType, int nQty)
        {
            int ntips = 96;
            string query = "SELECT LM_TIPTYPE,LM_CONSUMED,LM_ENTRYSTOCK,LM_STOCKUPDATED From lm_pipette where LM_TIPTYPE='" + strType + "'";
            DataSet ds = (DataSet)DBUtil.GetData(query);
            int nConsumed, nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                try
                {
                    nConsumed = int.Parse(ds.Tables[0].Rows[0]["LM_CONSUMED"].ToString());
                    nStock = int.Parse(ds.Tables[0].Rows[0]["LM_ENTRYSTOCK"].ToString()); ;
                    string dtCurrent = DateTime.Now.ToString();

                    nStock = nStock + (ntips * nQty);
                    query = "update LM_PIPETTE set LM_ENTRYSTOCK=" + nStock + ", LM_STOCKUPDATED='" + dtCurrent + "'" + " where  LM_TIPTYPE='" + strType + "'";
                    DBUtil.executeQuery(query);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Kit Successfully')", true);
                }
                catch (Exception ex)
                {
                }
            }
        }

        public void UpdateSlideInfo(string strType, int nQty)
        {
            int nSlides = 96;
            string query = "SELECT LM_SLIDETYPE,LM_CONSUMED,LM_EntryStock,LM_STOCKUPDATED from lm_Slide where LM_SLIDETYPE='" + strType + "'";
            DataSet ds = (DataSet)DBUtil.GetData(query);
            int nConsumed, nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                try
                {
                    nConsumed = int.Parse(ds.Tables[0].Rows[0]["LM_CONSUMED"].ToString());
                    nStock = int.Parse(ds.Tables[0].Rows[0]["LM_ENTRYSTOCK"].ToString()); 
                    string dtCurrent = DateTime.Now.ToString();
                    nStock = nStock + (nSlides * nQty);
                    query = "update lm_Slide set LM_ENTRYSTOCK=" + nStock + ", LM_STOCKUPDATED='" + dtCurrent + "'" + " where  LM_SLIDETYPE='" + strType + "'";
                    DBUtil.executeQuery(query);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Updated Kit Successfully')", true);
                }
                catch (Exception ex)
                {
                }
            }
        }
    }
}