<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="starserv.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>        
        .logo{height:110px;
            width: 93px;
            margin-right:12px;
            }
        a {
            border:2px solid black;
            padding:5px;
            background-color:#FFFAA0;
            }
        body {
        
            background-color:#ADD8E6;
        }
    </style>
    <title>StarServ</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>STARSERV</h1>
            <img src="Img/logo.png" class="logo" alt="Logo for StarServ"/>
            <a href="TeamBlog.html">Team Blog</a>
            <a href="Avaliability.aspx">Availability page</a>&nbsp;

        </div>
    </form>
</body>
</html>