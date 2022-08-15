
<%@ Page Language="C#" AutoEventWireup="true"   ViewStateMode="Disabled" CodeBehind="InstrumentDet.aspx.cs" Inherits="CaliberEdap_Sample.InstrumentDet" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   
    <title>Instrument </title>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
     <script type="text/javascript" src="/scripts/jquery-1.8.2.min.js"></script>

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

        function SetPopDimensions() {
            PopUpLeftTopX = 20
            PopUpLeftTopY = 20
            PopUpWidth = 550
            PopUpHeight = 330
        }

        function Update(InstId) {
            //alert("sripal");

            SetPopDimensions()
            var pageURL = "UpdatedInstrument.aspx?INSID=" + InstId;
            var features = "height=" + 400 + ",width=" + 550 + ",toolbar=no,resizable=no,menubar=no,status=no,scrollbars=yes,top=" + 20 + ",left=" + 20

            SpWinObj = window.open(pageURL, 'SpecCodes', features)
            if (SpWinObj.opener == null) SpWinObj.opener = self;
            SpWinObj.focus();

        }


        function AjaxItemType(InstId, Status, Flag, StatusType) {


           let confirmAction = confirm("Are you sure to execute this action?");
           if (confirmAction) 
           {
              
           }
            else
            {
              return;
            }


            //alert("delete");
            var newStatus;
            var html,Fuction,displaytext,style;
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
                       // document.all("btnFind").click();
                       location.reload();

                        //alert("sripal");
                   },
                   error: ServiceFailed// When Service call fails
               });

           // alert("sripal");
        /*    var xmlhttp;
            try {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (ex) {
                try {
                    xmlhttp = new ActiveXObject("MSxml2.XMLHTTP");
                }
                catch (ex) {
                    try {
                        xmlhttp = new XmlHttpRequest();
                    }

                    catch (ex) {
                        alert("please update the webbrowser");
                    }
                }

            }

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readystate == 1) {

                }
                if (xmlhttp.readystate == 4) {
                    s = xmlhttp.responseText;
                    alert(s);
                    //                   document.getElementById("msclactTxt").value=""
                    //                   document.getElementById("StndTmTxt").value =""
                    document.all("btnFind").click()

                } //if
            }  //onready

            var url = "AjaxHandler1.ashx?InstId=" + InstId + "&Status=" + Status + "&Flag=" + Flag + "&StatusType=" + StatusType;

            alert(url);

            xmlhttp.open("GET", url, true);
            xmlhttp.send(null);
            */


        }

        function ServiceFailed(xhr) 
        {
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
            if (insDesc == null || insDesc == "") 
            {
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
                    <asp:Literal ID="MainTitleLtrl" runat="server">Instruments</asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-----------Base table------------->
                    <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="0" CellSpacing="1"
                        HorizontalAlign="center" ID="CrTopTable">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="6">
                                <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="5" CellSpacing="1"
                                    HorizontalAlign="center" ID="DisTable">
                                    <asp:TableRow>
                                        <asp:TableCell ID="InstDescTd" runat="server" CssClass="MainTD"> Instrument  Description</asp:TableCell>
                                        <asp:TableCell ID="TableCell1" runat="server" CssClass="MainTD">
                                            <asp:TextBox runat="server" ID="InstDescTxt" MaxLength="100" Width="200px"></asp:TextBox>
                                           
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell runat="server" CssClass="MainTD" ID="InstIDTd"> Instrument  ID</asp:TableCell>
                                        <asp:TableCell ID="TableCell2" runat="server" CssClass="MainTD">
                                            <asp:TextBox runat="server" ID="InstIdTxt"   MaxLength="20" Width="200px"></asp:TextBox>
                                            <asp:Literal ID="INSIDError"  runat="server"></asp:Literal>	
                                        </asp:TableCell>
                                    </asp:TableRow>
                                      <asp:TableRow ID="TableRow2" runat="server" CssClass="MainTD">
                                        <asp:TableCell runat="server" CssClass="MainTD" ID="TableCell3">Instrument IP Address</asp:TableCell>
                                        <asp:TableCell CssClass="MainTD">
                                            <asp:TextBox runat="server" ID="InsIP"   MaxLength="20" Width="200px"></asp:TextBox>
                                            <asp:Literal ID="Literal1"  runat="server"></asp:Literal>	
                                        </asp:TableCell>
                                    </asp:TableRow>
                                  <%--  <asp:TableRow ID="DescRow" runat="server" CssClass="MainTD">
                                        <asp:TableCell runat="server" CssClass="MainTD" ID="DescTd">Comments/Remarks</asp:TableCell>
                                        <asp:TableCell CssClass="MainTD">
                                            <asp:TextBox ID="txtInsRemarks" runat="server" CssClass="TxtCls" MaxLength="250" Width="200px"
                                                TextMode="MultiLine" Rows="2" AccessKey="R" Onkeypress="taLimit()" Onkeyup="taCount()"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                           
                                        </asp:TableCell>
                                    </asp:TableRow>--%>
                                    <asp:TableRow ID="TableRowSubmit" runat="server" CssClass="MainTD">
                                        <asp:TableCell></asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Button class="ButCls" ID="Button1" runat="server" Text="Submit" Width="15%"></asp:Button>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell ID="TableCell4" runat="server" CssClass="SubHead" ColumnSpan="2">
                                            <asp:Literal ID="MiscelnsLiteral" runat="server">Instruments</asp:Literal>
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
                                </asp:Table>
                            </asp:TableCell>
                        </asp:TableRow>
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
                                                    <asp:TemplateField HeaderText="#">
                                                       <ItemTemplate>
                                                            <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                                       </ItemTemplate>
                                                     </asp:TemplateField>
                                                     <asp:BoundField HeaderText="Description" DataField="INS_DESC" 
                                                     SortExpression="INS_DESC"></asp:BoundField>
                                                     <asp:BoundField HeaderText="ID" DataField="INS_UCODE" 
                                                     SortExpression="INS_UCODE"></asp:BoundField>
                                                     <asp:BoundField HeaderText="IP Address" DataField="INS_IP" 
                                                     SortExpression="INS_IP"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Serial Number" DataField="INS_REMARKS" Visible="false"
                                                     SortExpression="INS_REMARKS"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Date" DataField="INS_REG_ON"  DataFormatString="{0:dd/MM/yyyy}"
                                                     SortExpression="INS_REG_ON"></asp:BoundField>
                                                     <asp:BoundField HeaderText="" DataField="INS_STATUS" 
                                                     SortExpression="INS_STATUS">
                                                     </asp:BoundField>
                                                 </Columns>
                                          </asp:GridView>
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
