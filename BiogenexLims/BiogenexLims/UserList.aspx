<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="BiogenexLims.UserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="stylesheet" href="Styles/StyleSheet1.css" />
   <script type="text/javascript" language="javascript">

        //-->
        /*------------Pop Up Left Top X, Y pos. And Std. Width----------*/
        var PopUpLeftTopX
        var PopUpLeftTopY
        var PopUpWidth
        var PopUpHeight
        var SizeLimitflg = 0
        function SetPopDimensions() 
        {
            PopUpLeftTopX = 20
            PopUpLeftTopY = 20
            PopUpWidth = 550
            PopUpHeight = 330
        }
        function userBtn_onclick()
        {
            SetPopDimensions()
            var pageURL = "UserRegistration.aspx"
            var features = "height=" + 400 + ",width=" + PopUpWidth + ",toolbar=no,resizable=no,menubar=no,status=no,scrollbars=yes,top=" + PopUpLeftTopY + ",left=" + PopUpLeftTopX
            SpWinObj = window.open(pageURL, 'SpecCodes', features)
            if (SpWinObj.opener == null) SpWinObj.opener = self;
            SpWinObj.focus();
        }


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

        function Update(UserID) {
            //alert("sripal");

            SetPopDimensions()
            var pageURL = "UpdateUser.aspx?UserID=" + UserID;
            var features = "height=" + 400 + ",width=" + 550 + ",toolbar=no,resizable=no,menubar=no,status=no,scrollbars=yes,top=" + 20 + ",left=" + 20

            SpWinObj = window.open(pageURL, 'SpecCodes', features)
            if (SpWinObj.opener == null) SpWinObj.opener = self;
            SpWinObj.focus();

        }


        function AjaxItemType(InstId, Status, Flag, StatusType) 
        {


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
            var ajaxUrl = "prtAjax.aspx/updateUserStatus?UserId=" + InstId + "&Status=" + Status + "&Flag=" + Flag + "&StatusType=" + StatusType;
         

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

                        alert("sripal");
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

    <title>Users List</title>
</head>
<body>
    <form id="form1" runat="server">
     <asp:Table ID="tt" runat="server" CellPadding="0" CellSpacing="1" 
            HorizontalAlign="center" CssClass="MainTable">
            <asp:TableRow>
                <asp:TableCell CssClass="MainHead" ColumnSpan="7">
                    <asp:Literal ID="MainTitleLtrl" runat="server"> Users List</asp:Literal>
                

                 
                                                        <input type="button" id="prtBtn" runat="server" value="Add User" onclick="return userBtn_onclick()"
                                    class="ButCls" style="float:right;padding-bottom:5px;" title="Click Here" tabindex="4" />
                                                       
                                                        
                       </asp:TableCell>                    
            </asp:TableRow>
            
            <asp:TableRow>
                <asp:TableCell ColumnSpan="7">
                    <asp:Table ID="Table2" CellPadding="0" CellSpacing="1" BorderWidth="0" HorizontalAlign="center"
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
                                <asp:Table ID="DataGrid" runat="server" CssClass="Subtable"  Width="100%" CellPadding="0" CellSpacing="0" BorderWidth="0" HorizontalAlign="center"> 
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
                                                   
                                                      <asp:BoundField HeaderText="User ID" DataField="LM_USERID" 
                                                     SortExpression="LM_USERID"></asp:BoundField>
                                                     <asp:BoundField HeaderText="User Name" DataField="LM_USERNAME" 
                                                     SortExpression="LM_USERNAME"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Email" DataField="LM_EMAIL" 
                                                     SortExpression="LM_EMAIL"></asp:BoundField>
                                                     <asp:BoundField HeaderText="Register Date" DataField="LM_REGDATE" 
                                                     SortExpression="LM_REGDATE"></asp:BoundField>
                                                     <asp:TemplateField HeaderText="Action">
                                                       <ItemTemplate>
                                                            <asp:Label ID="lblAction" runat="server"></asp:Label>
                                                       </ItemTemplate>
                                                     </asp:TemplateField>
                                                    
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
