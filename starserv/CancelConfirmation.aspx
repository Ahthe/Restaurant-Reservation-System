<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelConfirmation.aspx.cs" Inherits="starserv.CancelConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmed!</title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Cancellation Confirmed.</h1>
            <h3><a href="Avaliability.aspx"> Make a new Reservation? </a></h3>
        </div>
        <%--<div class="burger-image">
            <img src="https://i.imgur.com/BsY1U7g.png" alt="Burger Image" />
        </div>--%>
    </form>
</body>
</html>
