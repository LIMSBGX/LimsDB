<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleRequest.aspx.cs" Inherits="CaliberEdap_Sample.SampleRequest" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Trn</title>
    <link rel="stylesheet" href="/Styles/StyleSheet1.css" />

    <script language="javascript">
	
        //-->
        /*------------Pop Up Left Top X, Y pos. And Std. Width----------*/
        var PopUpLeftTopX
        var PopUpLeftTopY
        var PopUpWidth
        var PopUpHeight
        var SizeLimitflg = 0
        function SetPopDimensions() {
            PopUpLeftTopX = 20
            PopUpLeftTopY = 20
            PopUpWidth = 550
            PopUpHeight = 330
        }
        function prtBtn_onclick()
        {
            SetPopDimensions()
            var pageURL = "ProtocolListPopup.aspx"
            var features = "height=" + 400 + ",width=" + PopUpWidth + ",toolbar=no,resizable=no,menubar=no,status=no,scrollbars=yes,top=" + PopUpLeftTopY + ",left=" + PopUpLeftTopX
            SpWinObj = window.open(pageURL, 'SpecCodes', features)
            if (SpWinObj.opener == null) SpWinObj.opener = self;
            SpWinObj.focus();
        }

        function fnCrSetToCode1(PrtId, PrtUcode, PrtDesc) 
        {
            var objId
            var obj
            //  alert(document.Form1.PrtDescTxt.value);

            if (findString(PrtId, PrtUcode, PrtDesc)) {

              //  alert("already Exist");
                return;
            }
            objId = 'KfId'
            obj = document.getElementById(objId)
            if (obj.value == null || obj.value == "")
                obj.value = PrtId
            else
                obj.value = obj.value + "," + PrtId

        
            objId = 'ProtocolIDTxt'
            obj = document.getElementById(objId)
            if (obj.value == null || obj.value == "")
                obj.value = PrtUcode
            else
                obj.value = obj.value + "," + PrtUcode

            ProtocolIDLbl.innerHTML = obj.value
        

           /* objId = 'ProtocolIDLbl'
            obj = document.getElementById(objId)
            if (obj.value == null)
                obj.value = PrtUcode
            else
                obj.value = obj.value + "," + PrtUcode;
            ProtocolIDLbl.innerHTML = obj.value*/

         
            objId = 'PrtDescTxt'
            obj = document.getElementById(objId)
            if (obj.value == null || obj.value == "")
                obj.value = PrtDesc
            else
                obj.value = obj.value + "," + PrtDesc

            PrtDescLbl.innerHTML = obj.value


          
            /*objId = 'PrtDescLbl'
            obj = document.getElementById(objId)
            if (obj.value == null)
                obj.value = PrtDesc
            else
                obj.value = obj.value +"," + PrtDesc

            PrtDescLbl.innerHTML = obj.value*/
        }

       function fnCrSetToCode1Remove(PrtId, PrtUcode, PrtDesc)
       {
           // str.search("W3Schools")
           var objId
           var obj

           if (findString(PrtId, PrtUcode, PrtDesc)) 
           {
                  objId = 'ProtocolIDTxt'
                  obj = document.getElementById(objId)
                  if (obj.value != null) 
                  {
                      obj.value = replaceString(obj.value, PrtUcode)
                      ProtocolIDLbl.innerHTML = obj.value
                  }

                  objId = 'PrtDescTxt'
                  obj = document.getElementById(objId)
                  if (obj.value != null) 
                  {
                      alert(obj.value + "---" + PrtDesc)
                      obj.value = replaceString(obj.value, PrtDesc)
                      PrtDescLbl.innerHTML = obj.value
                  }

                  objId = 'KfId'
                  obj = document.getElementById(objId)
                  if (obj.value != null)
                  {
                      obj.value = replaceString(obj.value, PrtId)
                     // ProtocolIDLbl.innerHTML = obj.value
                  }
                  return;
           }
       }

       function findString(PrtId, PrtUcode, PrtDesc)
       {
           var objId = 'ProtocolIDTxt'
           var obj = document.getElementById(objId)
           if (obj.value == null)
               return false;
           else 
           {
               var str = obj.value;
               //alert(str);
               var arr = str.split(",");
               if (arr.length > 0) 
               {
                   for (var a in arr)
                   {
                       if (PrtUcode == arr[a])
                           return true;
                   }
               }
           }
       }


       function replaceString(string, replaceString)
       {
           var newstring;
           var count = 0;
           if (string != null)
           {
               var arr = string.split(",");
               if (arr.length > 0) 
               {
                   for (var a in arr) {

                  // alert(arr[a])
                       if (count == 0)
                           newstring = arr[a];
                       else 
                       {
                           if (replaceString != arr[a])
                               newstring = newstring + "," + arr[a]
                       }

                      // alert(newstring)
                       count++;
                   }
               }
           }
           return newstring;

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
            var prtID = document.getElementById("ProtocolIDTxt").value; //document.forms["form1"]["InstIdTxt"].value;
            if (prtID == null || prtID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Protocol ID \n";
                nErrors++;
            }
            var phyName = document.getElementById("PhyNameTxt").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (phyName == null || phyName == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Physician Name \n";
                nErrors++;
            }
            var patientID = document.getElementById("PatienIdTxt").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (patientID == null || patientID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Patient ID  \n";
                nErrors++;
            }
            var patientID = document.getElementById("RemarksDescTxt").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (patientID == null || patientID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter Remarks \n";
                nErrors++;
            }
            var patientID = document.getElementById("ExtRefTxt").value; //document.forms["form1"]["txtInsRemarks"].value;
            if (patientID == null || patientID == "") {
                ErrorMessage = ErrorMessage + "- Please Enter External Reference\n";
                nErrors++;
            }
            if (nErrors == 0)
                return true; //if no errors return true
            else {
                alert(ErrorMessage);
                return false;
            }
        }

        function fnCrformSubmit() 
        {
        } 
    </script>

