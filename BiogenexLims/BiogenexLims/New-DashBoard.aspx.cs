using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BiogenexLims
{
    public partial class New_DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strInsId = "AS0400";
            updateCoveslipStock(strInsId);
            updatePipetteStock(strInsId);
            updateBufferStock(strInsId);
            updateSlideBlock(strInsId);
         
        }

        public void updateCoveslipStock(string InsId)
        {
           // string query = "SELECT CoverslipType,Consumed,EntryStock,FORMAT(StockUpdated, '%yyyy-%m-%d') as StockUpdated  FROM lm_coverslip where InsID='" + InsId + "'";

            string query = "SELECT LM_INSID,LM_COVERSLIPTYPE,LM_CONSUMED,LM_ENTRYSTOCK,LM_STOCKUPDATED FROM LM_COVERSLIP where LM_INSID='" + InsId + "'";
            DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
            string strdate,strType;
            int nEstimatedSlide,nConsumed,nStock;
            int count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                int i = 0;
                while (i<count)
                {
                    try
                    {
                        strType = ds.Tables[0].Rows[i]["LM_COVERSLIPTYPE"].ToString();
                        nConsumed = int.Parse(ds.Tables[0].Rows[i]["LM_CONSUMED"].ToString());
                        nStock = int.Parse(ds.Tables[0].Rows[i]["LM_ENTRYSTOCK"].ToString()); ;
                        strdate = ds.Tables[0].Rows[i]["LM_STOCKUPDATED"].ToString();
                        if (strType == "18X18")
                        {

                            Stock18X18.Text=nStock.ToString();
                           

                        }
                        else if (strType =="25X25")
                        {
                            Stock25X25.Text = nStock.ToString();
                           
                        }
                        else if (strType=="25X40")
                        {
                            Stock25X40.Text = nStock.ToString();
                            
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

        public void updatePipetteStock(string InsId)
        {

            string query = "SELECT LM_INSID, LM_TIPTYPE,LM_CONSUMED,LM_ENTRYSTOCK,LM_STOCKUPDATED FROM LM_PIPETTE where LM_INSID='" + InsId + "'";
            DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
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
                            
                        }
                        else if (strType == "large")
                        {
                            LargePipettyStock.Text = nStock.ToString();
                           
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

        public void updateBufferStock(string InsId)
        {
            // string query = "SELECT CoverslipType,Consumed,EntryStock,FORMAT(StockUpdated, '%yyyy-%m-%d') as StockUpdated  FROM lm_coverslip where InsID='" + InsId + "'";

            string query = "SELECT LM_INSID,LM_BUFFERTYPE,LM_STOCK,LM_CONSUMED,LM_STOCKUPDATED FROM LM_BUFFERS where LM_INSID='" + InsId + "'";
            DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
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
                        strType = ds.Tables[0].Rows[i]["LM_BUFFERTYPE"].ToString();
                        nConsumed = int.Parse(ds.Tables[0].Rows[i]["LM_CONSUMED"].ToString());
                        nStock = int.Parse(ds.Tables[0].Rows[i]["LM_STOCK"].ToString()); ;
                        strdate = ds.Tables[0].Rows[i]["LM_STOCKUPDATED"].ToString();
                        if (strType == "ALCHOHOL")
                        {
                           // AlchoholStock.Text = nStock.ToString();
                            
                        }
                        else if (strType == "DIWATER")
                        {
                           // DIStock.Text = nStock.ToString();
                           
                        }
                        else if (strType == "IHC")
                        {
                            IHCStock.Text = nStock.ToString();
                           
                        }
                        else if (strType == "ISH")
                        {
                          //  ISHStock.Text = nStock.ToString();
                           
                        }

                        else if (strType == "SS")
                        {
                            //SSStock.Text = nStock.ToString();
                            
                        }
                        else if (strType == "DEWAX")
                        {
                            DewaxStock.Text = nStock.ToString();
                            
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


        public void updateSlideBlock(string InsId)
        {
            // string query = "SELECT CoverslipType,Consumed,EntryStock,FORMAT(StockUpdated, '%yyyy-%m-%d') as StockUpdated  FROM lm_coverslip where InsID='" + InsId + "'";

            string query = "SELECT LM_INSID,LM_SLIDETYPE,LM_CONSUMED,LM_ENTRYSTOCK,LM_STOCKUPDATED FROM LM_SLIDE where LM_INSID='" + InsId + "'";
            DataSet ds = (DataSet)CaliberEdap_Sample.DBUtil.GetData(query);
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
                        nStock = int.Parse(ds.Tables[0].Rows[i]["LM_ENTRYSTOCK"].ToString()); ;
                        strdate = ds.Tables[0].Rows[i]["LM_STOCKUPDATED"].ToString();
                        if (strType == "18X18")
                        {

                            BarrierSlides18x18.Text = nStock.ToString();


                        }
                        else if (strType == "25X25")
                        {
                            BarrierSlides25x25.Text = nStock.ToString();

                        }
                        else if (strType == "25X40")
                        {
                            BarrierSlides25x40.Text = nStock.ToString();

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