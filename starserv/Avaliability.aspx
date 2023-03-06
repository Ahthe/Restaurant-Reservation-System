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
        <asp:Calendar ID="calDateSelect" runat="server"></asp:Calendar>

        <br /><br /><br />
        <div>
            <asp:GridView ID="gvAvailability" runat="server" AutoGenerateColumns="False" DataKeyNames="TableID" DataSourceID="SQLTableAvailability" Height="477px" Width="1291px" OnSelectedIndexChanged="Page_Load">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TableID" HeaderText="TableID" InsertVisible="False" ReadOnly="True" SortExpression="TableID" />
                    <asp:BoundField DataField="TableDate" HeaderText="TableDate" SortExpression="TableDate" />
                    <asp:BoundField DataField="TableHour" HeaderText="TableHour" SortExpression="TableHour" />
                    <asp:BoundField DataField="NumChairs" HeaderText="NumChairs" SortExpression="NumChairs" />
                    <asp:CheckBoxField DataField="Taken" HeaderText="Taken" SortExpression="Taken" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SQLTableAvailability" runat="server" ConnectionString="<%$ ConnectionStrings:starservConnectionString %>" SelectCommand="SELECT * FROM [RestaurantTables] ORDER BY [TableDate], [TableHour]"></asp:SqlDataSource>
        </div>
        <br /><br />
        <asp:Label ID="lblConfirmationError" runat="server" Text=""></asp:Label>
        <br />
        <asp:Button ID="btnConfirmReservation" runat="server" Text="Confirm Reservation" />

    </form>
    
</body>
</html>
