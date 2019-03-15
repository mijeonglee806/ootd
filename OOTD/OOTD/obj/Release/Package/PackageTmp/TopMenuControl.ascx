<!-- Left menu which is connected to categories -->
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenuControl.ascx.cs" Inherits="OOTD.LeftMenuControl" %>
    <asp:DataList ID="dlMenu" runat="server" Height="10px" RepeatDirection="Horizontal" Width="65%" CellPadding="3" CellSpacing="3" Font-Names="DejaVu Sans" Font-Size="XX-Small" HorizontalAlign="Center">
            <ItemStyle HorizontalAlign="Center" Font-Size="XX-Small" />
            <ItemTemplate>
            <asp:HyperLink ID="hyperCategory" runat="server" NavigateUrl='<%# "Category.aspx?CatID="+Eval("CategoryId") %>' Text='<%# Eval("NAME") %>' Font-Bold="False" Font-Size="Small" Font-Underline="False" ForeColor="White"></asp:HyperLink>
            </ItemTemplate>
    </asp:DataList>