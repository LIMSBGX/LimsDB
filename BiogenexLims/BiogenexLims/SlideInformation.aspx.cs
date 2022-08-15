using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiogenexLims
{
    public partial class SlideInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strInsId = "AS0400";
            updateCoveslipStock(strInsId);
            //printDocument();
        }
        public void updateCoveslipStock(string InsId)
        {
            // string query = "SELECT CoverslipType,Consumed,EntryStock,FORMAT(StockUpdated, '%yyyy-%m-%d') as StockUpdated  FROM lm_coverslip where InsID='" + InsId + "'";
            string query = "SELECT LM_SLIDETYPE,LM_CONSUMED,LM_EntryStock, FORMAT(LM_STOCKUPDATED, 'dd-MM-YYYY') as LM_STOCKUPDATED  FROM lm_Slide";//" where LM_INSID='" + InsId + "'";
            System.Data.DataSet ds = (System.Data.DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
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
                        strType = ds.Tables[0].Rows[i]["LM_SLIDETYPE"].ToString();
                        nConsumed = int.Parse(ds.Tables[0].Rows[i]["LM_CONSUMED"].ToString());
                        nStock = int.Parse(ds.Tables[0].Rows[i]["LM_EntryStock"].ToString()); ;
                        strdate = ds.Tables[0].Rows[i]["LM_STOCKUPDATED"].ToString();
                        if (strType == "18X18")
                        {

                            Stock18X18.Text = nStock.ToString();
                            Consumed18X18.Text = nConsumed.ToString();
                            EstimatedSlides18X18.Text = (nStock - nConsumed).ToString();
                            StockUpadtedOn18X18.Text = strdate;

                        }
                        else if (strType == "25X25")
                        {
                            Stock25X25.Text = nStock.ToString();
                            Consumed25X25.Text = nConsumed.ToString();
                            EstimatedSlides25X25.Text = (nStock - nConsumed).ToString();
                            StockUpadtedOn25X25.Text = strdate;
                        }
                        else if (strType == "25X40")
                        {
                            Stock25X40.Text = nStock.ToString();
                            Consumed25X40.Text = nConsumed.ToString();
                            EstimatedSlides25X40.Text = (nStock - nConsumed).ToString();
                            StockUpadtedOn25X40.Text = strdate;
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