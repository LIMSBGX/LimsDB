<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleRunStatus.aspx.cs" Inherits="BiogenexLims.SampleRunStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>Trn</title>
  
    <script src="Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="Scripts/Jquery-ui.js" type="text/javascript"> </script>
      <link rel="stylesheet" href="Styles/StyleSheet1.css" />
    <link rel="stylesheet" href="Styles/jquery-ui.css" />
    <script language="javascript" type="text/javascript">

        function datevalidation() {
            // alert($("#datepickerFrom").val());
            var fromDate = new Date($("#datepickerFrom").val());
            var toDate = new Date($("#datepickerTO").val());

            if (fromDate > toDate) {
                alert("Please Make Sure From date less than To date!");
                $("#datepickerFrom").val() = $("#datepickerTO").val();
            }

        };


        $(function () {
            $("#datepickerFrom").datepicker({
                maxDate: +0, onSelect: datevalidation

            });
            $("#datepickerTO").datepicker({  maxDate: +0, onSelect: datevalidation});


        });

        function AjaxItemType(samId, InstId, Flag, StatusType) {
            var newStatus;
            var html, Fuction, displaytext, style;
            var ajaxUrl = "printAjax.aspx/PrintProtcolLabels?samId=" + samId + "&InstId=" + InstId + "&Flag=" + Flag + "&StatusType=" + StatusType;

            $.ajax({
                type: "GET", //GET or POST or PUT or DELETE verb
                url: ajaxUrl, // Location of the service
                data: "", //Data sent to server
                contentType: "", // content type sent to server
                dataType: "text", //Expected data format from server
                processdata: true, //True or False
                success: function (json) { //On Successfull service call
                    var spanId = "#span-" + InstId;
                    //document.all("btnFind").click();
                    location.reload();
                    // alert("sripal");
                },
                error: ServiceFailed// When Service call fails
            });

        }

        function ServiceFailed(xhr) {
            alert(xhr.responseText);
            if (xhr.responseText) {
                var err = xhr.responseText;
                if (err)
                    error(err);
                else
                    error({ Message: "Unknown server error." })
            }
            return;
        }




    </script>

