<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsumablesPage.aspx.cs" Inherits="BiogenexLims.ConsumablesPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="Styles/StyleSheet1.css" />

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            var height = ($(document).height()) + "px"
            // alert(height);
            $(".page").css({ "min-height": height });
            $("#Maintable").css({ "min-height": height });

        });
</script>
    <style type="text/css">
        .MinTable
        {
            height: 23px;
        }
        #AppBody
        {
            min-height:600px;
        }
        
        .button
        {
	        vertical-align:middle;
            border:0px solid #25729a; 
            -webkit-border-radius: 3px; 
            -moz-border-radius: 3px;border-radius: 3px;
            font-size:12px;font-family:Cambria, helvetica, sans-serif; 
            padding:10px;
            margin-bottom:5px;
            text-decoration:none; display:inline-block;
            text-align:left;
            color: #FFFFFF;
            /*background-image: url("Images/templatemo_button_05.png");*/
            color:rgba(0, 0, 0, 0.87);
            width: 220px;
            height:50px;
            background-repeat:no-repeat;
            font-size:18px;
        }

      
        .MenuRow
        {
        }
        .MenuRow:hover
        {
         -webkit-border-radius: 3px; 
         -moz-border-radius: 3px;
         border-radius: 3px;   
         vertical-align:middle;
         border:1px solid #1c5675;
         font-size:18px;
         background-repeat:no-repeat;
        }
        
         .icon
        {
	        vertical-align:middle;
          
            -webkit-border-radius: 3px; 
            -moz-border-radius: 3px;border-radius: 3px;
            font-size:12px;font-family:Cambria, helvetica, sans-serif; 
            text-decoration:none; display:inline-block;
            text-align:left;
            font-weight:bold; color: #FFFFFF;
            padding:10px;
            /*background-image: url("Images/templatemo_button_05.png");*/
            
             
            font-size:17px;
        }

   </style>
    
</head>
<body>
 
<form id="form2" runat="server">
     <br />
     <asp:Table ID="tt" runat="server" CellPadding="0" CellSpacing="1" 
            HorizontalAlign="center" CssClass="MainTable">
            <asp:TableRow>
                <asp:TableCell CssClass="MainHead" ColumnSpan="7">
                    <asp:Literal ID="MainTitleLtrl" runat="server"> Consumables</asp:Literal>
                </asp:TableCell>
                <asp:TableCell CssClass="MainFoot" HorizontalAlign="Right">
                     <asp:DropDownList style="font-size:11pt;" id="DropDownList1" runat="server"  
                                       AutoPostBack="true"   
                                       OnSelectedIndexChanged="OnSelectedIndexChangedMethod">  
                                       <asp:ListItem value="SlideInfo"  selected="True">Slides</asp:ListItem>  
                                       <asp:ListItem value="CoverSlipInfo">CoverSlips</asp:ListItem> 
                                       <asp:ListItem value="PipetteIno">Pipettes</asp:ListItem>
                                       <asp:ListItem value="BufferInfo">Buffers</asp:ListItem>
                                       <%--<asp:ListItem value="UserInfo"> User Information</asp:ListItem>
                                       <asp:ListItem value="InstrumentInfo">Instrument Information</asp:ListItem>--%>
                     </asp:DropDownList>
               </asp:TableCell>
         </asp:TableRow>
  </asp:Table>
  <table width="100%" height="100%" align="center" class="MainTable" cellspacing="0" cellpadding="0">
        <tr>
           <td width="300" style="vertical-align:top" class="Lefttd1"> <br />
                  <iframe id="AppBody" name="AppBody" style="display: block;border:none;" align="middle"
                   scrolling="auto" src="Table-SlideIfo.aspx" width="100%" enableviewstate="false"    marginwidth="0" 
                   marginheight="0" runat="server"></iframe>
           </td>
       </tr>
  </table>
</form>
</body>
</html>
