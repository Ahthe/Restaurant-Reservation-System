<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestaurantLayout.aspx.cs" Inherits="starserv.RestaurantLayout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Resturant Layout Configuration</title>
<style>

    body{
         padding-top: 180px;
    }
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
        margin-bottom: 10px;
        margin-right: 100px;
        margin-left: 100px;
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

    .chair.selected {
    background-color: #f2f2f2;
}

.chair.reserved {
    background-color: red;
}

  .button {
            width: 200px;
            padding: 6px 12px;
            font-size: 14px;
            font-weight: bold;
            border: 1px solid transparent;
            border-radius: 4px;
            background-color: orangered;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .button:hover {
            background-color: darkorange;
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
   

</head>
<body>
    <form id="form1" runat="server">
  
                    <br />
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
 
        <div id="config-panel">
    <h2>Configuration</h2>
    <label for="num-tables">Number of tables:</label>
    <input type="number" id="num-tables" min="1" value="1"/>
    <label for="num-chairs">Chairs per table:</label>
    <input type="number" id="num-chairs" min="1" value="1"/>
    <button id="apply-config" class="button">Apply Configuration</button>
</div>


      
        <div id="restaurant-layout-container">
    <div class="restaurant-layout"></div>
</div>
        
        <br />
        <button id="confirm-button" class="button">Confirm Reservation</button>
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
    </form>


    <script>
        async function loadLayout() {
            try {
                const response = await fetch('layout.json');
                if (!response.ok) {
                    throw new Error('Error loading layout.json');
                }
                const layoutData = await response.json();
                createLayout(layoutData);
            } catch (error) {
                console.error('Error:', error);
            }
        }

        function createLayout(layoutData) {
            const restaurantLayout = document.querySelector('.restaurant-layout');
            layoutData.tables.forEach((table, index) => {
                const tableElement = createTable(index + 1, table.chairs);
                restaurantLayout.appendChild(tableElement);
            });
        }

        function createTable(id, chairs) {
            const table = document.createElement('div');
            table.className = 'table';

            chairs.forEach((chair, index) => {
                const chairElement = createChair(index + 1, chair.status);
                table.appendChild(chairElement);
            });

            return table;
        }

        function createChair(id, status) {
            const chair = document.createElement('div');
            chair.className = 'chair';
            chair.textContent = `C${id}`;

            if (status === 'reserved') {
                chair.classList.add('reserved');
                chair.innerHTML = '<span style="color: red;">R</span>';
            }

            return chair;
        }

        function applyConfig() {
            const numTables = parseInt(document.querySelector('#num-tables').value, 10);
            const numChairs = parseInt(document.querySelector('#num-chairs').value, 10);

            const layoutData = {
                tables: Array.from({ length: numTables }, () => ({
                    chairs: Array.from({ length: numChairs }, () => ({ status: 'available' }))
                }))
            };

            // Remove existing layout
            const restaurantLayout = document.querySelector('.restaurant-layout');
            restaurantLayout.innerHTML = '';

            // Create new layout
            createLayout(layoutData);
        }

        document.addEventListener('DOMContentLoaded', function () {

            document.querySelector('#apply-config').addEventListener('click', applyConfig);

            const chairs = document.querySelectorAll('.chair');
            let selectedChair = null;

            chairs.forEach(chair => {
                chair.addEventListener('click', function () {
                    if (this.classList.contains('reserved')) {
                        alert('This chair is already reserved. Please choose another chair.');
                        return;
                    }

                    if (selectedChair) {
                        selectedChair.classList.remove('selected');
                    }

                    this.classList.add('selected');
                    selectedChair = this;
                });
            });

            const confirmButton = document.querySelector('#confirm-button');
            confirmButton.addEventListener('click', function () {
                if (!selectedChair) {
                    alert('Please select a chair before confirming your reservation.');
                    return;
                }

                selectedChair.classList.remove('selected');
                selectedChair.classList.add('reserved');
                selectedChair.innerHTML = '<span style="color: red;">R</span>';
                selectedChair = null;
            });
        });

        loadLayout();
    </script>
</body>
</html>
