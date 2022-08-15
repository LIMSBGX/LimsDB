using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using CaliberEdap_Sample;
using System.Web.UI;

namespace BiogenexLims
{

    class protocol
    {
        public int sNo = 0;
        public string strProtocolID = string.Empty;
        public string strProtocolName = string.Empty;
        public string strProtocolType1 = string.Empty;
        public string strProtocolType2 = string.Empty;
    }
    public class PotocolsSynchronise
    {
      
        List<protocol> lstProtocol = new List<protocol>();
        static public void UpdateDatFile(string strSysIP)
        {
            string strProtocolID = string.Empty;
            string strProtocolName = string.Empty;
            string strProtocolType1 = string.Empty;
            string strProtocolType2 = string.Empty;
            
            string strLineEnd  = "</Protocol Header>";
            string strLineStart = "<Protocol Header>";

            string dateFilePath = "\\"+"\\"+strSysIP + "\\i4000_20\\DATA\\protocols.dat";
           // dateFilePath = "C:\\i4000_20\\DATA\\protocols.dat";
            // line1.ToString();
         //   StreamReader sr1 = new StreamReader("");
         //   line1 = sr1.ReadLine();
            try
            {
                using (StreamReader sr = new StreamReader(dateFilePath))
                    {
                        string line;
                        line = "</Protocol Header>";
                        bool bstartParsing = false;
                        while ((line = sr.ReadLine()) != null)
                        {
                            //Console.WriteLine(line);
                            if (line.Contains(strLineStart))
                            {
                                bstartParsing = true;
                                // continue;
                            }

                            if (!bstartParsing)
                                continue;

                            if (line.Contains(strLineEnd))
                            {
                                break;
                            }
                           
                            if (line.Contains("<"))
                                continue;
                            if (bstartParsing)
                            {
                                try
                                {
                                    string newLine = ChangeString(line);
                                }
                                catch (Exception e)
                                {
                                    line = "</Reagent Barcodes>";
                                }
                            }

                           
                        }
                        //line = "</Reagent Barcodes>";
                        //sw.WriteLine(line);
                     }
               
            }
            catch (Exception e)
            {
              //  label4.Text = "Started Parsing File " + e.Message.ToString();
                string line = "</Reagent Barcodes>";
            }
        }
        public static string ChangeString(string line)
        {
            string strProtocolID = string.Empty;
            string strProtocolName = string.Empty;
            string strProtocolType1 = string.Empty;
            string strProtocolType2 = string.Empty;
            if (line != null)
            {
                string[] arrDateStrings = line.Split(',');
                if (arrDateStrings.Length > 0)
                {
                    string[] arrProtocolTypes = arrDateStrings[0].Split('-');
                    if (arrProtocolTypes.Length > 0)
                    {
                        strProtocolID = arrProtocolTypes[0];
                        strProtocolType1 = arrProtocolTypes[1];
                        strProtocolType2 = arrProtocolTypes[2];
                    }
                    strProtocolName=arrDateStrings[1];
                }
            }

            ValidateAndSubmitData(strProtocolID, strProtocolName, strProtocolType1, strProtocolType2);
            string strActualLine = string.Empty, strNewLine = string.Empty, strTemp = string.Empty;
            String[] substrings = line.Split(',');
            strTemp = substrings[0];
            //strNewLine = GetPrefixCombo() + "=" + strTemp;
            return strNewLine;
        }



        public static bool ValidateAndSubmitData(string strProtocolID, string strProtocolName, string strProtocolType1, string strProtocolType2)
        {
            string dtCurrent = DateTime.Now.ToString();
            string InsRemarks = null;
            bool binserted = false;
            if (!String.IsNullOrEmpty(strProtocolID))
            {
                string query = "SELECT * FROM PRT_DET_MAST where PRT_UCODE='" + strProtocolID + "'";
                DataSet ds = (DataSet)DBUtil.GetData(query);
                int count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                  return false;
                }
                else
                {

                    strProtocolName=strProtocolName.Replace("'", " ");
                    string InsQuery = @"insert into PRT_DET_MAST (PRT_UCODE,PRT_NAME,PRT_TYPE1,PRT_TYPE2,PRT_REMARKS,PRT_REG_ON) values ('" + strProtocolID + "','" + strProtocolName + "','" + strProtocolType1 + "','" + strProtocolType2 + "','" + InsRemarks + "','" + dtCurrent + "')";
                    DBUtil.executeQuery(InsQuery);
                    try
                    {
                        DBUtil.executeQuery(InsQuery);
                        binserted = true;
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(null, null, "alertMessage", "alert('" + ex.Message.ToString() + "')", true);
                        return false;
                    }
                }
           }

            return binserted;

        }

        private bool UpdateProtocoltoString(string line)
        {
           return false;
        }
  }

}