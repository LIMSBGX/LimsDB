<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="New-DashBoard.aspx.cs" Inherits="BiogenexLims.New_DashBoard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link href="Styles/stockbox.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
          <div class="wrapper">

              <div class="newbox">
                   <div class="newcontent">Barrier Slides 25x40</div>
                         <div class="new-sub-conetent"> 
                           <asp:Label ID="BarrierSlides25x40" runat="server" Text="Label" ></asp:Label> <br /> 
                           </div>
              </div> 
               <div class="newbox">
                   <div class="newcontent">Barrier Slides 25x25</div>
                         <div class="new-sub-conetent"> 
                           <asp:Label ID="BarrierSlides25x25" runat="server" Text="Label" ></asp:Label> <br /> 
                           </div>
              </div> 
               <div class="newbox">
                   <div class="newcontent">Barrier Slides 18x18</div>
                         <div class="new-sub-conetent"> 
                           <asp:Label ID="BarrierSlides18x18" runat="server" Text="Label" ></asp:Label> <br /> 
                           </div>
              </div> 
              <div class="newbox">
                   <div class="newcontent"> Small Pipettes</div>
                         <div class="new-sub-conetent"> 
                           <asp:Label ID="SmallPipettyStock" runat="server" Text="Label" ></asp:Label> <br /> 
                           </div>
              </div>
              <div class="newbox">
                   <div class="newcontent"> Large Pipettes</div>
                    <div class="new-sub-conetent"> 
                    <asp:Label ID="LargePipettyStock" runat="server" Text="Label" ></asp:Label> <br /> 
                   
                   </div>
               </div>
              <div class="newbox">
                   <div class="newcontent"> Cover Slips 18 X 18</div>
                   <div class="new-sub-conetent"> 
                   <asp:Label ID="Stock18X18" runat="server" Text="Label" ></asp:Label> <br /> 
                   
                   </div>
              </div>
              <div class="newbox">
                   <div class="newcontent"> Cover Slips 25 X 25</div>
                   <div class="new-sub-conetent"> 
                    <asp:Label ID="Stock25X25" runat="server" Text="Label" ></asp:Label> <br /> 
                   
                   </div>

              </div>
              <div class="newbox">
                   <div class="newcontent"> Cover Slips 25 X 40</div>
                   <div class="new-sub-conetent"> 
                   <asp:Label ID="Stock25X40" runat="server" Text="Label" ></asp:Label> <br /> 
                   
                   </div>
              </div>
             

              <div class="newbox">
                  <div class="newcontent"> IHC Buffer Availability </div>
                    <div class="new-sub-conetent"> 
                   <asp:Label ID="IHCStock" runat="server" Text="Label" ></asp:Label> <br /> 
                    
                   </div>
                
               </div>

              

           

        

              <div class="newbox">
                  <div class="newcontent"> Dewax Availability   </div>
                    <div class="new-sub-conetent"> 
                      <asp:Label ID="DewaxStock" runat="server" Text="Label" ></asp:Label> <br /> 
                    
                   </div>
                </div>
            </div>
    
   
    </form>
</body>
</html>
