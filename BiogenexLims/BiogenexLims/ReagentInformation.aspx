<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReagentInformation.aspx.cs" Inherits="BiogenexLims.ReagentInformation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />
    <title></title>
</head>
<body>
    <br />

    <form id="form1" runat="server">
        <div>

            <asp:Table ID="Table2" runat="server" CssClass="MainTable" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center">
                <asp:TableRow Height="20">
                    <asp:TableCell CssClass="MainHead">
                        <asp:Literal ID="MainTitleLtrl" runat="server">Reagent</asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="TableRow6" runat="server">
                    <asp:TableCell Width="100%">
                        <asp:Literal ID="Literal1" runat="server">Catlog No or Description : </asp:Literal>
                        <asp:TextBox ID="FindTxt" runat="server" Width="180px" CssClass='TxtCls'>%</asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                                                  <asp:Literal ID="Literal2" runat="server">Records Limit : </asp:Literal>
                        <asp:TextBox ID="FetchSizeTxt" runat="server" Width="50px" CssClass="TxtCls" MaxLength="3"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                                                   <asp:Button ID="Button1" runat="server" Text="Search" class="ButCls" OnClick="LoadSearchgRecords"></asp:Button>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow CssClass="gridTable">
                    <asp:TableCell ColumnSpan="7" CssClass="MainTD">
                        <asp:Table ID="DataGrid" runat="server" CssClass="gridTable" Width="100%" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:GridView ID="ReagnetGridView" runat="server"
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
                                            <asp:BoundField HeaderText="Catlog Number" DataField="LM_REAGENT_CATLOGNUMBER"
                                                SortExpression="ReagentCatlogNumber"></asp:BoundField>
                                            <asp:BoundField HeaderText="Description" DataField="REAGENT_DESCRIPTION"
                                                SortExpression="reagentDescription"></asp:BoundField>
                                            <asp:BoundField HeaderText="Serial No" DataField="SERIALNUMBER"
                                                SortExpression="reagentDescription"></asp:BoundField>
                                            <asp:BoundField HeaderText="Lot No" DataField="LOTNUMBER"
                                                SortExpression="reagentDescription"></asp:BoundField>
                                            <asp:BoundField HeaderText="Kit Volume" DataField="STRARTVOLUME"
                                                SortExpression="StartVolume"></asp:BoundField>
                                            <%-- <asp:BoundField HeaderText="Current Volume" DataField="SERIALNUMBER" 
                                                     SortExpression="CurrentVolume"></asp:BoundField>--%>
                                            <asp:TemplateField HeaderText="Current Volume" SortExpression="CurrentVolume">
                                                <ItemTemplate>
                                                    <%#Eval("CurrentVolume") +" &micro;l" %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Expire Date" DataField="EXPIREDATE"
                                                SortExpression="Expiredate"></asp:BoundField>

                                            <asp:BoundField HeaderText="RegDate" DataField="REGDATE"
                                                SortExpression="RegDate"></asp:BoundField>

                                        </Columns>

                                    </asp:GridView>

                                </asp:TableCell>
                            </asp:TableRow>

                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>

        </div>
    </form>
</body>
</html>
