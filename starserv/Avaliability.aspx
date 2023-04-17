<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Avaliability.aspx.cs" Inherits="starserv.Avaliability" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Reservation System</title>
    <style>
        body {
            position: relative;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
           /* background-image: url('https://i.imgur.com/xJpBwZx.jpg');*/
           background-color: whitesmoke;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            color: #333;
        }

        /* Add a style for the header */
        .header {
            width: 100%;
            height: 80px;
            background-color: transparent;
            position: fixed;
            top: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            color: #000;
            font-weight: bold;
            z-index: 100; /* Add this line to keep the header on top */
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            padding-top: 140px; /* Replace top with padding-top */
            background-color: transparent;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input, select, textarea {
            width: 50%;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            border: 1px solid #ccc;
            border-radius: 4px;
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

        .form-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .form-group-half {
            width: 60%;
        }
        .form-group-half-left {
            width: 40%;
        }
        .form-group-half-right {
            width: 60%;
        }

        .form-group-full {
            width: 40%;
        }

        .gridView {
            table-layout: fixed;
            word-wrap: break-word;
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        .gridView th, .gridView td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ccc;
        }

        .gridView th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .gridView tr:nth-child(even) {
            background-color: #f2f2f2;

        }

        .gridView tr:hover {
            background-color: #ddd;
        }

        .content-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    position: relative;
}

     
      .burger-image {
    position: fixed;
    right: 5%;
    top: 200px;
}

    </style>


</head>
<body>
    <form id="form1" runat="server">
              <!-- Add the booking header -->
       <%-- <div class="header">
            Booking
        </div>--%>
        <div class="content-wrapper">
        <div style="float: left; width: 50%;">
                <br />
                <br />
                <br />
            <div class="container">

                   <div class="header">
                        Booking
                    </div>
                   <div class="form-wrapper">
                  
                    <div class="form-group form-group-half">
                        <label for="txtFirstName">First Name:</label>
                        <input id="Text1" runat="server" type="text" name="firstName" style="width: 50%;" required="required"/>
                    </div>
                    <div class="form-group form-group-half-left" style:"margin-left=30%">
                        <label for="txtLastName">Last Name:</label>
                        <input id="Text2" runat="server" type="text" name="lastName" style="width: 70%;" required="required"/>
                    </div>
                    <div class="form-group form-group-half">
                         <label for="txtEmail">Email:</label>
                         <asp:TextBox ID="txtEmail" runat="server" Required="true" TextMode="Email" Style="width: 50%"></asp:TextBox>
                    </div>
                    <div class="form-group form-group-half-right">
                        <label for="txtGuests">Number of Guests:</label>
                        <input id="Number1" runat="server" type="number" name="guests" style="width: 50%;" min="1" max="10" required="required"/>
                    </div>
                    <div class="form-group form-group-half-left">
                        <label for="ddlTableSize">Table Size:</label>
                        <select id="Select1" runat="server" name="tableSize" required="required">
                            <option value="">-- Select Size --</option>
                            <option value="2">2 people</option>
                            <option value="4">4 people</option>
                            <option value="6">6 people</option>
                            <option value="8">8 people</option>
                        </select>
                    </div>
                    
                    <%--<div class="form-group form-group-full">
                      
                        <label for="txtNotes">Notes:</label>
                        <textarea id="Textarea1" runat="server" name="notes" style="width: 50%"></textarea>
                    </div>--%>
                    <label for="txtNotes">Notes:</label><br />
                    <textarea id="Textarea1" runat="server" name="notes" style="width: 100%"></textarea>
                    
                </div>




                <br />
                <br />
                <br />
                <asp:Label ID="lblDate" runat="server" Text="Please Select a Date"></asp:Label>
                <asp:Calendar ID="calDateSelect" runat="server" BackColor="White" BorderColor="Black"
                    DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt"
                    ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month"
                    Width="400px" OnSelectionChanged="CalDateSelect_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>

                <br />

             

                <div>
                    <asp:Label ID="lblAvailMessage" runat="server" Text="All available tables are shown below for the selected date."></asp:Label>
                    <asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns="False" DataSourceID="sdsAvailabilityGV" Height="477px" Width="100%" OnRowCommand="gvAvailability_RowCommand" CssClass="gridView">
                        <Columns>

                            <asp:CommandField ShowSelectButton="True" />
                            <%--<asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID" ItemStyle-Width="20%" />--%>
                            <asp:BoundField DataField="TableDate" HeaderText="TableDate" SortExpression="TableDate" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="TableHour" HeaderText="TableHour" SortExpression="TableHour" ItemStyle-Width="25%" />
                            <%--<asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Width="30%" />--%>
                        </Columns>
                        <SelectedRowStyle BackColor="#0099FF" BorderColor="#00CC99" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="sdsAvailabilityGV" runat="server" ConnectionString="<%$ ConnectionStrings:starservConnectionString %>"
                        SelectCommand="SELECT [ReservationID], [TableDate], [TableHour], [Email] FROM [RestaurantTables] WHERE (([Taken] != @Taken) AND ([TableDate] = @SelectedDate)) ORDER BY [TableDate], [TableHour]"
                        UpdateCommand="UPDATE [RestaurantTables] SET [TableDate] = @TableDate, [TableHour] = @TableHour, [Email] = @Email WHERE [ReservationID] = @original_ReservationID AND (([TableDate] = @original_TableDate) OR ([TableDate] IS NULL AND @original_TableDate IS NULL)) AND (([TableHour] = @original_TableHour) OR ([TableHour] IS NULL AND @original_TableHour IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [RestaurantTables] WHERE [ReservationID] = @original_ReservationID AND (([TableDate] = @original_TableDate) OR ([TableDate] IS NULL AND @original_TableDate IS NULL)) AND (([TableHour] =



        @original_TableHour) OR ([TableHour] IS NULL AND @original_TableHour IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))"
                        InsertCommand="INSERT INTO [RestaurantTables] ([TableDate], [TableHour], [Email]) VALUES (@TableDate, @TableHour, @Email)" OldValuesParameterFormatString="original_{0}" OnSelecting="sdsAvailabilityGV_Selecting">

                        <DeleteParameters>
                            <asp:Parameter Name="original_ReservationID" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="original_TableDate" />
                            <asp:Parameter Name="original_TableHour" Type="Int32" />
                            <asp:Parameter Name="original_Email" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter DbType="Date" Name="TableDate" />
                            <asp:Parameter Name="TableHour" Type="Int32" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="NumGuests" Type="Int32" />
                            <asp:Parameter Name="TableSize" Type="Int32" />
                            <asp:Parameter Name="Notes" Type="String" />
                        </InsertParameters>

                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Taken" Type="Byte" />
                            <asp:ControlParameter ControlID="calDateSelect" DbType="Date" Name="SelectedDate" PropertyName="SelectedDate" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="TableDate" />
                            <asp:Parameter Name="TableHour" Type="Int32" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="original_ReservationID" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="original_TableDate" />
                            <asp:Parameter Name="original_TableHour" Type="Int32" />
                            <asp:Parameter Name="original_Email" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <br />
                <br />
                <asp:Label ID="lblConfirmationError" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="btnConfirmReservation" runat="server" Text="Confirm Reservation"
                    OnClick="btnConfirmReservation_Click" CssClass="button" />

            </div>
        </div>
            </div>
        <div class="burger-image">
            <img src="https://i.imgur.com/BsY1U7g.png" alt="Burger Image" />
        </div>
    </form>
</body>
</html>
