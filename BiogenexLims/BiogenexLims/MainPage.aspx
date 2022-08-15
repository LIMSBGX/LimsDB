<%@ Page Language="C#" AutoEventWireup="true" ViewStateMode="Disabled" EnableViewState="false" CodeBehind="MainPage.aspx.cs" Inherits="CaliberEdap_Sample.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="Styles/util.css" />
    <link rel="stylesheet" type="text/css" href="Styles/main.css" />

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            var height = ($(document).height()) + "px"
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

        .headerright {
            box-shadow: rgb(0 0 0 / 20%) 0px 2px 4px -1px, rgb(0 0 0 / 14%) 0px 4px 5px 0px, rgb(0 0 0 / 12%) 0px 1px 10px 0px;
            display: flex;
            flex-direction: column;
            box-sizing: border-box;
            flex-shrink: 0;
            position: absolute;
            top: 0px;
            left: auto;
            right: 0px;
            background-color: rgb(10, 65, 104);
            color: rgb(255, 255, 255);
            z-index: 1201;
            transition: width 225ms cubic-bezier(0.4, 0, 0.6, 1) 0ms, margin 225ms cubic-bezier(0.4, 0, 0.6, 1) 0ms;
            margin-left: 280px;
            width: calc(100% - 280px);
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
            color: rgba(0, 0, 0, 0.87);
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
        <div class="page background-size: cover;">
            <div class="header1">
                <table width="100%" height="100%" id="Maintable" align="center" cellspacing="0" class="MainTable" cellpadding="0">
                    <tr height="55" style="height: 55px;">
                        <td width="100%">
                            <table width="100%" height="100%" align="center" cellspacing="0" cellpadding="0">
                                <tr height="60" valign="center">
                                    <td width="300" class="Leftheadertd">
                                        <img src="Images/biogenex_logo.png" width="260" />
                                        <br />
                                    </td>
                                    <%-- <span style="font-weight: bold; font-size: 18px; float: left;margin-top: 14px; text-align: left;color: #ffffff">Laboratory Information Management System</span>
                                <br />--%>
                                    <td style="text-align: center; vertical-align: center; font-family: Arial; font-weight: bold; font-size: 18px; color: #ffffff; margin-top: 14px" class="Rightheadertd">
                                        <span>Laboratory Information Management System</span>
                                    </td>
                                    <td class="Rightheadertd ">
                                        <!--   <span style="font-weight: bold;color:#0A4168"> Biogenex Integrated Solution for Automated Laboratory Inventory
                                    Management</span>
                                <br />
                                <br /> -->

                                        <span id="user" runat="server" style="font-weight: bold; font-size: 11pt; float: right; margin-top: 14px; margin-right: 30px; text-align: left; color: #ffffff">user</span>

                                        <asp:ImageButton OnClick="Logout_Click" ID="Image10" Style="float: Right;" class="icon" ImageUrl="Images/logout.png" ToolTip="Log Out" Width="50" runat="server" />


                                    </td>





                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr width="100%" height="100%">
                        <td width="100%" height="100%">
                            <table width="100%" height="100%" align="center" class="MainTable" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="300" style="vertical-align: top" class="Lefttd">
                                        <br />
                                        <!--  <table width="100%" height="100%" align="center" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="25" align="center"><a href="mainpage.aspx" class="button">Registration</a> </td>
                                </tr><img src="Images/biogenex_logo.png" /><img src="Images/biogenex_logo.png" />
                                <tr >
                                  <td height="25" align="center"><a href="mainpage.aspx" class="button">Instruments</a></td>
                                </tr>
                                <tr>
                                  <td height="25" align="center"><a href="mainpage.aspx" class="button">Sample Request</a></td>
                                </tr>
                                <tr>
                                  <td height="25" align="center"><a href="mainpage.aspx" class="button">Sample Acceptence</a></td>
                                </tr>
                                <tr>
                                  <td height="25" align="center"><a href="mainpage.aspx" class="button">Sample Report</a></td>
                                </tr>
                                </table>-->



                                        <asp:Table ID="menuTbl" runat="server" CssClass="MainTable">
                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image7" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" />
                                                    <asp:Button ID="Dashboard" class="button" Text="Dash Board" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" />
                                                    <asp:Button ID="userslist" class="button" Text="Users List" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image1" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" />
                                                    <asp:Button ID="InsReg" class="button" Text="Instruments" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image8" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" /><asp:Button ID="ConsumableInformation" class="button" Text="Consumables" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image9" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" /><asp:Button ID="updateconsumables" class="button" Text="Reagent Kit" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image2" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" /><asp:Button ID="ProtocolInfo" class="button" Text="Protocols" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image5" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" /><asp:Button ID="ReagentInfo" class="button" Text="Reagents" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image3" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" /><asp:Button ID="SampleRequest" class="button" Text="Register Sample" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image4" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" />
                                                    <asp:Button ID="SampleAcceptedList" class="button" Text="Sample List" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                            <asp:TableRow>
                                                <asp:TableCell class="MenuRow">
                                                    <asp:Image ID="Image6" class="icon" ImageUrl="Images/DashBoard.png" Width="40" runat="server" /><asp:Button ID="SampleReport" class="button" Text="Sample Status" OnClick="MenuButtonClick" runat="server" />
                                                </asp:TableCell>
                                            </asp:TableRow>

                                        </asp:Table>



                                    </td>
                                    <td class="Righttd">
                                        <iframe id="AppBody" name="AppBody" style="display: block; border: none;" align="middle"
                                            scrolling="auto" src="home.aspx" width="100%" enableviewstate="false" marginwidth="0"
                                            marginheight="0" runat="server"></iframe>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>


            </div>
        </div>

    </form>
</body>
</html>
