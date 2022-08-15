<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateConsumables.aspx.cs" Inherits="BiogenexLims.UpdateConsumables" %>

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
        .MinTable {
            height: 23px;
        }

        #AppBody {
            min-height: 600px;
        }

        .button {
            vertical-align: middle;
            border: 0px solid #25729a;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            font-size: 12px;
            font-family: Cambria, helvetica, sans-serif;
            padding: 10px;
            margin-bottom: 5px;
            text-decoration: none;
            display: inline-block;
            text-align: left;
            color: #FFFFFF;
            /*background-image: url("Images/templatemo_button_05.png");*/
            color: rgba(0,0,0,0.87);
            width: 220px;
            height: 50px;
            background-repeat: no-repeat;
            font-size: 18px;
        }

        .MenuRow {
        }

            .MenuRow:hover {
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
                vertical-align: middle;
                border: 1px solid #1c5675;
                font-size: 18px;
                background-repeat: no-repeat;
            }

        .icon {
            vertical-align: middle;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            font-size: 12px;
            font-family: Cambria, helvetica, sans-serif;
            text-decoration: none;
            display: inline-block;
            text-align: left;
            font-weight: bold;
            color: #FFFFFF;
            padding: 10px;
            /*background-image: url("Images/templatemo_button_05.png");*/
            font-size: 17px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <asp:Table ID="tt" runat="server" CellPadding="0" CellSpacing="1"
            HorizontalAlign="center" CssClass="MainTable" Font-Size="Large">
            <asp:TableRow Height="50">
                <asp:TableCell CssClass="MainHead" ColumnSpan="7">
                    <asp:Literal ID="MainTitleLtrl" runat="server"> Reagent Kits</asp:Literal>
                </asp:TableCell>
                <asp:TableCell CssClass="MainFoot" Style="font-size: 11pt;" HorizontalAlign="Right">

                    <asp:Literal ID="Literal2" runat="server"> Select Reagent Kit:</asp:Literal>
                    <asp:DropDownList Font-Size="Medium" ID="DropDownList1" runat="server"
                        AutoPostBack="true">
                        <asp:ListItem  Value="XT148-YCD">Xflex Ultra Consumable Kit</asp:ListItem>
                        <asp:ListItem Value="QD550-YCDE"> Xviz Detection kit for Xmatrx</asp:ListItem>
                        <asp:ListItem Value="HK016-XAK">Tissue Deparaffinization Solution</asp:ListItem>
                        <asp:ListItem Value="HK583-5KE">Super Sensitive Wash Buffer</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Literal ID="Literal1" runat="server"> Qty:</asp:Literal>
                    <asp:DropDownList Font-Size="Medium" ID="DropDownList2" runat="server"
                        AutoPostBack="true">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;
                        <asp:Button ID="UpadateKitInfo" runat="server" OnClick="UpdateKitInformation" Text="Update" class="ButCls"></asp:Button>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <table width="100%" height="100%" align="center" class="MainTable" cellspacing="0" cellpadding="0">
            <tr>
                <td width="300" style="vertical-align: top" class="Lefttd1">
                    <br />
                    <!--<iframe id="AppBody" name="AppBody" style="display: block;border:none;" align="middle"
                  scrolling="auto" src="home.aspx" width="100%" enableviewstate="false"    marginwidth="0" 
                  marginheight="0" runat="server"></iframe>-->
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
