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
    public partial class PipetteInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strInsId = "AS4030";
            
            updatePipetteStock(strInsId);
            

        }

        public void updatePipetteStock(string InsId)
        {

            string query = "SELECT LM_TIPTYPE,LM_CONSUMED,LM_ENTRYSTOCK,LM_STOCKUPDATED FROM lm_pipette";// where InsID='" + InsId + "'";
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
                        strType = ds.Tables[0].Rows[i]["LM_TIPTYPE"].ToString();
                        nConsumed = int.Parse(ds.Tables[0].Rows[i]["LM_CONSUMED"].ToString());
                        nStock = int.Parse(ds.Tables[0].Rows[i]["LM_ENTRYSTOCK"].ToString()); ;
                        strdate = ds.Tables[0].Rows[i]["LM_STOCKUPDATED"].ToString();
                        if (strType == "small")
                        {
                            SmallPipettyStock.Text = nStock.ToString();
                            SmallPipettyConsumed.Text = nConsumed.ToString();
                            SmallPipettEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            SmallPipettStockUpdatedOn.Text = strdate;
                        }
                        else if (strType == "large")
                        {
                            LargePipettyStock.Text = nStock.ToString();
                            LargePipettyConsumed.Text = nConsumed.ToString();
                            LargePipettEstimatedSlides.Text = (nStock - nConsumed).ToString();
                            LargePipettStockUpdatedOn.Text = strdate;
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