</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
		<br />
        <asp:Table ID="tt" runat="server" CellPadding="0" CellSpacing="1"
            HorizontalAlign="center" CssClass="MainTable">
            <asp:TableRow>
                <asp:TableCell CssClass="MainHead" ColumnSpan="7">
                    <asp:Literal ID="MainTitleLtrl" runat="server">Sample Status</asp:Literal>
                </asp:TableCell>
               <asp:TableCell CssClass="MainFoot" HorizontalAlign="Right">
                    <asp:Button ID="RunStatusSync" runat="server" OnClick="SyncRunStatus" Text="Sync.." class="ButCls"></asp:Button>
               </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><span class="dateInput">From: <input type="text" id="datepickerFrom" runat="server"/></span> <span class="dateInput">To: <input type="text" id="datepickerTO" runat="server"/></span>
                
                 <span style="float:left"> <asp:Button ID="Button1" runat="server" Text="Display" class="ButCls"></asp:Button></span>
                 </asp:TableCell>
            </asp:TableRow>
            
            <asp:TableRow>
                <asp:TableCell ColumnSpan="7">
                    <asp:Table ID="Table2" style="display:none" CellPadding="0" CellSpacing="1" BorderWidth="0" HorizontalAlign="center"
                        CssClass="SubTable" Width="100%" runat="server">
                        <asp:TableRow>
                            <asp:TableCell CssClass="HideRow">
                                <asp:Literal ID="MaxRecLtrl" runat="server"></asp:Literal>
                            </asp:TableCell>
                            <asp:TableCell CssClass="HideRow">
                                <asp:Literal ID="MaxRecCntLtrl" runat="server">0</asp:Literal>
                            </asp:TableCell>
                            <asp:TableCell CssClass="HideRow">
                                <asp:Literal ID="RecPerPageLtrl" runat="server"></asp:Literal>
                            </asp:TableCell>
                            <asp:TableCell CssClass="HideRow">
                                <asp:TextBox ID="RecPerPageTxt" CssClass="TxtCls" runat="server" AutoPostBack="False"
                                    Width="50px">10</asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="HideRow">
                                <asp:Literal ID="PgNoLtrl" runat="server"></asp:Literal>
                            </asp:TableCell>
                            <asp:TableCell CssClass="HideRow">
                                <asp:TextBox ID="PgNoTxt" CssClass="TxtCls" runat="server" AutoPostBack="False" Width="50px">1</asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell CssClass="HideRow">
                                <asp:Button runat="server" Text="Display" ID="BtnDisplay" CssClass='ButCls' AccessKey="C"
                                    Width="70"></asp:Button>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="7">
                                <asp:Table ID="DetTab" CellPadding="0" CellSpacing="1" BorderWidth="0" HorizontalAlign="center"
                                    CssClass="SubTable" Width="100%" runat="server">
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="HideRow" Height="0">
                <asp:TableCell ColumnSpan="2" ID="ValidatorsTd">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False"
                        ShowMessageBox="True"></asp:ValidationSummary>
                </asp:TableCell>
            </asp:TableRow>


             <asp:TableRow>
                            <asp:TableCell ColumnSpan="8">
                                <asp:Table ID="DataGrid" runat="server" CssClass="Subtable"  Width="100%" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center"> 
                              <asp:TableRow>
                                      <asp:TableCell>
                                           <asp:GridView ID="GridView1" Runat="server" 
                                                AutoGenerateColumns="False" BorderWidth="1px" 
                                                BackColor="White" GridLines="Horizontal"
                                                CellPadding="3" BorderStyle="None" BorderColor="#E7E7FF" 
                                                OnRowDataBound="GridView_RowDataBound">
                                                <FooterStyle ForeColor="#ffffff" 
                                                 BackColor="#ffffff"></FooterStyle>
                                                <PagerStyle ForeColor="#ffffff" HorizontalAlign="Right" 
                                                 BackColor="#ffffff"></PagerStyle>
                                                <HeaderStyle ForeColor="#ffffff" Font-Bold="True" 
                                                 BackColor="#0A4168"></HeaderStyle>
                                                <AlternatingRowStyle BackColor="#D7D6E0"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                                         </ItemTemplate>
                                                     </asp:TemplateField>
                                                     <asp:BoundField HeaderText="Req_No" DataField="SMP_ACP_REQ_NUM" 
                                                     SortExpression="SMP_ACP_REQ_NUM"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Protocol Description" DataField="SMP_ACP_PRT_DESC" 
                                                     SortExpression="SMP_ACP_PRT_DESC"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Protocol ID" DataField="SMP_ACP_PRT_UCODE" 
                                                     SortExpression="SMP_ACP_PRT_UCODE"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Pathologist Name" DataField="SMP_ACP_PHY_NME" 
                                                     SortExpression="SMP_ACP_PHY_NME"></asp:BoundField>
                                                      <asp:BoundField HeaderText="Physician Name" DataField="SMP_ACP_PHY_NME" 
                                                     SortExpression="SMP_ACP_PHY_NME"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Patient ID" DataField="SMP_ACP_PAT_ID" 
                                                     SortExpression="SMP_ACP_PAT_ID"></asp:BoundField>
                                                                                                  
                                                     <asp:BoundField HeaderText="Register Date" DataField="SMP_ACP_REG_ON" DataFormatString="{0:dd/MM/yyyy}"
                                                     SortExpression="SMP_ACP_REG_ON"></asp:BoundField>

                                                      <asp:BoundField HeaderText="Status" DataField="SMP_ACP_RUNSTATUS" 
                                                     SortExpression="SMP_ACP_RUNSTATUS"></asp:BoundField>
                                                    
                                                </Columns>
                                                
                                            </asp:GridView>
                                      </asp:TableCell>      
                                    </asp:TableRow>

                            </asp:Table>
                            </asp:TableCell>
             </asp:TableRow>


        </asp:Table>
    </form>
</body>
</html>

