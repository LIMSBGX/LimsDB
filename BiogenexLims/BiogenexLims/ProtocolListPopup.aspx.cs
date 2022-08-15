using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CaliberEdap_Sample
{
    public partial class ProtocolListPopup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string srtPtocolId= string.Empty;
            int limit = 50;
            if (IsPostBack)
            {
               
                srtPtocolId = FindTxt.Text;
                if (!string.IsNullOrEmpty(FetchSizeTxt.Text))
                    limit = Int32.Parse(FetchSizeTxt.Text);
                else
                    limit = 100;
               // ValidateAndSubmitData();
                LoadExistingRecords(srtPtocolId, limit);

            }
            else
            LoadExistingRecords();
        }

        public void LoadExistingRecords(string protocolId,int Limit)
        {
            DataSet ds = null;

            if (Limit <= 0)
                Limit = 1;

            if(protocolId.StartsWith("%"))
                protocolId ="'"+protocolId+"%'";
            else
                protocolId = "'%" + protocolId + "%'";

            string query = "SELECT PRT_UCODE,PRT_NAME,PRT_REMARKS,PRT_STATUS,PRT_REG_ON FROM PRT_DET_MAST WHERE PRT_UCODE like '%" + protocolId + "  or PRT_NAME like '%" + protocolId + " and PRT_STATUS=0';// Limit 0," + Limit;
            query = "SELECT top " + Limit + " PRT_Id,PRT_UCODE,PRT_NAME,PRT_REMARKS,PRT_STATUS,PRT_REG_ON FROM PRT_DET_MAST WHERE PRT_STATUS=0 and  ( PRT_NAME like " + protocolId + " or PRT_UCODE like " + protocolId+")";
            ds = DBUtil.GetData(query);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        public void LoadExistingRecords()
        {
            DataSet ds = null;
            string query = "SELECT PRT_Id,PRT_UCODE,PRT_NAME,PRT_REMARKS,PRT_STATUS,PRT_REG_ON FROM PRT_DET_MAST WHERE PRT_STATUS=0";
            try
            {
                ds = DBUtil.GetData(query);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception e)
            {
            }
        }

        public void GridView_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            string sNO = string.Empty;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                sNO = (e.Row.RowIndex + 1).ToString();
                e.Row.Cells[1].Text = "<input type='checkbox' name='RB" + sNO + "' onclick='fnCrGetCode(" + sNO + ")' style='height:15px;width:15px'" + "id='RBID+" + sNO + "'>" + "<span id='prtGrdName" + sNO + "'>" + e.Row.Cells[1].Text + "</span>" + "</input>";
                e.Row.Cells[2].Text = "<span id='prtGrdDesc" + sNO + "' >" + e.Row.Cells[2].Text + "</span>";
                DataRowView dr = (DataRowView)e.Row.DataItem;
                Label lblSerial = (Label)e.Row.FindControl("lblSerial");
                lblSerial.Text = sNO + "<span id='prtGrdId" + sNO + "' class='HideRow'>" + dr.Row.ItemArray[0] + "</span>";
            }
        }
    }
}