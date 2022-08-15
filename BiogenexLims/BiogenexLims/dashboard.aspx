<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="BiogenexLims.dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Styles/stockbox.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
          <div class="wrapper">
              <div class="box">
                   <div class="content"> Small Pipettes</div>
                         <div class="sub-conetent"> 
                           <label class="FixedLabel"> Stock : </label> <asp:Label ID="SmallPipettyStock" runat="server" Text="Label" ></asp:Label> <br /> 
                           <label class="FixedLabel"> Consumed : </label> <asp:Label ID="SmallPipettyConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                           <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="SmallPipettEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                           <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="SmallPipettStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                         </div>
              </div>
              <div class="box">
                   <div class="content"> Large Pipettes</div>
                    <div class="sub-conetent"> 
                   <label class="FixedLabel"> Stock : </label> <asp:Label ID="LargePipettyStock" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Consumed : </label> <asp:Label ID="LargePipettyConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="LargePipettEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="LargePipettStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
               </div>
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
                   <div class="content"> Cover Slips 25 X 40</div>
                   <div class="sub-conetent"> 
                   <label class="FixedLabel"> Stock : </label> <asp:Label ID="Stock25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Consumed : </label> <asp:Label ID="Consumed25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="EstimatedSlides25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="StockUpadtedOn25X40" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
              </div>
              <div class="box">
                  <div class="content"> DI Water Availability</div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="DIStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="DIConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="DIEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="DIStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                 
              </div>

                <div class="box">
                  <div class="content"> IHC Buffer Availability </div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="IHCStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="IHCConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="IHCEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="IHCStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                
              </div>

              <div class="box">
                  <div class="content"> ISH Buffer Availability </div>
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
                  <div class="content"> Dewax Availability   </div>
                    <div class="sub-conetent"> 
                     <label class="FixedLabel"> Stock : </label> <asp:Label ID="DewaxStock" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Consumed : </label> <asp:Label ID="DewaxConsumed" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Estimated Slides : </label> <asp:Label ID="DewaxEstimatedSlides" runat="server" Text="Label" ></asp:Label> <br /> 
                     <label class="FixedLabel"> Stock Updated On : </label> <asp:Label ID="DewaxStockUpdatedOn" runat="server" Text="Label" ></asp:Label> <br />  
                   </div>
                </div>
            </div>
    
   
    </form>
</body>
</html>
