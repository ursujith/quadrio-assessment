<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebRole1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: dimgrey ;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #form1 {
            background-color: aqua;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-control {
            width: 100%;
            margin-bottom: 15px;
            
        }
        .form-control input, .form-control select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color:antiquewhite;
        }
        .form-control button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
            background-color: palegreen;
        }
        .form-control button:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            display: block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Login</h1>
            <asp:Label runat="server" ID="lblError" CssClass="error" Visible="false"></asp:Label>
            <div class="form-control">
                <asp:DropDownList runat="server" ID="ddlRole">
                    <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                    <asp:ListItem Text="User" Value="user"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-control">
                <asp:TextBox runat="server" ID="txtUsername" placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-control">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-control">
                <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