</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server" onsubmit="return validationSummary()">
		<br />
        <asp:Table ID="tt" CellPadding="0" CellSpacing="0"  HorizontalAlign="center"
            CssClass="MainTable" runat="server">
            <asp:TableRow Height="20">
                <asp:TableCell CssClass="MainHead">
                    <asp:Literal ID="MainTitleLtrl" runat="server">Register Sample</asp:Literal>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <!-----------Base table------------->
                    <asp:Table runat="server" CssClass="SubTable" Width="100%" CellPadding="4" CellSpacing="1"
                        HorizontalAlign="center" ID="Table1">
                        <asp:TableRow CssClass="HideRow" Height="0">
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="CodeTd">Request Number</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox ID="CodeTxt" runat="server" ReadOnly="true" CssClass="UCTxtCls" MaxLength="75"
                                    Width="200px" AccessKey="C" TabIndex="1"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="PrtDescTd">Protocol Description</asp:TableCell>
                            <asp:TableCell CssClass="MainTD" ColumnSpan="4">
                                <input type="button" id="prtBtn" runat="server" onclick="return prtBtn_onclick()"
                                    class='RsnPUP' style="height: 20px" title="Click Here" tabindex="4">
                                <asp:TextBox ID="KfId" runat="server" Height="0" Width="0" CssClass="HideRow" AutoPostBack="false"></asp:TextBox>
                                <asp:TextBox ID="PrtDescTxt" runat="server" Height="0" Width="0" CssClass="HideRow"></asp:TextBox>
                                <asp:Label ID="PrtDescLbl" runat="server" CssClass="MainTd"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="ProtocolIDTd">Protocol ID</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:Label ID="ProtocolIDLbl" runat="server" CssClass="MainTd"></asp:Label>
                                <asp:TextBox ID="ProtocolIDTxt" CssClass="HideRow" runat="server" MaxLength="75"
                                    Width="200px" AccessKey="C" TabIndex="1"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>

                         <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="TableCell1">Instrument ID</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                               <asp:DropDownList id="InsId" runat="server">  
                                       <asp:ListItem value="value" selected="True|False">  
                                          Text  
                                       </asp:ListItem>  
                               </asp:DropDownList>  
                            </asp:TableCell>
                        </asp:TableRow>


                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="PhyNameTd">Physician Name</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox ID="PhyNameTxt" runat="server" CssClass="TxtCls" MaxLength="75" Width="200px"
                                    AccessKey="C" TabIndex="1"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="PatienIdTd">Patient ID</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox ID="PatienIdTxt" runat="server" CssClass="TxtCls" MaxLength="75" Width="200px"
                                    AccessKey="C" TabIndex="1"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="ExtRefTd">Pathologist Name</asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox ID="ExtRefTxt" runat="server" CssClass="TxtCls" MaxLength="75" Width="200px"
                                    AccessKey="C" TabIndex="1"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="MainTD" ID="DescTd">
                                   <asp:Literal runat="server" ID="Literal1">Additonal Info</asp:Literal>
                            </asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox ID="RemarksDescTxt" runat="server" CssClass="TxtCls" TextMode="MultiLine" onkeypress="taLimit()"
                                    onkeyup="taCount()" MaxLength="250" Width="200px" AccessKey="D" TabIndex="2"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="RemarksRow" runat="server" CssClass="HideRow">
                            <asp:TableCell CssClass="MainTD">
                                <asp:Literal runat="server" ID="RemarksLtrl">Comments/Remarks</asp:Literal>
                            </asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:TextBox ID="RemarksTxt" runat="server" CssClass="TxtCls" MaxLength="250" Width="200px"
                                    TextMode="MultiLine" Rows="2" AccessKey="R"></asp:TextBox>
                                <%--<input type="button" onclick="fnOpenReasons(1),'RemarksTxt'" class='RsnPUP'>--%>
                            </asp:TableCell>
                        </asp:TableRow>
                          <asp:TableRow>
                            <asp:TableCell CssClass="MainTD">
                                 <%--  <asp:Literal runat="server" ID="Literal2">Additonal Info</asp:Literal>--%>
                            </asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:Button ID="Button1" runat="server" Class='ButCls' AccessKey="C"  Text="Submit"  Width="70"></asp:Button>
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
                      <%--  <asp:TableRow>
                             <asp:TableCell CssClass="MainTD"></asp:TableCell>
                            <asp:TableCell CssClass="MainTD">
                                <asp:Button ID="btnConfirm" runat="server" Class='ButCls' AccessKey="C"  Text="Submit"  Width="70"></asp:Button>
                            </asp:TableCell>
                           
                        </asp:TableRow>--%>
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
                
                  <%--    <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" 
                                                           controlToValidate="PrtDescTxt" 
                                                            errorMessage="Please enter protocol description" display="static">
                                                        </asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" 
                                                           controlToValidate="ProtocolIDTxt" 
                                                            errorMessage="Please Select Protocol" display="static">
                                                        </asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" 
                                                           controlToValidate="PhyNameTxt" 
                                                            errorMessage="Please Enter Physician Name" display="static">
                                                        </asp:RequiredFieldValidator>
                   <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" 
                                                           controlToValidate="PatienIdTxt" 
                                                            errorMessage="Please Enter Patient Name" display="static">
                                                        </asp:RequiredFieldValidator>
                                                                                                           


                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="False"
                        ShowMessageBox="True"></asp:ValidationSummary>--%>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
</body>

<script language="javascript" type="text/javascript">
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
