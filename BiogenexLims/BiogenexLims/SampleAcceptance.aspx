<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleAcceptance.aspx.cs" Inherits="CaliberEdap_Sample.SampleAcceptance" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Trn</title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css"><link />
    <script type="text/javascript" language="javascript">
        function validationSummary() 
        {
            var nErrors = 0; //variable to store the error count
            var ErrorMessage = "";
            var obsText = document.getElementById("ObsTxt").value;   //document.forms["form1"]["InstDescTd"].value;
            if (obsText == null || obsText == "") //if x is empty
            {
                ErrorMessage = ErrorMessage + "- Please Enter obeservation \n";
                nErrors++;
            }
            var prtID = document.getElementById("InstDdl").value; //document.forms["form1"]["InstIdTxt"].value;
            if (prtID == null || prtID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Instrument ID \n";
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
        <center>
            <asp:Table ID="tt" CellPadding="0" CellSpacing="0"  CssClass="MainTable"
                runat="server">
                <asp:TableRow Height="20">
                    <asp:TableCell CssClass="MainHead">
                        <asp:Literal ID="MainTitleLtrl" runat="server">Sample Acceptance</asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <!-----------Base table------------->
                        <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1" HorizontalAlign="center" ID="Table1">
                            <asp:TableRow CssClass="HideRow" Height="0">
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                            </asp:TableRow>
                           
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="SmpReqNoTd">Request Number	</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="SmpReqNoLbl" runat="server"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="PrtDescTd">Protocol Description</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="PrtDescLbl" runat="server" CssClass="MainTd"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="ProtocolIDTd">Protocol ID</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="ProtocolIDLbl" runat="server" CssClass="MainTd"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="PhyNameTd">Physician Name</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="PhyNameLbl" runat="server" CssClass="MainTd"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="PatienIdTd">Patient ID</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="PatienIdLbl" runat="server" CssClass="MainTd"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="ExtRefTd">External Referance</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="ExtRefLbl" runat="server" CssClass="MainTd"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="DescTd">Comments/Remarks</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:Label ID="RmksLbl" runat="server" CssClass="MainTd"></asp:Label></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainTD" ID="InstTd">Instrument/Machine ID</asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:DropDownList ID="InstDdl" runat="server" CssClass="DdlCls" Width="150px"></asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="ObsTR" runat="server" CssClass="MainTD">
                                <asp:TableCell runat="server" CssClass="MainTD" ID="ObsTd">Main Observations </asp:TableCell>
                                <asp:TableCell CssClass="MainTD"><asp:TextBox ID="ObsTxt" runat="server" CssClass="TxtCls" MaxLength="250" Width="200px"
                                        TextMode="MultiLine" Rows="2" AccessKey="R" Onkeypress="taLimit()" Onkeyup="taCount()"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <!-----------End of Base table------------->
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="IARow" runat="server" CssClass="HideRow">
                    <asp:TableCell>
                        <asp:Table ID="IATab" runat="server" CssClass='SubTable' Width="100%" CellPadding="0"
                            CellSpacing="1" HorizontalAlign="Center">
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="0"
                            HorizontalAlign="center" ID="Table2" BorderWidth="0">
                            <asp:TableRow CssClass="HideRow" Height="0">
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell CssClass="MainFoot">
                                    <asp:Button ID="btnConfirm" runat="server" Class='ButCls' AccessKey="C" Text="Submit">
                                    </asp:Button>
                                </asp:TableCell>
                                <asp:TableCell CssClass="MainFoot" HorizontalAlign="Right">
                                   
                                    <asp:HyperLink ID="Hlink" runat="server"  NavigateUrl="~/SampleAcceptanceList.aspx"    CssClass="ButCls" Text="ViewExistingList" AccessKey="V" Font-Underline="False">ViewExistingList</asp:HyperLink>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                               <asp:TableCell>
                                  <asp:Label runat="server" ID="ResLbl" ForeColor="red" Text="Transaction Succeeded"></asp:Label>
                               </asp:TableCell>
                        </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="HideRow" Height="0">
                    <asp:TableCell ColumnSpan="2" ID="ValidatorsTd">
                       <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False"
                            ShowMessageBox="True"></asp:ValidationSummary>
                            
                            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" 
                                                           controlToValidate="ObsTxt" 
                                                       errorMessage="Please Enter observations" display="static">
                                                 </asp:RequiredFieldValidator>

                                                        
                            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" 
                                                           controlToValidate="InstDdl" 
                                                            errorMessage="Please select machine" display="static">
                                                        </asp:RequiredFieldValidator>--%>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </center>
    </form>
</body>

<script language="javascript">
<!--


    var taMaxLength = 250
    function taLimit() {
        var taObj = window.event.srcElement;
        if (taObj.value.length == taObj.maxLength * 1) return false;
    }

    function taCount() {
        var taObj = window.event.srcElement;
        if (taObj.value.length > taMaxLength * 1) {
            taObj.value = taObj.value.substring(0, taMaxLength * 1);
            alert("Characters exceeding limit\nMaximum Length: " + taMaxLength + " Characters")
        }
    }		
			
			
//-->
</script>

</html>
