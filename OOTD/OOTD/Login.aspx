<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OOTD.Login" %>
<asp:Content ID="loginContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:35%; margin:auto; border: 0;">
        <tr style="text-align: center; font-size: 1.5em;">
            <td style="height: 23px; font-weight:bold;">LOGIN<br /><br /></td>
        </tr>
        <tr style="height: 350px; background-color: darkolivegreen; text-align:center;">
            <td>
                <asp:TextBox ID="txtID" runat="server" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" Text="ID"></asp:TextBox> <br /><br />
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" Text="Password"></asp:TextBox>
                <br />
                <br />
                <asp:ImageButton ID="btnLogin" runat="server" Height="50px" Width="250px" ImageUrl="~/img/btn_login.jpg" OnClick="btnLogin_Click"/>
                <br />
                <div style="height: 3px;"></div>
                <asp:ImageButton ID="btnRegister" runat="server" ImageUrl="~/img/btn_register.jpg" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
