using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing.Printing;
using CaliberEdap_Sample;

namespace BiogenexLims
{
    public partial class CoverslipInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strInsId = "AS4030";
            updateCoveslipStock(strInsId);
            printDocument();
            
        }

        public void updateCoveslipStock(string InsId)
        {
            // string query = "SELECT CoverslipType,Consumed,EntryStock,FORMAT(StockUpdated, '%yyyy-%m-%d') as StockUpdated  FROM lm_coverslip where InsID='" + InsId + "'";
            string query = "SELECT LM_COVERSLIPTYPE,LM_CONSUMED,LM_ENTRYSTOCK, LM_STOCKUPDATED  FROM lm_coverslip"; /*where InsID='" + InsId + "'"*/;
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
                        strType = ds.Tables[0].Rows[i]["LM_COVERSLIPTYPE"].ToString();
                        nConsumed = int.Parse(ds.Tables[0].Rows[i]["LM_CONSUMED"].ToString());
                        nStock = int.Parse(ds.Tables[0].Rows[i]["LM_ENTRYSTOCK"].ToString()); ;
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

      

        public void printDocument()
        {
            try
            {
                PrintDocument pd = new PrintDocument();
                pd.PrintPage += new PrintPageEventHandler(pd_PrintPage);
                // Set the printer name.
                //pd.PrinterSettings.PrinterName = "file://ns5/hpoffice";
                pd.PrinterSettings.PrinterName = "Canon iR3235/iR3245 PCL5e Top Floor";             
                pd.Print();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
        void pd_PrintPage(object sender, PrintPageEventArgs ev)
        {
           /* System.Drawing.Font printFont = new System.Drawing.Font("3 of 9 Barcode", 17);
            System.Drawing.Font printFont1 = new System.Drawing.Font("Times New Roman", 9, System.Drawing.FontStyle.Bold);
            System.Drawing.SolidBrush br = new System.Drawing.SolidBrush(System.Drawing.Color.Black);
            ev.Graphics.DrawString("*texttodisplay*", printFont, br, 10, 65);
            ev.Graphics.DrawString("*texttodisplay*", printFont1, br, 10, 85);*/
          
        }
    }
}