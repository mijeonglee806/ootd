<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OOTD.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #userInfo {
            text-align: center;
            background-color: white;
            height: 50px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            height: 50px;
        }
    </style>
    <table border="0" style="width: 50%; margin: auto;">
        <tr style="text-align: center;">
            <td colspan="2" style="height: 23px; font-weight:bold; font-size: 1.5em;" class="auto-style1"><br />REGISTRATION<br />
                <br /></td>
        </tr>
        <tr id="userInfo" >
            <td style="vertical-align: middle" class="auto-style2">
                <br /> <br />
                User ID
            </td>
            <td class="auto-style2">
                <br /><br />
                <asp:TextBox ID="txtId" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
                <div id="userWarning" runat="server" style="color:red; font-size: 0.8em; visibility:hidden; height: 1px;">
                    "Please choose different ID"
                </div>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle" class="auto-style2">
                Email Address
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtEmail" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" EnableTheming="True" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Password
            </td>
            <td>
                <asp:TextBox ID="txtPw" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" TextMode="Password" BackColor="#f5e7c6"></asp:TextBox>
                <div id="userWarningPw" runat="server" style="color:red; font-size: 0.8em; visibility:hidden; height: 1px;">
                    "Password does not match"
                </div>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle" class="auto-style2">
                Conform password
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPwConfirm" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" TextMode="Password" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Name
            </td>
            <td>
                <asp:TextBox ID="txtFName" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                LastName
            </td>
            <td>
                <asp:TextBox ID="txtLName" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Phone Number
                <br /><br />
            </td>
            <td>
                <asp:TextBox ID="txtPhone" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
                <br /><br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; height: 80px;" >
                <asp:ImageButton ID="btn_register" runat="server" Height="61px" width="164px" ImageUrl="~/img/btn_createaccount.png" OnClick="btn_register_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
