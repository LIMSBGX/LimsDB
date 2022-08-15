
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampStsRpt.aspx.cs" Inherits="CaliberEdap_Sample.SampStsRpt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Sample Status Report</title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />
    <script type="text/javascript" language="javascript">
        function validationSummary() {
            var nErrors = 0; //variable to store the error count
            var ErrorMessage = "";
            var obsText = document.getElementById("ReqNoTxt").value;   //document.forms["form1"]["InstDescTd"].value;
            if (obsText == null || obsText == "") //if x is empty
            {
                ErrorMessage = ErrorMessage + "- Please Enter Request no \n";
                nErrors++;
            }
            if (nErrors == 0)
                return true; //if no errors return true
            else {
                alert(ErrorMessage);
                return false;
            }
        }
    </script>

</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server" onsubmit="return validationSummary()">
		<br />
        <asp:Table CellPadding="0" CellSpacing="0" HorizontalAlign="center"
            CssClass="MainTable" runat="server" ID="Table1">
            <asp:TableRow Height="20">
                <asp:TableCell CssClass="MainHead">
                    <asp:Literal ID="MainTitleLtrl" runat="server"></asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-----------Base table------------->
                    <asp:Table ID="CrTopTable" runat="server" HorizontalAlign="center" CellPadding="0"
                        CssClass="SubTable" CellSpacing="1" Width="100%">
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD">Request Number</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox runat="server" CssClass="txtcls" ID="ReqNoTxt"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="ReqNoTxt" ErrorMessage="Enter Request Number"
                                    ID="Requiredfieldvalidator1">&nbsp;</asp:RequiredFieldValidator>--%>
                                <asp:Label runat="server" ID="ReqNoLbl" ForeColor="red"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell CssClass="MainTD" ColumnSpan="4">
                                <asp:Button runat="server" ID="ReqNoBtn" Text="DownLoad" class='ButCls'></asp:Button>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ColumnSpan="6">
                               <br />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ColumnSpan="6">
                                
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
                                                    <asp:TemplateField HeaderText="SNO" ControlStyle-CssClass="SubHeadTd" >
                                                     <ItemTemplate>
                                                            <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                     </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Request Number" ControlStyle-CssClass="SubHeadTd" DataField="TxID" 
                                                     SortExpression="TxID"></asp:BoundField>
                                                      <asp:BoundField HeaderText="Physician Name" ControlStyle-CssClass="SubHeadTd" DataField="PhysicianName" 
                                                     SortExpression="PhysicianName"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Patient ID" ControlStyle-CssClass="SubHeadTd" DataField="PatientName" 
                                                     SortExpression="PatientName"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Register Date" ControlStyle-CssClass="SubHeadTd" DataField="StartTime" 
                                                     SortExpression="StartTime"></asp:BoundField>
                                                     
                                                     <asp:BoundField HeaderText="Comments" ControlStyle-CssClass="SubHeadTd" DataField="Comment" 
                                                     SortExpression="Comment"></asp:BoundField>
                                                     
                                                    
                                                </Columns>
                                              
                                            </asp:GridView>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="HideRow" Height="0">
                            <asp:TableCell ColumnSpan="6" ID="ValidatorsTd">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False"
                                    ShowMessageBox="True"></asp:ValidationSummary>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
               <asp:TableHeaderCell>
               
               
               </asp:TableHeaderCell>
            
            
            </asp:TableRow>
        </asp:Table>
    </form>
</body>
</html>

