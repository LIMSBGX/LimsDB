using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class SampleRequest : System.Web.UI.Page
    {

        int curCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                AddInstrumentListToDropDown();
            }
           
            ResLbl.Visible = false;
            if(IsPostBack)
            {
                ValidateAndSubmitData();
            }else
                CodeTxt.Text = "System Generated";

        }
         void ValidateAndSubmitData()
        {
            int ProtocolId = 0;
            string ProtocolName=String.Empty;
            string ProtocolDesc = String.Empty;
            string dtCurrent = DateTime.Now.ToString();
            string physicainName = String.Empty;
            string patientId=String.Empty;
            string TransactionId=String.Empty;
            string ExternalReference=String.Empty;
            string Remarks = string.Empty;
            string strinsId = string.Empty;
    
            int status = 0;
            string[] arrprotocolName=null;
            string[] arrprotocolId = null;
            string[] arrprotocolDesc = null;

            if (ProtocolIDTxt.Text != null)
                arrprotocolName = ProtocolIDTxt.Text.Split(',');

            if (KfId.Text != null)
                arrprotocolId = KfId.Text.Split(',');

            if (PrtDescTxt.Text != null)
                arrprotocolDesc = PrtDescTxt.Text.Split(',');
            //ProtocolName=ProtocolIDTxt.Text.Trim();  
           // ProtocolId= Int32.Parse(KfId.Text);
            //ProtocolDesc =PrtDescTxt.Text;
            physicainName=PhyNameTxt.Text;
            patientId= PatienIdTxt.Text;
            ExternalReference = ExtRefTxt.Text;
            Remarks = RemarksDescTxt.Text;
            strinsId = (InsId.SelectedItem.Text);

            for (int i = 0; i < arrprotocolName.Length; i++)
            {

                ProtocolName = arrprotocolName[i];
                ProtocolId = Int32.Parse(arrprotocolId[i]);
                ProtocolDesc = arrprotocolDesc[i];
                try
                {
                    TransactionId = getTransactionId(ProtocolId, ProtocolName);
                   // string InsQuery = @"insert into SMP_REQ_MAST(SMP_REQ_UCODE,SMP_REQ_PRT_UCODE,SMP_REQ_PRT_DESC,SMP_REQ_PRT_ID,SMP_REQ_PHY_NME,SMP_REQ_PATIENT_ID,SMP_REQ_EXT_REF,SMP_REQ_REMARKS,SMP_REQ_REG_ON) values
                   //('" + TransactionId + "','" + ProtocolName + "','" + ProtocolDesc + "'," + ProtocolId + ",'" + physicainName + "','" + patientId + "','" + ExternalReference + "','" + Remarks + "','" + dtCurrent + "')";


                    string InsQuery = "insert into SMP_ACP_MAST (SMP_ACP_REQ_NUM,SMP_ACP_PRT_DESC,SMP_ACP_PRT_UCODE,SMP_ACP_PHY_NME,SMP_ACP_PAT_ID,SMP_ACP_EXT_REF,SMP_ACP_REMARKS,SMP_ACP_INST_ID,SMP_ACP_SPL_OBS,SMP_ACP_REG_ON,SMP_ACP_UPDATED,SMP_ACP_PRINTED)" +
                            "values  ('" + TransactionId + "','" + ProtocolDesc + "','" + ProtocolId + "','" + physicainName + "','" + patientId + "','" + ExternalReference + "','" + Remarks + "','" + strinsId + "','" + Remarks + "', '" + dtCurrent + "',0,0)";


                    DBUtil.executeQuery(InsQuery);
                    updateprotocolSampleCount(curCount, ProtocolId);
                    // ResLbl.Visible = true;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sample Added Successfully')", true);
                    ProtocolIDTxt.Text = "";
                    KfId.Text = "";
                    PrtDescTxt.Text = "";
                    PhyNameTxt.Text = "";
                    PatienIdTxt.Text = "";
                    ExtRefTxt.Text = "";
                    RemarksDescTxt.Text = "";
                }
                catch (Exception e)
                {
                    ResLbl.Text = e.Message.ToString();
                    ResLbl.Visible = true;

                }
            }
                    
                    
        }


         string getTransactionId(int protocolID, string ProtocolName)
         {
             string traId = string.Empty;
             char[] months = { 'A', 'B', 'C', 'D','E','F','G','H','I','J','K','L' };
             string day= DateTime.Now.Day.ToString();
             int month=DateTime.Now.Month-1;
             string year=DateTime.Now.Year.ToString();
             string hour=DateTime.Now.Hour.ToString();
             string min=DateTime.Now.Minute.ToString();
             string Sec=DateTime.Now.Second.ToString();
           //  ProtocolName.Replace('\t',' ');
             string query = "select * from  SMP_REQ_MAST where SMP_REQ_PRT_UCODE='"+ProtocolName+"'";
          
             curCount = getProtocolCount(protocolID,ProtocolName);
             string strcurCount = string.Empty;
             
             if (curCount < 10)
                 strcurCount = "000" + curCount;
             else if (curCount >= 10 && curCount < 100)
                 strcurCount = "00" + curCount;
             else if (curCount >= 100 && curCount < 1000)
                 strcurCount = "0" + curCount;
             else 
                 strcurCount = "" + curCount;


             traId = ProtocolName + "/" + year.Substring(2) + months[month] + strcurCount;
             return traId;
         }



         int getProtocolCount(int protocolID, string ProtocolName)
         {
             DataSet ds = null;
             int count=0;
             string query = "select PRT_SNO_CNT from  PRT_DET_MAST where PRT_ID=" + protocolID + "";
             try
             {
                 ds = DBUtil.GetData(query);
                 count = (int)ds.Tables[0].Rows[0]["PRT_SNO_CNT"];
                 count++;

             }
             catch (Exception e)
             {
                 throw new Exception("Invalid Protocol");
             }


             return count;
         }

         void updateprotocolSampleCount(int proCount,int protocolID)
         {
             string updateQuery = "update PRT_DET_MAST set PRT_SNO_CNT="+proCount+" where PRT_ID=" + protocolID + "";
             try
             {
                 DBUtil.executeQuery(updateQuery);
             }
             catch (Exception e)
             {
                 throw new Exception("Protocol Count Not Updated Protocol");

             }

         }

        void AddInstrumentListToDropDown()
        {

            string query = "SELECT INS_ID,INS_DESC, INS_UCODE FROM INS_DET_MAST where INS_STATUS=0";
            DataSet ds = DBUtil.GetData(query);
            InsId.DataTextField = ds.Tables[0].Columns["INS_UCODE"].ToString(); // text field name of table dispalyed in dropdown
            InsId.DataValueField = ds.Tables[0].Columns["INS_ID"].ToString();             // to retrive specific  textfield name 
            InsId.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            InsId.DataBind(); 
            /*ListItem lst = new ListItem("Add New", "0");

            DropDownList1.Items.Insert(DropDownList1.Items.Count - 1, lst);*/
           
        }


    

    }
}