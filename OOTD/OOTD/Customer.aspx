<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="OOTD.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 40%; margin:auto; text-align:center;">
        <tr>
            <td><asp:ImageButton ID="btnLogout" runat="server" ImageAlign="Middle" Height="72px" ImageUrl="~/img/btn_signout.png" OnClick="btnLogout_Click" Width="175px" /></td>
        </tr>
    </table>
    
</asp:Content>
