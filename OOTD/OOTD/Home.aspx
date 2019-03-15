<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OOTD.Home1" %>
<asp:Content ID="homeContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
    <div style="text-align: center; margin: auto;">
        <asp:Image ID="imgHomeSlide" runat="server" Height="500px" Width="825px" ImageAlign="Middle"/>
    </div>
</asp:Content>
