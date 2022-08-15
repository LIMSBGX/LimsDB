using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CaliberEdap_Sample;
using System.Drawing.Printing;
using System.Drawing;
using System.Drawing.Imaging;

namespace BiogenexLims
{
    public partial class printAjax : System.Web.UI.Page
    {
        string strProtocolID = string.Empty;
        string strProtocolDESC = string.Empty;
        string strSmpReqNumber = string.Empty;
        string strPatientID = string.Empty;
        int samId = -1;
           
        string ErrorMessage;
        protected void Page_Load(object sender, EventArgs e)
        {

            ErrorMessage = string.Empty;
            samId = Int32.Parse(Request.QueryString["samId"]);
          //  int InsID = Int32.Parse(Request.QueryString["InstId"]);
            int InsID = 0;
            string resString = string.Empty;
            Response.ClearContent();
            Response.ContentType = "";

            printLabel(samId, InsID);

            Response.End();

        }

        public void printLabel(int samId, int InsID)
        {

        
              if (samId>=0)
               {
                   string query = "select SMP_ACP_ID,SMP_ACP_PRT_DESC,SMP_ACP_REQ_NUM,SMP_ACP_PRT_UCODE,SMP_ACP_PAT_ID from  SMP_ACP_MAST where SMP_ACP_ID="+samId;
                   DataSet ds = (DataSet)DBUtil.GetData(query);
                   int count = ds.Tables[0].Rows.Count;
                   if (count > 0)
                   {
                       strProtocolID = ds.Tables[0].Rows[0].Field<string>("SMP_ACP_PRT_UCODE");
                       strProtocolDESC = ds.Tables[0].Rows[0].Field<string>("SMP_ACP_PRT_DESC");
                       strSmpReqNumber = ds.Tables[0].Rows[0].Field<string>("SMP_ACP_REQ_NUM");
                       strPatientID = ds.Tables[0].Rows[0].Field<string>("SMP_ACP_PAT_ID"); ;

                       generateBarcode();

                       if (printDocument())
                       {

                            query = string.Empty;
                            query = " Update SMP_ACP_MAST Set SMP_ACP_PRINTED=1,SMP_ACP_RUNSTATUS='In Process' WHERE SMP_ACP_ID=" + samId;
        
                            try
                            {
                                DBUtil.executeQuery(query);
                             
                            }
                            catch (Exception e)
                            {
                                ErrorMessage = e.Message.ToString();
                                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + e.Message.ToString() + "')", true);
                            }
                       }
                       
                   }

                  
                }
            }


        public bool printDocument()
        {
            bool bisprint = true;
            try
            {
                PrintDocument pd = new PrintDocument();
                pd.PrintPage += new PrintPageEventHandler(pd_PrintPage);
                // Set the printer name.
                //pd.PrinterSettings.PrinterName = "file://ns5/hpoffice
                pd.PrinterSettings.PrinterName = "ZDesigner GX420t";
                pd.Print();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
                bisprint = false;
            }

            return bisprint;
        }
        void pd_PrintPage(object sender, PrintPageEventArgs ev)
        {
             System.Drawing.Font printFont = new System.Drawing.Font("3 of 9 Barcode", 17);
             System.Drawing.Font printFont1 = new System.Drawing.Font("Times New Roman", 9, System.Drawing.FontStyle.Bold);

             System.Drawing.SolidBrush br = new System.Drawing.SolidBrush(System.Drawing.Color.Black);

             ev.Graphics.DrawString(strSmpReqNumber, printFont, br, 10, 65);
            // ev.Graphics.DrawString(strSmpReqNumber, printFont1, br, 10, 85);

        }

        private void generateBarcode()
        {
            // Get the Requested code to be created.
            string Code = strSmpReqNumber;//Request["code"].ToString();

            // Multiply the lenght of the code by 40 (just to have enough width)
            int w = Code.Length * 40;

            // Create a bitmap object of the width that we calculated and height of 100
            Bitmap oBitmap = new Bitmap(w, 100);

            // then create a Graphic object for the bitmap we just created.
            Graphics oGraphics = Graphics.FromImage(oBitmap);

            // Now create a Font object for the Barcode Font
            // (in this case the IDAutomationHC39M) of 18 point size
            Font oFont = new Font("Vani", 18);

            // Let's create the Point and Brushes for the barcode
            PointF oPoint = new PointF(2f, 2f);
            SolidBrush oBrushWrite = new SolidBrush(Color.Black);
            SolidBrush oBrush = new SolidBrush(Color.White);

            // Now lets create the actual barcode image
            // with a rectangle filled with white color
            oGraphics.FillRectangle(oBrush, 0, 0, w, 100);

            // We have to put prefix and sufix of an asterisk (*),
            // in order to be a valid barcode
            oGraphics.DrawString("*" + Code + "*", oFont, oBrushWrite, oPoint);

            // Then we send the Graphics with the actual barcode
            Response.ContentType = "image/jpeg";
            oBitmap.Save(Response.OutputStream, ImageFormat.Jpeg);
            string filenanme="C:\\test\\1.jpg";

            oBitmap.Save(filenanme);
        }

        }
    }
