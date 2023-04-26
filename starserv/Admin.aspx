<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="starserv.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>

    .content {
        padding-top: 300px;
        display: flex;
        justify-content: center;
    }

    .login-form {
        display: flex;
        flex-direction: column;
        width: 600px;
        padding: 116px;
        background-color: var(--light);
        border-radius: 18px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    }

    .login-form label,.login-form input {
        margin-bottom: 18px;
    }

    .login-form input {
        padding: 8px;
        border-radius: 4px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .login-form input[type="submit"] {
        cursor: pointer;
        background-color: var(--primary);
        color: #fff;
        font-weight: bold;
        border: none;
        transition: background-color 0.3s;
          
    }

    .login-form input[type="submit"]:hover {
        background-color: #6a00cc;
    }

     /*for the button*/
    .admin-login-btn {
        margin-top: 20px;
        margin-left: 122px;
        background-color: var(--primary);
        color: #FFF;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        cursor: pointer;
        font-weight: bold;
        text-transform: uppercase;
        transition: background-color 0.3s;
        width: 100px;
    }

    .admin-login-btn:hover {
        background-color: #6a0bd7;
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
          <li><a href="AdminView.aspx">Admin Manage Reseervations</a></li>
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

    <div class="content">
        <form id="form1" runat="server" class="login-form">
            <div> 
                <label for ="username">Username:</label>   
                <input type="text" id="username" name="username" /> <br />
                <label for ="password">Password:</label>
                <input type="password" id="password" name="password" /> <br />
                <asp:Button ID="btnAdminLogin" runat="server" CssClass="admin-login-btn" Text="Log In" UseSubmitBehavior="false" OnClick="btnAdminLogin_Click" />
            </div>
        </form>
    </div>
</body>
</html>
