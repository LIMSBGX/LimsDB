<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatedInstrument.aspx.cs" Inherits="BiogenexLims.UpdatedInstrument" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   
    <title>Instrument/Machine</title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>

  

    <script type="text/javascript" language="javascript">

        function CloseAndRefresh() 
        {
            opener.location.reload(true);
            self.close();
        }

        var taMaxLength = 250
        function taLimit() 
        {
            var taObj = window.event.srcElement;
            if (taObj.value.length == taObj.maxLength * 1) return false;
        }

        function taCount() 
        {
            var taObj = window.event.srcElement;
            if (taObj.value.length > taMaxLength * 1)
             {
                taObj.value = taObj.value.substring(0, taMaxLength * 1);
                alert("Characters exceeding limit\nMaximum Length: " + taMaxLength + " Characters")
            }
        }
        
        function validationSummary() 
        {
            var nErrors = 0; //variable to store the error count
            var ErrorMessage = "";
            var InsName = document.getElementById("InstDescTxt").value;   //document.forms["form1"]["InstDescTd"].value;
            if (InsName == null || InsName == "") //if x is empty
            {
                ErrorMessage = ErrorMessage + "- Please Enter Instrument name \n";
                nErrors++;
            }
            var insID = document.getElementById("InstIdTxt").value; //document.forms["form1"]["InstIdTxt"].value;
            if (insID == null || insID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Machine ID \n";
                nErrors++;
            }
            var insDesc = document.getElementById("txtInsRemarks").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (insDesc == null || insDesc == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Remarks \n";
                nErrors++;
            }

            var insIP = document.getElementById("InsIP").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (insIP == null || insIP == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Valid IP \n";
                nErrors++;
            }
            if (nErrors == 0)
                return true; //if no errors return true
            else
            {
                alert(ErrorMessage);
                return false;
            }
        }
      
    </script>

</head>
<body ms_positioning="GridLayout">
    <form id="form1" runat="server" onsubmit="return validationSummary()">
		<br />
        <asp:Table CellPadding="0" CellSpacing="0" HorizontalAlign="center"
            CssClass="MainTable" runat="server" ID="Table1" EnableViewState="False">
            <asp:TableRow Height="20">
                <asp:TableCell CssClass="MainHead">
                    <asp:Literal ID="MainTitleLtrl" runat="server">Update Instrument Registration</asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-----------Base table------------->
                    <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1"
                        HorizontalAlign="center" ID="CrTopTable">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="6">
                                <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1"
                                    HorizontalAlign="center" ID="DisTable">
                                    <asp:TableRow>
                                        <asp:TableCell ID="InstDescTd" runat="server" CssClass="MainTD"> Instrument/Machine Description</asp:TableCell>
                                        <asp:TableCell ID="TableCell1" runat="server" CssClass="MainTD">
                                            <asp:TextBox runat="server" ID="InstDescTxt" MaxLength="100" Width="200px"></asp:TextBox>
                                           
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell runat="server" CssClass="MainTD" ID="InstIDTd"> Instrument/Machine ID</asp:TableCell>
                                        <asp:TableCell ID="TableCell2" runat="server" CssClass="MainTD">
                                            <asp:TextBox runat="server" ID="InstIdTxt"   MaxLength="20" Width="200px"></asp:TextBox>
                                            <asp:Literal ID="INSIDError"  runat="server"></asp:Literal>	
                                        </asp:TableCell>
                                    </asp:TableRow>
                                      <asp:TableRow ID="TableRow2" runat="server" CssClass="MainTD">
                                        <asp:TableCell runat="server" CssClass="MainTD" ID="TableCell3">Instrument IP Adress</asp:TableCell>
                                        <asp:TableCell CssClass="MainTD">
                                            <asp:TextBox runat="server" ID="InsIP"   MaxLength="20" Width="200px"></asp:TextBox>
                                            <asp:Literal ID="Literal1"  runat="server"></asp:Literal>	
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="DescRow" runat="server" CssClass="MainTD">
                                        <asp:TableCell runat="server" CssClass="MainTD" ID="DescTd">Comments/Remarks</asp:TableCell>
                                        <asp:TableCell CssClass="MainTD">
                                            <asp:TextBox ID="txtInsRemarks" runat="server" CssClass="TxtCls" MaxLength="250" Width="200px"
                                                TextMode="MultiLine" Rows="2" AccessKey="R" Onkeypress="taLimit()" Onkeyup="taCount()"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                          
                                        </asp:TableCell>

                                    </asp:TableRow>

                                
                                    </asp:Table>

                                   <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1" HorizontalAlign="center" ID="Table2">
                                        <asp:TableRow ID="TableRow4" runat="server" CssClass="MainTD">
                                            <asp:TableCell CssClass="MainTD" Width="30%">
                                            <asp:Button class="ButCls" ID="Addbtn" runat="server" Text="Submit"  ></asp:Button>
                                           </asp:TableCell>
                                        </asp:TableRow>
                                   </asp:Table>
                                
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
          </asp:Table><br /> <br />
       </form>

    
</body>
<style type="text/css">
    
    #datagrid div
    {
      background-color : #fff;
    }
</style>


</html>