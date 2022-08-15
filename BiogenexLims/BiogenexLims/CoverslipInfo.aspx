<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoverslipInfo.aspx.cs" Inherits="BiogenexLims.CoverslipInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/stockbox.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
          <div class="wrapper">
              
              <div class="box">
                   <div class="content"> Cover Slips 18 X 18</div>
                   <div class="sub-conetent"> 
                   <label class="FixedLabel"> Stock : </label> <asp:Label ID="Stock18X18" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Consumed : </label> <asp:Label ID="Consumed18X18" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="EstimatedSlides18X18" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="StockUpadtedOn18X18" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
              </div>
              <div class="box">
                   <div class="content"> Cover Slips 25 X 25</div>
                   <div class="sub-conetent"> 
                   <label class="FixedLabel"> Stock : </label> <asp:Label ID="Stock25X25" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Consumed : </label> <asp:Label ID="Consumed25X25" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="EstimatedSlides25X25" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="StockUpadtedOn25X25" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>

              </div>
              <div class="box">
                   <div class="content"> Cover Slips 25 X 40<</div>
                   <div class="sub-conetent"> 
                   <label class="FixedLabel"> Stock : </label> <asp:Label ID="Stock25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Consumed : </label> <asp:Label ID="Consumed25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="EstimatedSlides25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="StockUpadtedOn25X40" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
              </div>
          </div>
    </form>
</body>
</html>
