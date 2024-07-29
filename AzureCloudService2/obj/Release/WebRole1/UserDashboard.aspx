<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="WebRole1.UserDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        h2{
            text-align:center;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: aqua;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <h2>User available books</h2>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="ContactGrid" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="RowKey" HeaderText="Name" />
                    <asp:BoundField DataField="PartitionKey" HeaderText="Rate" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Rating" HeaderText="Rating" />
                </Columns>
        </asp:GridView>
            <hr />
            <center>
                <asp:Button Text="LogOut" ID="homepage" runat="server" OnClick="homePage" />
            </center>
        </div>
    </form>
</body>
</html>
