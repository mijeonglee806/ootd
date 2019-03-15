<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="OOTD.Order" %>
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
            <td colspan="2" style="height: 23px; font-weight:bold; font-size: 1.5em;" class="auto-style1"><br />COMPLETE ORDER<br />
                <br /></td>
        </tr>
        <tr id="userInfo" >
            <td style="vertical-align: middle" class="auto-style2">
                <br /> <br />
                Name</td>
            <td class="auto-style2">
                <br /><br />
                <asp:TextBox ID="txtName_order" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle" class="auto-style2">
                Last name</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtLName_order" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" EnableTheming="True" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle" class="auto-style2">
                Address</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtAddress_order" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle" class="auto-style2">
                Zip code</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtZipCode_order" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                City</td>
            <td>
                <asp:TextBox ID="txtCity_order" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Province</td>
            <td>
                <asp:TextBox ID="txtProvince_order" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Country
            </td>
            <td>
                <asp:TextBox ID="txtCountry_order" style="font-weight:bold; vertical-align:middle; " Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6" Text="Canada" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr id="userInfo">
            <td style="vertical-align: middle">
                Phone Number<br /><br />
            </td>
            <td>
                <asp:TextBox ID="txtPhone" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
                <br /><br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; height: 80px;" >
                <asp:ImageButton ID="btn_payment" runat="server" Height="61px" width="164px" ImageUrl="~/img/btn_continue.png" OnClick="btn_payment_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
