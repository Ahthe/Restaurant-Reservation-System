<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="starserv.AdminView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            margin-left: 25px;
        }
    </style>
    <link rel="stylesheet" href="NavigationStyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class ="navigation">
        <ul>
          <li><a href="Avaliability.aspx">Home</a></li>
          <li><a href="Admin.aspx">Admin</a></li>
          <li><a href="TeamBlog.html">About</a></li>
          <li><a href="RestaurantLayout.aspx">Change Layout</a></li>
          <li><a href="AdminView.aspx">View All Reservations</a></li>
        </ul>
    </div>
        <br /><br /><br />
        <div>
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
                    <asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns="False" DataSourceID="sdsAvailabilityGV" Height="477px" Width="100%" OnRowCommand="gvAvailability_RowCommand" CssClass="gridView" OnSelectedIndexChanged="onSelection">
                        <Columns>

                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" SortExpression="ReservationID" ItemStyle-Width="20%" />
                            <asp:BoundField DataField="TableDate" HeaderText="TableDate" SortExpression="TableDate" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="TableHour" HeaderText="TableHour" SortExpression="TableHour" ItemStyle-Width="25%" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Width="30%" />
                        </Columns>
                        <SelectedRowStyle BackColor="#0099FF" BorderColor="#00CC99" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="sdsAvailabilityGV" runat="server" ConnectionString="<%$ ConnectionStrings:starservConnectionString %>"
                        SelectCommand="SELECT [ReservationID], [TableDate], [TableHour], [Email] FROM [RestaurantTables] WHERE ([TableDate] = @SelectedDate) ORDER BY [TableDate], [TableHour]"
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
            </div>
            <br /><br /><br /><br /><br />
    </form>
</body>
</html>
