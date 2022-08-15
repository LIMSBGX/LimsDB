<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NA-InstrumentRegistration.aspx.cs" Inherits="BiogenexLims.InstrumentRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Biogenex Lims Login</title>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>

	<link rel="stylesheet" type="text/css" href="/Styles/util.css"/>
	<link rel="stylesheet" type="text/css" href="/Styles/main.css"/>
<!--===============================================================================================-->
</head>
<body>
	
	
	<div class="container-login100" style="background-image: url('/Images/back.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-40 p-b-40">
			<!--<form class="login100-form validate-form">-->
            <form id="form1" runat="server" class="login100-form validate-form">

				<span class="login100-form-title p-b-37">
					Biogenex LIMS Instrument Registration.
				</span>

				
				<div class="wrap-input100 validate-input m-b-25 " data-validate = "Enter Instrument ID">
				              
					<asp:TextBox ID="texInsID" runat="server" CssClass="validate[required] w-88 m-l-10 m-b-2 m-t-2 " placeholder="InstrumentId" />
					<span class="focus-input100"></span>
				</div>

                <div class="wrap-input100 validate-input m-b-20 " data-validate="Enter Ins Name">
					<!--<input class="input100" type="text" name="username" placeholder="username or email"> -->
                   	<asp:TextBox ID="txtInsName" runat="server" CssClass="validate[required] w-88 m-l-10 m-b-2 m-t-2 " placeholder="Instrument Name" />
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input m-b-20 " data-validate="Enter Description">
                  
					<asp:TextBox ID="txtInsDescription" runat="server" CssClass="validate[required] w-88 m-l-10 m-b-2 m-t-2 " placeholder="Description" />
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25 " data-validate = "Enter Instrument IP">
					<asp:TextBox ID="txtInsIP" runat="server"  CssClass="validate[required] w-88 m-l-10 m-b-2 m-t-2 " placeholder="Instrument IP"/>
					<span class="focus-input100"></span>
				</div>
				
				<div class="container-login100-form-btn">

                <asp:Button ID="Button1" Text="Submit" runat="server" class="login100-form-btn" />
					<!--<button class="login100-form-btn">
						Sign In
					</button> -->
				</div>

                <div class="text-center">
                
                <asp:Label id="ErrorMessgae" runat="server" class="login100-form-title p-b-37">
					
				</asp:Label>
		
			
				
			</form>

			
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>

    <link href="/Styles/validationEngine.jquery.css" rel="stylesheet" type="text/css" ></link>
    <script type="text/javascript" src="/scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="/scripts/jquery.validationEngine-en.js"
        charset="utf-8"></script>
    <script type="text/javascript" src="/scripts/jquery.validationEngine.min.js"
        charset="utf-8"></script>
    <script type="text/javascript">
        $(function () {
            $("#form1").validationEngine('attach', { promptPosition: "topRight" });
        });
    </script>
    <script type="text/javascript">
        function DateFormat(field, rules, i, options) {
            var regex = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
            if (!regex.test(field.val())) {
                return "Please enter date in dd/MM/yyyy format."
            }
        }
    </script>
</body>
</html>

