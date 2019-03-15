<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="OOTD.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="dlProduct" runat="server" RepeatColumns="1" OnSelectedIndexChanged="dlProduct_SelectedIndexChanged" HorizontalAlign="Center">
        <ItemTemplate>
            <style>
                #sbxSize {
                    border: 1px solid #ccc;
                    width: 150px;
                    border-radius: 3px;
                    overflow: hidden;
                    background: #fafafa url("img/icon-select.png") no-repeat 90% 50%;
                }

                #sbxSize select {
                    padding: 5px 8px;
                    width: 130%;
                    border: none;
                    box-shadow: none;
                    background: transparent;
                    background-image: none;
                    -webkit-appearance: none;
                }

                #sbxSize select:focus {
                    outline: none;
                }

                #sbxQuantity {
                    border: 1px solid #ccc;
                    width: 150px;
                    border-radius: 3px;
                    overflow: hidden;
                    background: #fafafa url("img/icon-select.png") no-repeat 90% 50%;
                }

                #sbxQuantity select {
                    padding: 5px 8px;
                    width: 130%;
                    border: none;
                    box-shadow: none;
                    background: transparent;
                    background-image: none;
                    -webkit-appearance: none;
                }

                #sbxQuantity select:focus {
                    outline: none;
                }
            </style>
            <table style="width:100%; margin:auto;">
                <tr>
                    <td style="text-align:center; margin: auto;">
                        <asp:Image ID="imgProductDetail" runat="server" Height="700px" ImageUrl='<%# "Images/"+Eval("IMAGE") %>' Width="550px" />
                    </td>
                    <td style="width: 500px; padding-left: 50px;">
                        <div style="font-weight:bold; font-size: 1.2em;">
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("NAME") %>'></asp:Label>
                        </div>
                         <br /><br />
                        Price: $<asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("PRICE") %>'></asp:Label> <br />
                        <asp:Label ID="lblProductDesc" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        <br /> <br />
                        <!-- Quantity -->
                            <select id="sbxQuantity" name="sbxQuantity">
                                <option value="" disabled selected>Quantity</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                            </select>
                        <br /><br />
                        <!-- size -->
                            <select id="sbxSize" name="sbxSize">
                              <option value="" disabled selected>Size</option>
                              <option value="1">Small</option>
                              <option value="2">Medium</option>
                              <option value="3">Large</option>
                            </select>
                        <br /><br /><br/ />
                        <asp:ImageButton ID="imgBtnCart" runat="server" Height="68px" ImageUrl="~/img/btn_save.v02.png" Width="167px" OnClick="imgBtnCart_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">/*Product detail*/</td>
                </tr>
                <tr>
                    <td colspan="2">/*Product Picture*/</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
