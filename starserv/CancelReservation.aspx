<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelReservation.aspx.cs" Inherits="starserv.CancelReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         body {
            font-family: 'Fira sans', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .information-container {
            width: 50%;
            margin: 50px auto;
            background-color: #f4f4f4; 
           /* box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);*/
            border-radius: 5px;
            padding: 20px;
            margin-left: 500px;
            margin-top: 150px;
            
            
        }

        .information-container h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
            font-weight: 600;
        }

        .information-container label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        .information-container input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
            transition: border-color 0.2s;
        }

        .information-container input[type="text"]:focus {
            border-color: #8c38ff;
            outline: none;
        }

        .information-container .submit-btn {
            width: 100%;
            background-color: #8c38ff;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.2s;
        }

        .information-container .submit-btn:hover {
            background-color: #6b2cc9;
        }

        /*Sad Image*/
        .bottom-right-image {
           position: fixed;
           bottom: 20px;
           right: 20px;
           width: 800px; /* Adjust the width as desired */
           height: auto; /* Maintain the aspect ratio */
           z-index: 10; /* Make sure the image is above other content */
        }

    
    
         /*For Navigation Bar */
        :root {
            --primary: #8c38ff;
            --light: #EEEEEE;
            --dark: #212121;
        }

        * {  
           margin: 0 0 0 0px;
           padding: 0;
           box-sizing: border-box;
           font-family: 'Fira sans', sans-serif;
           
        }

        .container2 {
            max-width: 100%; /* Updated to 100% */
            margin: 0 auto;
            padding-left: 16px; /* Updated padding-left to a smaller value */
            padding-right: 32px; /* Added padding-right */
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        nav{
            position:fixed;
            top:0;
            left:0;
            right:0;
            z-index:99;
            background-color: var(--dark);
            padding: 16px 32px;
            border-bottom: 3px solid var(--primary);

        }

        h1{
            color:#FFF;
            font-size: 28px;
            font-weight: 900;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-right: auto;
        }

        .hamburger{
            display: block;
            position: relative;
            z-index: 1;

            user-select:none;

            appearance: none;
            border: none;
            outline: none;
            background: none;
            cursor: pointer;
            
        }

        .hamburger span{
            display: block;
            width: 33px;
            height: 4px;
            margin-bottom: 5px;
            position: relative;

            background-color: var(--light);
            border-radius: 6px;
            z-index: 1;

            transform-origin: 0 0;
            transition: 0.4s;

        }

        .hamburger:hover span:nth-child(2){
            transform: translateX(10px);
            background-color:var(--primary);
        }

        .hamburger.is-active span:nth-child(1){
            transform:translate(0px, -2px) rotate(45deg);
        }

        .hamburger.is-active span:nth-child(2){
            opacity: 0;
            transform: translateX(15px);
        }

        .hamburger.is-active span:nth-child(3){
            transform:translate(-3px, 3px) rotate(-45deg);
        }

        .hamburger.is-active:hover span {
            background-color:var(--primary);
        }

        .menu {
          display: none;
          flex: 1 1 0%;
          justify-content: flex-end;
          margin: 0 -16px;

          margin-left: auto;
        }
        .menu ul {
          list-style-type: none;
          margin: 0;
          padding: 0;
          display: flex;
        }

        .menu li {
          margin-right: 16px;
        }

        .menu a{
            color: #FFF;
            margin: 0 16px;
            font-weight: 600;
            text-decoration: none;
            transition: 0.4s;
            padding: 8px 16px;
            border-radius: 99px;
        }

        .menu a.is-active, .menu a:hover {
            background-color: var(--primary);
        }

       @media(min-width: 768px){
           .hamburger{
               display: none;
           }
           .menu{
               display: flex;
           }

       }
        
    </style>

    <script>
        const hamburger = document.querySelector('.hamburger');

        hamburger.addEventListener('click', function () {
            this.classList.toggle('is-active');
        });
    </script>

        

    <link rel="stylesheet" href="NavigationStyleSheet.css" />
</head>
<body>

    <%-- for the Navigation Bar  --%>        
        <nav>
          <div class="container2">
          <h1>Star Serve</h1>
      
          <div class="menu">    
      <ul>
          <li><a href="Avaliability.aspx">Home</a></li>
          <li><a href="Admin.aspx">Admin</a></li>
          <li><a href="TeamBlog.html">About</a></li>
          <li><a href="CancelReservation.aspx">Cancel a Reservation</a></li>
          <li><a href="RestaurantLayout.aspx">Configration</a></li>
    </ul>

    </div>
              <button class="hamburger">
              <span></span>
              <span></span>
              <span></span>
          </button>
         </div>
        </nav>
        <%-- end of the navigation bar --%>

   <form id="form1" runat="server">
        <div class="information-container">
            <h2>Cancel Reservation</h2>
            <asp:Label ID="lblEmail" runat="server" Text="Enter Email Address:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" Text="Please select the reservation below."></asp:Label>
        </div>
       <br /><br />
        <div class="information-container" style="margin-top:10px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsCancelReservation" Height="515px" Width="666px" OnSelectedIndexChanged="btnConfirmCancel_Click">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TableDate" HeaderText="Date" SortExpression="TableDate" />
                    <asp:BoundField DataField="TableHour" HeaderText="Hour of Res." SortExpression="TableHour" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <SelectedRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCancelReservation" runat="server" ConnectionString="<%$ ConnectionStrings:starservConnectionString %>" SelectCommand="SELECT [TableDate], [TableHour], [Email] FROM [RestaurantTables] WHERE ([Email] = @Email)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
         <br />
            <asp:Button ID="btnConfirmCancel" runat="server" CssClass="submit-btn" Text="Submit Request" OnClick="btnConfirmCancel_Click" />     
        </div>
       <%-- <asp:Button ID="btnConfirmCancel" runat="server" Text="Cancel Reservation" OnClick="btnConfirmCancel_Click" />--%>
     <img class="bottom-right-image" src="https://i.imgur.com/wHzwMh6.png" alt="Image" /> 
   </form>
</body>
</html>
