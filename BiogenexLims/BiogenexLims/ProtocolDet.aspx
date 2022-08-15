 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProtocolDet.aspx.cs" Inherits="CaliberEdap_Sample.ProtocolDet" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Protocol Number</title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />
   <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>

    <script type="text/javascript" language="javascript">

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

        function AjaxItemType(InstId, Status, Flag, StatusType) {
            var newStatus;
            var html, Fuction, displaytext, style;
            var ajaxUrl = "prtAjax.aspx/updateStatus?InstId=" + InstId + "&Status=" + Status + "&Flag=" + Flag + "&StatusType=" + StatusType;


            $.ajax({
                type: "GET", //GET or POST or PUT or DELETE verb
                url: ajaxUrl, // Location of the service
                data: "", //Data sent to server
                contentType: "", // content type sent to server
                dataType: "text", //Expected data format from server
                processdata: true, //True or False
                success: function (json) {//On Successfull service call
                    var spanId = "#span-" + InstId;
                    //document.all("btnFind").click();
                    location.reload();
                    // alert("sripal");
                },
                error: ServiceFailed// When Service call fails
            });

        }

        function ServiceFailed(xhr)
        {
            alert(xhr.responseText);
            if (xhr.responseText)
            {
                var err = xhr.responseText;
                if (err)
                    error(err);
                else
                    error({ Message: "Unknown server error." })
            }
            return;
        }

          

        function validationSummary() 
        {
            var nErrors = 0; //variable to store the error count
            var ErrorMessage = "";
            var prtName = document.getElementById("PrtDescTxt").value;   //document.forms["form1"]["InstDescTd"].value;
            if (prtName == null || prtName == "") //if x is empty
            {
                ErrorMessage = ErrorMessage + "- Please Enter Protocol name \n";
                nErrors++;
            }
            var prtID = document.getElementById("PrtIdTxt").value; //document.forms["form1"]["InstIdTxt"].value;
            if (prtID == null || prtID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Protocol ID \n";
                nErrors++;
            }
            var prtRemarks = document.getElementById("PRTRemarksTxt").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (prtRemarks == null || prtRemarks == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Remarks \n";
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
    <form id="form1" runat="server" onsubmit="return validationSummary()">
		<br />
        <asp:Table CellPadding="0" CellSpacing="0"  HorizontalAlign="center"
            CssClass="MainTable" runat="server" ID="Table1" EnableViewState="False">
       
                                    <asp:TableRow Height="35">
                                        <asp:TableCell ID="TableCell4" runat="server" CssClass="SubHead" ColumnSpan="2">
                                            <asp:Literal ID="MiscelnsLiteral" runat="server">Protocols</asp:Literal>
                                        </asp:TableCell>
                                        <asp:TableCell style="height:20px;" CssClass="MainFoot" HorizontalAlign="Right">
                                                       <!-- <asp:Button ID="ProtocolSync" runat="server" OnClick="SyncProtocols" Text="Sync.." class="ButCls"></asp:Button>-->
                                            </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell ColumnSpan="8">
                                            <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1"
                                                HorizontalAlign="center" ID="ResTab">
                                            </asp:Table>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow ID="TableRow1" runat="server" CssClass="HideRow">
                                        <asp:TableCell>
                                            <asp:Button class="ButCls" ID="btnFind" runat="server" Text="Display" CausesValidation="false">
                                            </asp:Button>
                                        </asp:TableCell>
                                    </asp:TableRow>

                                     <asp:TableRow ID="TableRow6" runat="server" >  
                                              <asp:TableCell Width="100%">
                                                  <asp:Literal ID="Literal1" runat="server">Protocol ID or Description : </asp:Literal>
                                                  <asp:TextBox ID="FindTxt" runat="server" Width="180px" CssClass='TxtCls'>%</asp:TextBox>
                                                   &nbsp;&nbsp;&nbsp;
                                                  <asp:Literal ID="Literal2" runat="server">Records Limit : </asp:Literal>
                                                  <asp:TextBox ID="FetchSizeTxt" runat="server" Width="50px" CssClass="TxtCls" MaxLength="3"></asp:TextBox>
                                                  &nbsp;&nbsp;&nbsp;
                                                   <asp:Button ID="Button1" runat="server" Text="Search" class="ButCls" OnClick="LoadSearchgRecords">   </asp:Button>
                                               </asp:TableCell>
                                    </asp:TableRow>         
                                </asp:Table>
                                
                            
            <asp:TableRow CssClass="HideRow" Height="0">
                <asp:TableCell ColumnSpan="2" ID="ValidatorsTd">
                     <%-- <asp:RequiredFieldValidator id="req1" runat="server" 
                                                           controlToValidate="PRTIdTxt" 
                                                            errorMessage="Protocol ID must be entered" display="static">
                                                        </asp:RequiredFieldValidator>            
                      <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" 
                                                           controlToValidate="PRTDescTxt" 
                                                            errorMessage="Protocol Description must be entered" display="static">
                                                        </asp:RequiredFieldValidator> 
                       <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" 
                                                           controlToValidate="PRTRemarksTxt" 
                                                            errorMessage="Protocol Remarks must be entered" display="static">
                                                        </asp:RequiredFieldValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False"
                        ShowMessageBox="True"></asp:ValidationSummary>--%>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

         <asp:Table ID="Table2" runat="server" CssClass="protocolgridTable" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center"> 
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
                       <asp:BoundField HeaderText="Description" DataField="PRT_NAME" 
                            SortExpression="PRT_DESC"></asp:BoundField>
                       <asp:BoundField HeaderText="ID" DataField="PRT_UCODE" 
                            SortExpression="PRT_UCODE"></asp:BoundField>
                       <asp:BoundField HeaderText="Type" DataField="PRT_TYPE2" 
                            SortExpression="PRT_TYPE2"></asp:BoundField>
                       <asp:BoundField HeaderText="Register Date" DataField="PRT_REG_ON" 
                            SortExpression="PRT_REG_ON" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                       <asp:BoundField HeaderText="Status" DataField="PRT_STATUS" 
                            SortExpression="PRT_STATUS"></asp:BoundField>
                     </Columns>
                  </asp:GridView>
                 </asp:TableCell>      
               </asp:TableRow>
             </asp:Table>
       </form>
</body>
</html>
