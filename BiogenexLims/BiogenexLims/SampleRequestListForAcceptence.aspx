<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleRequestListForAcceptence.aspx.cs" Inherits="CaliberEdap_Sample.SampleRequestListForAcceptence" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Trn</title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />

    <script language="javascript">
	<!--
	//-->
    </script>

</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
		<br />
        <asp:Table ID="tt" runat="server" CellPadding="0" CellSpacing="1" BorderWidth="0"
            HorizontalAlign="center" CssClass="MainTable">
            <asp:TableRow>
                <asp:TableCell CssClass="MainHead" ColumnSpan="7">
                    <asp:Literal ID="MainTitleLtrl" runat="server">Sample Requet List</asp:Literal>
                    <a   runat="server"  style="float:right;" href="~/SampleAcceptanceList.aspx"    class="ButCls" >Sample Accepted List</a>
               
                </asp:TableCell>
               
            </asp:TableRow>
            
            <asp:TableRow>
                <asp:TableCell ColumnSpan="7">
                    <asp:Table ID="Table2" CellPadding="1" style="display:none" CellSpacing="1" BorderWidth="0" HorizontalAlign="center"
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
                            <asp:TableCell ColumnSpan="7">
                                <asp:Table ID="DataGrid" runat="server" CssClass="Subtable"  style="margin-top:2px" Width="100%" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center"> 
                              <asp:TableRow>
                                      <asp:TableCell>
                                            <asp:GridView ID="GridView1" Runat="server" 
                                                AutoGenerateColumns="False" BorderWidth="1px" 
                                                BackColor="White" GridLines="Horizontal"
                                                CellPadding="3" BorderStyle="None" BorderColor="#E7E7FF" 
                                                EmptyDataText="No Samples Found For Acceptence"
                                                OnRowDataBound="GridView_RowDataBound">
                                                <FooterStyle ForeColor="#ffffff" 
                                                 BackColor="#ffffff"></FooterStyle>
                                                <PagerStyle ForeColor="#ffffff" HorizontalAlign="Right" 
                                                 BackColor="#ffffff"></PagerStyle>
                                                <HeaderStyle ForeColor="#ffffff" Font-Bold="True" 
                                                 BackColor="#0A4168"></HeaderStyle>
                                                <AlternatingRowStyle BackColor="#D7D6E0"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNO">
                                                     <ItemTemplate>
                                                            <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                     </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Request Number" DataField="SMP_REQ_UCODE" 
                                                     SortExpression="SMP_REQ_UCODE"></asp:BoundField>
                                                      <asp:BoundField HeaderText="Physician Name" DataField="SMP_REQ_PHY_NME" 
                                                     SortExpression="SMP_REQ_PHY_NME"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Patient ID" DataField="SMP_REQ_PATIENT_ID" 
                                                     SortExpression="SMP_REQ_PATIENT_ID"></asp:BoundField>
                                                     <asp:BoundField HeaderText="External Reference" DataField="SMP_REQ_EXT_REF" 
                                                     SortExpression="SMP_REQ_EXT_REF"></asp:BoundField>
                                                     
                                                     <asp:BoundField HeaderText="Comments / Remarks" DataField="SMP_REQ_REMARKS" 
                                                     SortExpression="SMP_REQ_REMARKS"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Register On" DataField="SMP_REQ_REG_ON" 
                                                     SortExpression="SMP_REQ_REG_ON"></asp:BoundField>
                                                    
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
