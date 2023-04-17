<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestaurantLayout.aspx.cs" Inherits="starserv.RestaurantLayout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .restaurant-layout {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0;
        }
        .table {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            background-color: #f2f2f2;
            border-radius: 4px;
            padding: 10px;
            width: 100px;
            height: 100px;
            margin-bottom: 20px;
        }
        .chair {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ccc;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            margin: 5px;
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
        <div>
            <div class="restaurant-layout">
    <div class="table">
        <div class="chair">C1</div>
        <div class="chair">C2</div>
        <div class="chair">C3</div>
        <div class="chair">C4</div>
    </div>
    <div class="table">
        <div class="chair">C1</div>
        <div class="chair">C2</div>
        <div class="chair">C3</div>
        <div class="chair">C4</div>
    </div>
    <div class="table">
        <div class="chair">C1</div>
        <div class="chair">C2</div>
        <div class="chair">C3</div>
        <div class="chair">C4</div>
    </div>
    <div class="table">
        <div class="chair">C1</div>
        <div class="chair">C2</div>
        <div class="chair">C3</div>
        <div class="chair">C4</div>
    </div>
    <div class="table">
        <div class="chair">C1</div>
        <div class="chair">C2</div>
        <div class="chair">C3</div>
        <div class="chair">C4</div>
    </div>
    <div class="table">
        <div class="chair">C1</div>
        <div class="chair">C2</div>
        <div class="chair">C3</div>
        <div class="chair">C4</div>
    </div>
</div>
        </div>
    </form>
</body>
</html>