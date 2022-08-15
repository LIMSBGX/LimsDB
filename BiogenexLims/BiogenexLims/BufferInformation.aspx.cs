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
    public partial class BufferInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strInsId = "AS4030";
 
            updateBufferStock(strInsId);

        }

        public void updateBufferStock(string InsId)
        {
            // string query = "SELECT CoverslipType,Consumed,EntryStock,FORMAT(StockUpdated, '%yyyy-%m-%d') as StockUpdated  FROM lm_coverslip where InsID='" + InsId + "'";

            string query = "SELECT LM_BUFFERTYPE,LM_BUFFERTYPE,LM_STOCK, LM_STOCKUPDATED  FROM lm_Buffers";// where InsID='" + InsId + "'";
            DataSet ds = DBUtil.GetData(query);
            string strdate, strType;
            int nEstimatedSlide, nConsumed, nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                int i = 0;
                while (i < count)
                {
                    try
                    {
                        strType = ds.Tables[0].Rows[i]["BuffferType"].ToString();
                        nConsumed = int.Parse(ds.Tables[0].Rows[i]["Consumed"].ToString());
                        nStock = int.Parse(ds.Tables[0].Rows[i]["stock"].ToString()); ;
                        strdate = ds.Tables[0].Rows[i]["StockUpdated"].ToString();
                        if (strType == "ALCHOHOL")
                        {
                            AlchoholStock.Text = nStock.ToString();
                            AlchoholConsumed.Text = nConsumed.ToString();
                            AlchoholEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            AlchoholStockUpdatedOn.Text = strdate;
                        }
                        else if (strType == "DIWATER")
                        {
                            DIStock.Text = nStock.ToString();
                            DIConsumed.Text = nConsumed.ToString();
                            DIEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            AlchoholStockUpdatedOn.Text = strdate;
                        }
                        else if (strType == "IHCBUFFER")
                        {
                            IHCStock.Text = nStock.ToString();
                            IHCConsumed.Text = nConsumed.ToString();
                            IHCEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            IHCStockUpdatedOn.Text = strdate;
                        }
                        else if (strType == "ISHBUFFER")
                        {
                            ISHStock.Text = nStock.ToString();
                            ISHConsumed.Text = nConsumed.ToString();
                            ISHEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            ISHStockUpdatedOn.Text = strdate;
                        }

                        else if (strType == "SSBUFFER")
                        {
                            SSStock.Text = nStock.ToString();
                            SSConsumed.Text = nConsumed.ToString();
                            SSEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            SSStockUpdatedOn.Text = strdate;
                        }
                        else if (strType == "DEWAX")
                        {
                            DewaxStock.Text = nStock.ToString();
                            DewaxConsumed.Text = nConsumed.ToString();
                            DewaxEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            DewaxStockUpdatedOn.Text = strdate;
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    i++;
                }

                return;
            }
        }

    }
}