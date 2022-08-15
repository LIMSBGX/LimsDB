<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PipetteInformation.aspx.cs" Inherits="BiogenexLims.PipetteInformation" %>

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
            </div>

    
    </div>
    </form>
</body>
</html>
