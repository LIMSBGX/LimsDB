<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NA-InstrumentInfo.aspx.cs" Inherits="BiogenexLims.InstrumentInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <link rel="stylesheet" href="/Styles/StyleSheet1.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <br />
        <asp:Table CellPadding="0" CellSpacing="0" HorizontalAlign="center"
            CssClass="MainTable" runat="server" ID="Table1" EnableViewState="False">
            <asp:TableRow Height="20">
                <asp:TableCell CssClass="MainHead">
                    <asp:Literal ID="MainTitleLtrl" runat="server">Registered Instruments</asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            </asp:TableRow>
           <asp:TableRow>
                <asp:TableCell ColumnSpan="8">
                    <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1"
                           HorizontalAlign="center" ID="ResTab">
                     </asp:Table>
                </asp:TableCell>
           </asp:TableRow>
          
         
          <asp:TableRow CssClass="HideRow" Height="0">
                <asp:TableCell ColumnSpan="2" ID="ValidatorsTd">.
                 <%--   <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" 
                                                           controlToValidate="txtInsRemarks" 
                                                            errorMessage="Instrument Remarks must be entered" display="static">
                                                        </asp:RequiredFieldValidator>
                      <asp:RequiredFieldValidator id="req1" runat="server" 
                                                           controlToValidate="InstIdTxt" 
                                                            errorMessage="Instrument ID must be entered" display="static">
                                                        </asp:RequiredFieldValidator>            
                      <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" 
                                                           controlToValidate="InstDescTxt" 
                                                            errorMessage="Instrument Description must be entered" display="static">
                                                        </asp:RequiredFieldValidator>  


                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False"
                        ShowMessageBox="True"></asp:ValidationSummary>--%>

                        
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                 <asp:TableCell ColumnSpan="6"  CssClass="MainTD" >
                         <asp:Table ID="DataGrid" runat="server" CssClass="gridTable"  Width="100%" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center"> 
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
                                                    <asp:TemplateField HeaderText="SNO">
                                                     <ItemTemplate>
                                                            <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                     </asp:TemplateField>
                                                      <asp:BoundField HeaderText="Instrument ID" DataField="INSID" 
                                                     SortExpression="INSID"></asp:BoundField>
                                                      <asp:BoundField HeaderText="Instrument Name" DataField="name" 
                                                     SortExpression="name"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Instrument Description" DataField="description" 
                                                     SortExpression="description"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Instrumnt IP" DataField="ip" 
                                                     SortExpression="ip"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Registered On" DataField="regdate" 
                                                     SortExpression="regdate"></asp:BoundField>
                                                    
                                                     <asp:BoundField HeaderText="Last Maintensedate" DataField="Lastmaintenence" 
                                                     SortExpression="Lastmaintenence"></asp:BoundField>
                                                   
                                                    
                                                </Columns>
                                                
                                            </asp:GridView>
                                      </asp:TableCell>      
                                  </asp:TableRow>
                               </asp:Table>
                   
                 </asp:TableCell>
            
            
            </asp:TableRow>

             <asp:TableRow ID="TableRow1" runat="server" >
                  <asp:TableCell>
                  <asp:Button class="ButCls" ID="btnAdd" runat="server" Text="Add New" OnClick="AddNewButtonClick" CausesValidation="false">
                    </asp:Button>
                  </asp:TableCell>
            </asp:TableRow>


            

    
        
 </asp:Table>
    
    </div>
     
    </form>
</body>
</html>
