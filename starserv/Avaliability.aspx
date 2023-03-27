<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Avaliability.aspx.cs" Inherits="starserv.Avaliability" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

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
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br /><br />
        <div>
            <asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns="False" DataSourceID="sdsAvailabilityGV" Height="477px" Width="1291px" OnRowCommand="gvAvailability_RowCommand">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TableID" HeaderText="TableID" SortExpression="TableID" />
                    <asp:BoundField DataField="TableDate" HeaderText="TableDate" SortExpression="TableDate" />
                    <asp:BoundField DataField="TableHour" HeaderText="TableHour" SortExpression="TableHour" />
                    <asp:BoundField DataField="NumChairs" HeaderText="NumChairs" SortExpression="NumChairs" />
                </Columns>
                <SelectedRowStyle BackColor="#0099FF" BorderColor="#00CC99" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsAvailabilityGV" runat="server" ConnectionString="<%$ ConnectionStrings:starservConnectionString %>" 
                SelectCommand="SELECT [ReservationID], [TableDate], [TableHour], [Email] FROM [RestaurantTables] WHERE (([Taken] &lt;&gt; @Taken) AND ([TableDate] = @SelectedDate)) ORDER BY [TableDate], [TableHour]"
                UpdateCommand="UPDATE [RestaurantTables] SET [TableDate] = @TableDate, [TableHour] = @TableHour, [Email] = @Email WHERE [ReservationID] = @original_ReservationID AND (([TableDate] = @original_TableDate) OR ([TableDate] IS NULL AND @original_TableDate IS NULL)) AND (([TableHour] = @original_TableHour) OR ([TableHour] IS NULL AND @original_TableHour IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [RestaurantTables] WHERE [ReservationID] = @original_ReservationID AND (([TableDate] = @original_TableDate) OR ([TableDate] IS NULL AND @original_TableDate IS NULL)) AND (([TableHour] = @original_TableHour) OR ([TableHour] IS NULL AND @original_TableHour IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [RestaurantTables] ([TableDate], [TableHour], [Email]) VALUES (@TableDate, @TableHour, @Email)" OldValuesParameterFormatString="original_{0}" OnSelecting="sdsAvailabilityGV_Selecting">
                
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
        <br /><br />
        <asp:Label ID="lblConfirmationError" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="btnConfirmReservation" runat="server" Text="Confirm Reservation"
            OnClick="btnConfirmReservation_Click"/>

    </form>
    
</body>
</html>
