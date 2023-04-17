<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelReservation.aspx.cs" Inherits="starserv.CancelReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .information-container{
            margin-left: 300px;
            margin-top: 150px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="information-container">
            <asp:Label ID="lblEmail" runat="server" Text="Enter Email Address:  "></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" Text="Please select the reservation below."></asp:Label>
        </div>
        <div class="information-container" style="margin-top:10px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsCancelReservation" Height="515px" Width="666px" OnSelectedIndexChanged="btnConfirmCancel_Click">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="TableDate" HeaderText="Date" SortExpression="TableDate" />
                    <asp:BoundField DataField="TableHour" HeaderText="Hour of Res." SortExpression="TableHour" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
                <SelectedRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCancelReservation" runat="server" ConnectionString="<%$ ConnectionStrings:starservConnectionString %>" SelectCommand="SELECT [TableDate], [TableHour], [Email] FROM [RestaurantTables] WHERE ([Email] = @Email)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
            
        </div>
       <%-- <asp:Button ID="btnConfirmCancel" runat="server" Text="Cancel Reservation" OnClick="btnConfirmCancel_Click" />--%>
    </form>
</body>
</html>
