<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RunLogReport.aspx.cs" Inherits="CaliberEdap_Sample.RunLogReport" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Run Log Report</title>
    <link rel="stylesheet" href="StyleSheet1.css" />

</head>
<body ms_positioning="GridLayout">

    <form id="form1" runat="server">
		<br />
	<div id="PrintMyDiv" style="width:100%;height:100%;">	
        <asp:Table CellPadding="1" CellSpacing="0" BorderWidth="1" HorizontalAlign="center"
            CssClass="MainTable" runat="server" ID="LogTable" EnableViewState="False">
            <asp:TableRow>
           <asp:TableCell>
           
           <asp:Table ID="Table1" runat="server" CssClass="MainTd" Width="100%" CellPadding="1" CellSpacing="0" 
                                    HorizontalAlign="center" >
           <asp:TableRow>
           <asp:TableCell> <span style="float:right;Height:20px;Color:Blue;font-family:Cambria;font-weight:bold;font-size:15pt; ">Run Log Report</span></asp:TableCell>
           <asp:TableCell><img style="float:right" src="IMAGES/biogenex_logo.png" /></asp:TableCell>
           </asp:TableRow>
           </asp:Table>
           </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow Height="20">
                <asp:TableCell CssClass="SubHead">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                    <asp:label ID="MainTitleLtrl1" CssClass="SubHead" runat="server"></asp:label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-----------Base table------------->
                    <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1" 
                        HorizontalAlign="center" ID="CrTopTable">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="6">
                                <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0"   CellSpacing="1"
                                    HorizontalAlign="center" ID="DisTable">
                                    
                                    <asp:TableRow>
                                        <asp:TableCell ID="ReqNoTd" runat="server" CssClass="MainTD"> Request No. </asp:TableCell>
                                        <asp:TableCell ID="ReqNoValTd"  runat="server" CssClass="MainTD"> </asp:TableCell>
                                        <asp:TableCell ID="RunNoTd" runat="server" CssClass="MainTD">Run No. </asp:TableCell>
                                        <asp:TableCell ID="RunNoValTd" runat="server" CssClass="MainTD"> </asp:TableCell>
                                    </asp:TableRow>
                                    
                                    <asp:TableRow>
                                        <asp:TableCell ID="ProtNoTd" runat="server" CssClass="MainTD">Protocol No.  </asp:TableCell>
                                        <asp:TableCell ID="ProtNoValTd"  runat="server" CssClass="MainTD"> </asp:TableCell>
                                        <asp:TableCell ID="SnoTd" runat="server" CssClass="MainTD"> SerialNo. </asp:TableCell>
                                        <asp:TableCell ID="SnoValTd" runat="server" CssClass="MainTD"> </asp:TableCell>
                                    </asp:TableRow>
                                    
                                    <asp:TableRow>
                                        <asp:TableCell ID="RStDateTd" runat="server" CssClass="MainTD"> Run Start Date/Time </asp:TableCell>
                                        <asp:TableCell ID="RStDateValTd"  runat="server" CssClass="MainTD"> </asp:TableCell>
                                        <asp:TableCell ID="REdDateTd" runat="server" CssClass="MainTD"> Run End Date/Time </asp:TableCell>
                                        <asp:TableCell ID="REdDateValTd" runat="server" CssClass="MainTD"> </asp:TableCell>
                                    </asp:TableRow>
                                    
                                    
                                    <asp:TableRow>
                                        <asp:TableCell ID="SlidNoTd" runat="server" CssClass="MainTD">Slide No.  </asp:TableCell>
                                        <asp:TableCell ID="SlidNoValTd"  runat="server" CssClass="MainTD"> </asp:TableCell>
                                        <asp:TableCell ID="SStsTd" runat="server" CssClass="MainTD"> Slide Status. </asp:TableCell>
                                        <asp:TableCell ID="SStsValTd" runat="server" CssClass="MainTD"> </asp:TableCell>
                                    </asp:TableRow>
                                    
                                    
                                    <asp:TableRow>
                                        <asp:TableCell ID="SStDateTd" runat="server" CssClass="MainTD"> Slide Start Date/Time </asp:TableCell>
                                        <asp:TableCell ID="SStDateValTd"  runat="server" CssClass="MainTD"> </asp:TableCell>
                                        <asp:TableCell ID="SEdDateTd" runat="server" CssClass="MainTD">Slide End Date/Time </asp:TableCell>
                                        <asp:TableCell ID="SEdDateValTd" runat="server" CssClass="MainTD"> </asp:TableCell>
                                    </asp:TableRow>
                                    
                                    <asp:TableRow>
                                    </asp:TableRow>
                                    
                                    <asp:TableRow >
                                        <asp:TableCell  ID="TableCell4" runat="server" CssClass="SubHead" ColumnSpan="4">
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:label ID="MiscelnsLiteral1" CssClass ="SubHead" runat="server"></asp:label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    
                                    <asp:TableRow>
                                        <asp:TableCell ColumnSpan="8">
                                                        <asp:Table runat="server" CssClass="SubTable" Width="100%"  CellPadding="1" CellSpacing="1"
                                                            HorizontalAlign="center" ID="OpeDetTab">
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
                                                                 BackColor="#042c57"></HeaderStyle>
                                                                <AlternatingRowStyle BackColor="#D7D6E0"></AlternatingRowStyle>
                                                                <Columns>
                                                                
                                                                <asp:BoundField HeaderText="ComplexStep No" DataField="ComplexStepNo" 
                                                                 SortExpression="ComplexStepNo"></asp:BoundField>
                                                                  <asp:BoundField HeaderText="BasicStep No" DataField="BasicStepno" 
                                                                 SortExpression="BasicStepno"></asp:BoundField>
                                                                 <asp:BoundField HeaderText="Step Description" DataField="StepDesc" 
                                                                 SortExpression="StepDesc"></asp:BoundField>
                                                                 <asp:BoundField HeaderText="Step Details" DataField="StepDetails" 
                                                                 SortExpression="StepDetails"></asp:BoundField>
                                                     
                                                                 <asp:BoundField HeaderText="Start Time" DataField="StartTime" 
                                                                 SortExpression="StartTime"></asp:BoundField>
                                                                 <asp:BoundField HeaderText="End Time" DataField="EndTime" 
                                                                 SortExpression="EndTime"></asp:BoundField>
                                                                  <asp:BoundField HeaderText="Comments" DataField="Comments" 
                                                                 SortExpression="Comments"></asp:BoundField>
                                                    
                                                            </Columns>
                                                           
                                                        </asp:GridView>
                                                   
                                                   
                                                   </asp:TableCell>

                                                </asp:TableRow>
                                                <asp:TableRow>
                                                  <asp:TableCell>

                                                  <input  type='button' id="PrintBtn" value="Print" class="ButCls" align="center" language="javascript" onclick="PagePrint()" />
				
                                                  
                                                  </asp:TableCell>
                                                </asp:TableRow>

                                            </asp:Table>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        
        </div> 
        
    </form>
   
    <TABLE id="PrintCtrlTab"  align="center" language="javascript">
		<TR>
			
			</TR>
			</TABLE>
    
</body>
<script type="text/javascript">
    function PagePrint() {
        var DocumentContainer = document.getElementById("PrintMyDiv");
        var newWin = window.open('', '', 'left=0,top=0,width=0,height=0,toolbar=0,scrollbars=0,status  =0');
        var strHtml = "<html>\n<head>\n<link rel='stylesheet' type='text/css' href=print.css  \>\n</head><body>\n"
        newWin.document.writeln(strHtml);
        newWin.document.writeln(DocumentContainer.innerHTML);
        newWin.document.close();
        newWin.print();
        newWin.close();
    }
</script>

</html>
