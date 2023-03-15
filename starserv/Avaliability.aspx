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

        <br /><br /><br />
        <div>
            <asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="TableID" DataSourceID="SQLTableAvailability" Height="477px" Width="1291px"
                OnSelectedIndexChanged="CalDateSelect_SelectionChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TableID" HeaderText="TableID" InsertVisible="False" ReadOnly="True" SortExpression="TableID" />
                    <asp:BoundField DataField="TableDate" HeaderText="TableDate" SortExpression="TableDate" />
                    <asp:BoundField DataField="TableHour" HeaderText="TableHour" SortExpression="TableHour" />
                    <asp:BoundField DataField="NumChairs" HeaderText="NumChairs" SortExpression="NumChairs" />
                    <asp:CheckBoxField DataField="Taken" HeaderText="Taken" SortExpression="Taken" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SQLTableAvailability" runat="server" 
                ConnectionString="<%$ ConnectionStrings:starservConnectionString %>" 
                SelectCommand="SELECT * FROM [RestaurantTables] WHERE TableDate >= @SelectedDate ORDER BY [TableDate], [TableHour]"
          
                >
                <SelectParameters>
                    <asp:Parameter Name="SelectedDate" Type="DateTime" />
                </SelectParameters>
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
