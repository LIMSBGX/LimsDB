<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProtocolListPopup.aspx.cs" Inherits="CaliberEdap_Sample.ProtocolListPopup" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Protocol Selection List</title>
    <link href="/Styles/StyleSheet1.css" type="text/css" rel="stylesheet"/>
    <style type="text/css"">
        .MainHead, .MainFoot 
        {
                background-color: #b3bcda;
                background-image: linear-gradient(to bottom, #0A4168, #0A4168);
                color: White;
                float: left;
                font-family: Cambria;
                font-size: 16pt;
                font-weight: bold;
                height: 30px;
                padding: 10px 0 7px;
                text-decoration: none;
                text-shadow: -1px -1px 0 rgba(0, 0, 0, 0.3);
                width: 100%;
            }  
            
            .fotterButton
            {
            }
            
    </style>
</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
        <div id="Main" class="MainDiv" height="100%">  
             <div>
                <span class="MainHead"> Protocol List </span> 
                <sapn class="HideRow">  <sapn id="RBVal"></sapn> </sapn>
             </div>
             <div> 
                <span class="filterdiv" colspan="2">
                    <asp:Literal ID="Literal1" runat="server">Protocol ID</asp:Literal>
                    <asp:TextBox ID="FindTxt" runat="server" Width="180px" CssClass='TxtCls'>%</asp:TextBox>
                </span>
                <span class="filterdiv" colspan="2">
                    <asp:Literal ID="Literal2" runat="server">Records Limit</asp:Literal>
                    <asp:TextBox ID="FetchSizeTxt" runat="server" Width="50px" CssClass="TxtCls" MaxLength="3"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Display" class="ButCls"></asp:Button>
                </span>
            </div>
            <div calss="DataGriD" style="height:300px; overflow-x: hidden; overflow-y: auto;"> 
               <asp:GridView ID="GridView1" Runat="server" 
                    AutoGenerateColumns="False" BorderWidth="1px" 
                    BackColor="White" GridLines="Horizontal"
                    CellPadding="3" BorderStyle="None" BorderColor="#E7E7FF" 
                    OnRowDataBound="GridView_RowDataBound">
                    <FooterStyle ForeColor="#ffffff" BackColor="#ffffff"></FooterStyle>
                    <PagerStyle ForeColor="#ffffff" HorizontalAlign="Right" BackColor="#ffffff"></PagerStyle>
                    <HeaderStyle ForeColor="#ffffff" Font-Bold="True" BackColor="#0A4168"></HeaderStyle>
                    <AlternatingRowStyle BackColor="#D7D6E0"></AlternatingRowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="SNO">
                          <ItemTemplate>
                              <asp:Label ID="lblSerial" runat="server"></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Protocol ID" DataField="PRT_UCODE" SortExpression="INS_UCODE"></asp:BoundField>
                        <asp:BoundField HeaderText="Protocol Description" DataField="PRT_NAME" SortExpression="PRT_DESC"></asp:BoundField>
                    </Columns>
                </asp:GridView>
         </div>
         </br>
         <div id="footer">
              <span class="MainFoot">
                  <div class="fotterButton">
                       <input class="ButCls" style="width: 50px" onclick="fnCrCloseWin()"  type="button" value="Ok">
                       <input class="ButCls" style="width: 60px" onclick="fnCrCancel()"  type="button" value="Cancel">
                  </div>
              </span>  
        </div>
     </div>
  </form>

    <script language="javascript">

        function fnCrGetCode(RowCnt)
        {
            var prtName = document.all("prtGrdName" + RowCnt).innerHTML
            var prtId = document.all("prtGrdId" + RowCnt).innerHTML
            var prtDesc = document.all("prtGrdDesc" + RowCnt).innerHTML
            document.getElementById("RBVal").value = prtId

            var sID = "RBID+" + RowCnt;

            var checkbox = document.getElementById(sID);
            //alert(sID);
            if (checkbox.checked != true)
             {
                 //alert("un checked");
                 opener.fnCrSetToCode1Remove(prtId, prtName, prtDesc)
            } else {
               // alert("checked");
                opener.fnCrSetToCode1(prtId, prtName, prtDesc)
            }
           // opener.fnCrSetToCode1(prtId, prtName, prtDesc)
        }
        function fnCrCancel()
        {
            opener.fnCrSetToCode1('', '', '')
            window.self.close()
        }
        document.oncontextmenu = new Function("return false")
        function fnCrCloseWin()
        {
            if (document.getElementById("RBVal").value == undefined) 
            {
                alert("Select Value")
                return (false);
            }
            opener.fnCrformSubmit()
            window.self.close()
       }
   </script>

</body>
</html>
