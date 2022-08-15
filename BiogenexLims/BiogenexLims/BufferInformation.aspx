u<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BufferInformation.aspx.cs" Inherits="BiogenexLims.BufferInformation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Buffers Infomation</title>
    <link href="Styles/stockbox.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
          <div class="wrapper">
               <div class="box">
                  <div class="content"> DI Water Availability </div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="DIStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="DIConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="DIEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="DIStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>

                <div class="box">
                  <div class="content"> IHC Buffer Availability</div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="IHCStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="IHCConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="IHCEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="IHCStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>

              <div class="box">
                  <div class="content"> ISH Buffer Availability</div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="ISHStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="ISHConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="ISHEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="ISHStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>

              <div class="box">
                  <div class="content"> SS Buffer Availability</div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="SSStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="SSConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="SSEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="SSStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>

              <div class="box">
                  <div class="content"> Alchohol Availability</div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="AlchoholStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="AlchoholConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="AlchoholEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="AlchoholStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>

              <div class="box">
                  <div class="content"> Dewax Availability</div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="DewaxStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="DewaxConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="DewaxEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="DewaxStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>
             
          </div>
        </div>
    </form>
</body>
</html>
