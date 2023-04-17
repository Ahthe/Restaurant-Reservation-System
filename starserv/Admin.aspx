<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="starserv.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="NavigationStyleSheet.css" />
</head>
<body>
    <div class ="navigation">
        <ul>
          <li><a href="Avaliability.aspx">Home</a></li>
          <li><a href="Admin.aspx">Admin</a></li>
          <li><a href="TeamBlog.html">About</a></li>
          <li><a href="CancelReservation.aspx">Cancel a Reservation</a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <div> 
            <label for ="username">Username:</label>   
            <input type="text" id="username" name="username" /> <br />
            <label for ="password">Password:</label>
            <input type="password" id="password" name="password" /> <br />
            <asp:Button ID="btnAdminLogin" runat="server" Text="Log In" />
        </div>
    </form>
</body>
</html>
