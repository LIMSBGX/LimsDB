<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Table-BufferInfo.aspx.cs" Inherits="BiogenexLims.Table_BufferInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Table ID="tt" runat="server" CellPadding="0" CellSpacing="1"
            HorizontalAlign="center" Style="width: 100%;" CssClass="MainTable">
            <asp:TableRow>
                <asp:TableCell CssClass="MainHead" ColumnSpan="7">
                    <asp:Literal ID="MainTitleLtrl" runat="server"> Buffers</asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="7">
                    <asp:Table ID="DataGrid" runat="server" CssClass="Subtable" Width="100%" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:GridView ID="GridView1" runat="server"
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

                                        <asp:BoundField HeaderText="Buffer Type" DataField="LM_BUFFERTYPE"
                                            SortExpression="LM_BUFFERTYPE"></asp:BoundField>
                                        <asp:BoundField HeaderText="Available" DataField="LM_STOCK"
                                            SortExpression="LM_STOCK"></asp:BoundField>
                                        <%--<asp:BoundField HeaderText="Consumed" DataField="LM_CONSUMED" 
                                                     SortExpression="LM_CONSUMED"></asp:BoundField>--%>
                                        <asp:TemplateField HeaderText="Consumed" SortExpression="LM_CONSUMED">
                                            <ItemTemplate>
                                                <%#Eval("LM_CONSUMED") +" &micro;l" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Date" DataField="LM_STOCKUPDATED"
                                            SortExpression="LM_STOCKUPDATED"></asp:BoundField>


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
