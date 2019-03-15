<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OOTD.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvShoppingCart" runat="server" AutoGenerateColumns="False" width="80%" CellPadding="5" CellSpacing="5" GridLines="None" HorizontalAlign="Center" OnRowCancelingEdit="gvShoppingCart_RowCancelingEdit" OnRowDeleting="gvShoppingCart_RowDeleting" OnRowEditing="gvShoppingCart_RowEditing" OnRowUpdating="gvShoppingCart_RowUpdating" BorderColor="White" BorderWidth="3px">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Product name" ReadOnly="True" />
            <asp:ImageField DataImageUrlField="Image" DataImageUrlFormatString="~\Images\{0}" HeaderText="Image" ReadOnly="True">
                <ControlStyle Height="100px" Width="70px" />
            </asp:ImageField>
            <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" />
            <asp:BoundField DataField="Size" HeaderText="Size" ReadOnly="True" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Double.Parse(Eval("Price").ToString())*Int32.Parse(Eval("Quantity").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#FF6666" />
        <HeaderStyle BackColor="White" BorderColor="Black" BorderWidth="0px" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" Font-Size="1.1em" />
        <RowStyle BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" Height="50px" HorizontalAlign="Center" ForeColor="#2C2C2C" />
        <SelectedRowStyle BackColor="#F2F2F2" BorderColor="#FEFCFE" BorderStyle="Solid" BorderWidth="0px" HorizontalAlign="Center" />
    </asp:GridView>
    <br />
    <table style="width:80%; margin:auto;" border="0">
        <tr>
            <td style="text-align:right;">
                <br />
                 <asp:Label ID="lblGrandTotal" runat="server" Visible="False"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            
            <td>
                <asp:ImageButton ID="imgBtnCheckOut" runat="server" Height="63px" ImageAlign="Right" ImageUrl="~/img/btn_checkout.png" style="margin-left: 8px" Width="160px" OnClick="imgBtnCheckOut_Click" Visible="False"/>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:Image ID="imgEmtpyCart" runat="server" ImageAlign="Middle" Height="314px" ImageUrl="~/img/emtpyCart.jpg" Width="628px" Visible="True" />
                <br /><br />
            </td>
        </tr>
    </table>
    
    
</asp:Content>
