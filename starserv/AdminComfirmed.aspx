<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminComfirmed.aspx.cs" Inherits="starserv.AdminComfirmed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .container {
            margin: 250px;
            margin-left: 350px;
            color: white;
            text-decoration: underline;
            background-color: gray;
            padding: 25px;
            padding-right: 10px;
            text-align: center;
            opacity: 90%;
        }
        body {
            background-image: url("https://i.imgur.com/BsY1U7g.png");
            background-color: white;
        }
    </style>
    <link rel="stylesheet" href="NavigationStyleSheet.css" />
</head>
<body>
    <div class ="navigation">
        <ul>
          <li><a href="Avaliability.aspx">Home</a></li>
          <li><a href="Admin.aspx">Admin</a></li>
          <li><a href="TeamBlog.html">About</a></li>
          <li><a href="RestaurantLayout.aspx">Change Layout</a></li>
          <li><a href="AdminView.aspx">View All Reservations</a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Confirmed.</h1>
            <h3><a href="AdminView.aspx"> Return to View? </a></h3>
        </div>
       
    </form>
</body>
</html>