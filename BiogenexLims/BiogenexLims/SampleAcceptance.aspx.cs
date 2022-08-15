using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class SampleAcceptance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ResLbl.Visible = false;
            if (IsPostBack)
            {
                ValidateAndSubmitData();
               
            }
            else
            {
                try
                {
                    int id = Int32.Parse(Request.QueryString["sampleId"]);
                    LoadExistingRecords(id);
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }

        public void LoadExistingRecords(int reqId)
        {
            System.Data.DataSet ds = null;
            DataRow dr=null;
            string query = "SELECT SMP_REQ_UCODE,SMP_REQ_PRT_DESC,SMP_REQ_PRT_UCODE,SMP_REQ_PHY_NME,SMP_REQ_PATIENT_ID,SMP_REQ_REMARKS,SMP_REQ_EXT_REF,SMP_REQ_REG_ON FROM SMP_REQ_MAST where SMP_REQ_ID=" + reqId;
            ds = DBUtil.GetData(query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dr=ds.Tables[0].Rows[0];
                SmpReqNoLbl.Text=(string)dr.ItemArray[0];
                PrtDescLbl.Text = (string)dr.ItemArray[1];
                ProtocolIDLbl.Text = (string)dr.ItemArray[2];
                PhyNameLbl.Text = (string)dr.ItemArray[3];
                PatienIdLbl.Text = (string)dr.ItemArray[4];
                RmksLbl.Text = (string)dr.ItemArray[5];
                ExtRefLbl.Text = (string)dr.ItemArray[6];
               
            }

            query = "SELECT INS_ID,INS_DESC, INS_UCODE FROM INS_DET_MAST where INS_STATUS=0";
            ds = DBUtil.GetData(query);
            InstDdl.DataTextField = ds.Tables[0].Columns["INS_UCODE"].ToString(); // text field name of table dispalyed in dropdown
            InstDdl.DataValueField = ds.Tables[0].Columns["INS_ID"].ToString();             // to retrive specific  textfield name 
            InstDdl.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            InstDdl.DataBind();  //binding dropdownlist

            }

        void ValidateAndSubmitData()
        {
            string ProtocolId = String.Empty;
            string smpReqNumber = String.Empty;
            string ProtocolDesc = String.Empty;
            string dtCurrent = DateTime.Now.ToString();
            string physicainName = String.Empty;
            string patientId = String.Empty;
            string TransactionId = String.Empty;
            string ExternalReference = String.Empty;
            string Remarks = string.Empty;
            string samSpecialObs = string.Empty;
            int status = 0;
            string InsId = string.Empty;

            smpReqNumber = SmpReqNoLbl.Text;
            ProtocolId = ProtocolIDLbl.Text;
            ProtocolDesc = PrtDescLbl.Text;
            physicainName = PhyNameLbl.Text;
            patientId = PatienIdLbl.Text;
            ExternalReference = ExtRefLbl.Text;
            Remarks = RmksLbl.Text;
            InsId = (InstDdl.SelectedItem.Text);
            samSpecialObs = ObsTxt.Text;
           // TransactionId = getTransactionId(smpReqNumber);

            string InsQuery = @"insert into SMP_ACP_MAST (SMP_ACP_REQ_NUM,SMP_ACP_PRT_DESC,SMP_ACP_PRT_UCODE,SMP_ACP_PHY_NME,SMP_ACP_PAT_ID,SMP_ACP_EXT_REF,SMP_ACP_REMARKS,SMP_ACP_INST_ID,SMP_ACP_SPL_OBS,SMP_ACP_REG_ON,SMP_ACP_UPDATED,SMP_ACP_PRINTED)" +
                               " values  ('" + smpReqNumber + "','" + ProtocolDesc + "','" + ProtocolId + "','" + physicainName + "','" + patientId + "','" + ExternalReference + "','" + Remarks + "','" + InsId + "','" + samSpecialObs + "', '" + dtCurrent + "',0,0)";

            string delQuery = @"delete from SMP_REQ_MAST where SMP_REQ_UCODE='" + smpReqNumber+"'";
            try
            {
                DBUtil.executeQuery(InsQuery);
                DBUtil.executeQuery(delQuery);
                ResLbl.Text = "Transaction Succeed";

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sample Accepted Successfully')", true);
                
                ResLbl.Visible = true;
                Response.Redirect("SampleRequestListForAcceptence.aspx");
                
            }
            catch (Exception e)
            {
                ResLbl.Text = e.Message.ToString();
                ResLbl.Visible = true;

            }


        }

        public void ViewExistingListBtn_Click(Object sender,EventArgs e)
        {
            Response.Redirect("SampleRequest.Aspx");
        }



        }
}