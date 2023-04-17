<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelReservation.aspx.cs" Inherits="starserv.CancelReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Cancel Reservation</title>

    <style>
        

      .container2 {
        max-width: 100%; /* Updated to 100% */
        margin: 0 auto;
        padding-left: 16px; /* Updated padding-left to a smaller value */
        padding-right: 32px; /* Added padding-right */
        display: flex;
        flex-direction: column; /* Added flex-direction */
        align-items: center;
        justify-content: space-between;
         margin-top: 100px; /* Adjust this value to move the content vertically */
        margin-right: 100px;
    }


            .content-container {
        padding-top: 100px; /* Added padding-top to make space for the navigation bar */
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

        nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 99;
            background-color: var(--dark);
            padding: 16px 32px;
            border-bottom: 3px solid var(--primary);
        }

        h1 {
            color: #FFF;
            font-size: 28px;
            font-weight: 900;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-right: auto;
        }

        .hamburger {
            display: block;
            position: relative;
            z-index: 1;
            user-select: none;
            appearance: none;
            border: none;
            outline: none;
            background: none;
            cursor: pointer;
        }

        .hamburger span {
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

        .hamburger:hover span:nth-child(2) {
            transform: translateX(10px);
            background-color: var(--primary);
        }

        .hamburger.is-active span:nth-child(1) {
            transform: translate(0px, -2px) rotate(45deg);
        }

        .hamburger.is-active span:nth-child(2) {
            opacity: 0;
            transform: translateX(15px);
        }

        .hamburger.is-active span:nth-child(3) {
            transform: translate(-3px, 3px) rotate(-45deg);
        }

        .hamburger.is-active:hover span {
            background-color: var(--primary);
        }

        .menu {
            display: none;
            flex: 1 1 0%;
            justify-content: flex-end;
            margin: 0 -16px;
            margin-left: auto;
        }

        .menu a {
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

        @media(min-width: 768px) {
            .hamburger {
                display: none;
            }

            .menu {
                display: flex;
            }
        }

    </style>
</head>

<script>
    const hamburger = document.querySelector('.hamburger');

    hamburger.addEventListener('click', function () {
        this.classList.toggle('is-active');
    });
</script>

<body>
    <form id="form1" runat="server">
        <%-- for the Navigation Bar  --%>
        <nav>
            <div class="container2">
                <h1>Star Serve</h1>

                <div class="menu">
                    <a href="#" class="is-active">Home</a>
                    <a href="#">About</a>
                    <a href="#">Confrigration</a>
                    <a href="#about">Contact</a>
                </div>

                <button class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
        </nav>
        <%-- end of the navigation bar --%>
              <div class="content-container">
            <div class="container2">
                <h2>Cancel Reservation</h2>
                <p>Please enter your email address to cancel your reservation:</p>
                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required="required"/>
                </div>
                <div>
                    <button type="submit">Cancel Reservation</button>
                </div>
            </div>
        </div>
        <div>
        </div>
    </form>
       
    </body>
</html>
