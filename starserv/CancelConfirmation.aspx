<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelConfirmation.aspx.cs" Inherits="starserv.CancelConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmed!</title>
    <style>
        * {
            box-sizing: border-box;
        }
        .container {
            margin: 5%;
            padding: 2%;
            background-color: gray;
            color: white;
            text-align: center;
            opacity: 90%;
            max-width: 800px;
        }
        body {
            background-image: url("https://i.imgur.com/BsY1U7g.png");
            background-color: white;
            margin: 0;
            font-size: 16px;
        }
        .navigation ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .navigation li {
            float: left;
        }
        .navigation li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navigation li a:hover {
            background-color: #111;
        }
        @media screen and (max-width: 600px) {
            .container {
                margin: 10px;
                padding: 15px;
            }
            .navigation li {
                flex: 1 1 100%;
                text-align: center;
            }
        }
    </style>
    <link rel="stylesheet" href="NavigationStyleSheet.css" />
</head>
<body>
    <div class="navigation">
        <ul>
          <li><a href="Avaliability.aspx">Home</a></li>
          <li><a href="Admin.aspx">Admin</a></li>
          <li><a href="TeamBlog.html">About</a></li>
          <li><a href="CancelReservation.aspx">Cancel a Reservation</a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Cancellation Confirmed.</h1>
            <h3><a href="Avaliability.aspx"> Make a new Reservation? </a></h3>
        </div>
    </form>
</body>
</html>
