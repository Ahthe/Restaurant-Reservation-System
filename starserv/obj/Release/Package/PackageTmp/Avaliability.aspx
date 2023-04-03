

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Avaliability.aspx.cs" Inherits="starserv.Avaliability" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Restaurant Reservation System</title>
<%--    <style>
        /*   body {
            font-family: Arial, sans-serif;
            background-color: floralwhite;
            background-image: url('');
            margin: 0;
            padding: 0;
        }*/
        body {
            position: relative;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://i.imgur.com/XySjW1x.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            color: black;
        }

        .gridView {
            table-layout: fixed;
            word-wrap: break-word;
        }

   /*     .container {
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: transparent;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position: relative;
            top: 100px;
        }*/

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            position: relative;
            top: 100px;
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
            width: 100%;
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
            background-color: #337ab7;
            color: lightcoral;
            cursor: pointer;
            transform-style: preserve-3d;
            transition: background-color 0.3s ease-in-out;
        }

        .button:hover {
                background-color: #286090;
                transform: rotateY(180deg);
        }

        .form-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .form-group-half {
            width: 48%;
        }

        .form-group-full {
            width: 100%;
        }


    </style>--%>
    <style>
        body {
            position: relative;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://i.imgur.com/xJpBwZx.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            color: #333;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            position: relative;
            top: 100px;
/*            background-color: rgba(255, 255, 255, 0.9);
*/          background-color: transparent;  
/*            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);*/
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
            background-color: #337ab7;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .button:hover {
            background-color: #286090;
        }

        .form-wrapper {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .form-group-half {
            width: 48%;
        }

        .form-group-full {
            width: 50%;
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

    </style>


</head>
<body>
    <form id="form1" runat="server">
    <div style="float:left; width:50%;">
        <div class="container">
 <br /><br /><br />
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

<%--            <div class="form-group">
                <label for="ddlDate">Date:</label>
                <asp:DropDownList ID="ddlDate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlTime">Time:</label>
                <asp:DropDownList ID="ddlTime" runat="server"></asp:DropDownList>
            </div>--%>


            <div class="form-wrapper">
            <div class="form-group form-group-half">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" Required="true" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group form-group-half">
                <label for="txtFirstName">First Name:</label>
                <input id="Text1" runat="server" type="text" name="firstName" style="width:20%;" required>
            </div>
            <div class="form-group form-group-half">
                <label for="txtLastName">Last Name:</label>
                <input id="Text2" runat="server" type="text" name="lastName" required>
            </div>
            <div class="form-group form-group-half">
                <label for="txtGuests">Number of Guests:</label>
                <input id="Number1" runat="server" type="number" name="guests" min="1" max="10" required>
            </div>
            <div class="form-group form-group-half">
                <label for="ddlTableSize">Table Size:</label>
                <select id="Select1" runat="server" name="tableSize" required>
                    <option value="">-- Select Size --</option>
                  <option value="2">2 people</option>
                    <option value="4">4 people</option>
                    <option value="6">6 people</option>
                    <option value="8">8 people</option>
                </select>
            </div>
            <div class="form-group form-group-full">
                <label for="txtNotes">Notes:</label>
                <textarea id="Textarea1" runat="server" name="notes"></textarea>
            </div>
        </div>

            <div>
               <asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns="False" DataSourceID="sdsAvailabilityGV" Height="477px" Width="1291px" OnRowCommand="gvAvailability_RowCommand" CssClass="gridView"> <Columns>

                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="TableDate" HeaderText="TableDate" SortExpression="TableDate" ItemStyle-Width="25%" />
                        <asp:BoundField DataField="TableHour" HeaderText="TableHour" SortExpression="TableHour" ItemStyle-Width="25%" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Width="30%" />
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
                   <%--  <asp:ControlParameter ControlID="ddlDate" Name="SelectedDate" PropertyName="SelectedValue" Type="DateTime" />--%>
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
        <div style:"width:50%";>

        </div>
    </form>
</body>
</html>
