<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="OOTD.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlCategory" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td style="text-align: center">
                       <asp:HyperLink ID="HyperProductDetail" runat="server" NavigateUrl='<%# "ProductDetail.aspx?ProductId="+Eval("ProductId") %>'>
                       <asp:Image ID="ImgProduct" runat="server" ImageUrl='<%# "Images/"+Eval("IMAGE") %>' Height="415px" Width="310px" />
                       </asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("NAME") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("PRICE") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
