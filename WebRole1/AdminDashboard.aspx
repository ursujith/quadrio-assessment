<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebRole1.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: cyan;
            margin: 0;
            padding: 0;
        }
        #form1 {
            width: 80%;
            margin: auto;
            background-color: dimgrey;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .table-container {
            background-color:navajowhite;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
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
        .form-control {
            margin-bottom: 15px;
            background-color:aqua;
        }
        .form-control input {
            width: calc(100% - 22px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-control button {
            width: 100%;
            padding: 10px;
            background-color: #00796b;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-control button:hover {
            background-color: azure;
        }
        .btn-center {
            display: flex;
            justify-content: center;
        }
        .btn-center button {
            width: 200px;
            padding: 10px;
            background-color: #00796b;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-center button:hover {
            background-color: #004d40;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <h1>Admin Dashboard</h1>
        <div class="table-container">
            <asp:Table ID="tbladdrecord" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Book Name:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtname" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Rate:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtrate" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Description:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtdescription" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                   <asp:TableCell>Rating:</asp:TableCell>
                   <asp:TableCell><asp:TextBox ID="txtrating" runat="server"></asp:TextBox></asp:TableCell>
               </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"><asp:Button ID="cmdInsert" Text="Insert" runat="server" OnClick="cmdInsert_Click" /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <hr />
        <div class="table-container">
            <asp:GridView ID="ContactGrid" runat="server" AutoGenerateColumns="false" OnRowCommand="ContactGrid_RowCommand">
                <Columns>
                    <asp:BoundField DataField="RowKey" HeaderText="Name" />
                    <asp:BoundField DataField="PartitionKey" HeaderText="Rate" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Rating" HeaderText="Rating" />
                    <asp:ButtonField ButtonType="Link" HeaderText="Edit/Delete" Text="Edit/Delete" />
                </Columns>
            </asp:GridView>
        </div>
        <hr />
        <div class="table-container">
            <asp:Table runat="server" ID="tbleditrecord" Visible="false">
                <asp:TableRow>
                    <asp:TableCell>Book Name:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtedname" Enabled="false" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Rate:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txtedrate" Enabled="false" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Description:</asp:TableCell>
                    <asp:TableCell><asp:TextBox ID="txteddescription" runat="server"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                   <asp:TableCell>Rating:</asp:TableCell>
                   <asp:TableCell><asp:TextBox ID="txtedrating" runat="server"></asp:TextBox></asp:TableCell>
               </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="cmdEdit" Text="Update" runat="server" OnClick="cmdEdit_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="cmdDelete" Text="Delete" runat="server" OnClick="cmdDelete_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
        <hr />
        <div class="btn-center">
            <asp:Button Text="LogOut" runat="server" OnClick="homePage" />
        </div>
    </form>
</body>
</html>
