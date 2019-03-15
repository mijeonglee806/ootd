<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="OOTD.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #sbxPayment {
                    border: 1px solid #ccc;
                    width: 200px;
                    height: 50px;
                    border-radius: 3px;
                    overflow: hidden;
                    background: #fafafa url("img/icon-select.png") no-repeat 90% 50%;
        }

       #sbxPayment select {
                    padding: 5px 8px;
                    width: 130%;
                    border: none;
                    box-shadow: none;
                    background: transparent;
                    background-image: none;
                    -webkit-appearance: none;
       }

       #sbxPayment select:focus {
                    outline: none;
       }
       #sbxMonth {
                    border: 1px solid #ccc;
                    width: 200px;
                    height: 50px;
                    border-radius: 3px;
                    overflow: hidden;
                    background: #fafafa url("img/icon-select.png") no-repeat 90% 50%;
        }

       #sbxMonth select {
                    padding: 5px 8px;
                    width: 130%;
                    border: none;
                    box-shadow: none;
                    background: transparent;
                    background-image: none;
                    -webkit-appearance: none;
       }

       #sbxMonth select:focus {
                    outline: none;
       }
       #sbxYear {
                    border: 1px solid #ccc;
                    width: 200px;
                    height: 50px;
                    border-radius: 3px;
                    overflow: hidden;
                    background: #fafafa url("img/icon-select.png") no-repeat 90% 50%;
        }

       #sbxYear select {
                    padding: 5px 8px;
                    width: 130%;
                    border: none;
                    box-shadow: none;
                    background: transparent;
                    background-image: none;
                    -webkit-appearance: none;
       }

       #sbxYear select:focus {
                    outline: none;
       }
        
    </style>
    <table style="width:80%; text-align: center; vertical-align: middle; padding: 15px; margin:auto;">
        <tr>
            <td style="height: 23px; font-weight:bold; font-size: 1.5em; text-align: center;" colspan="2">PAYMENT</td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="2">
                <br /><br />
                <select id="sbxPayment" name="sbxPayment">
                  <option value="" disabled selected>Payment Type</option>
                  <option value="1">VISA</option>
                  <option value="2">Master Card</option>
                  <option value="3">PayPal</option>
               </select>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: middle" class="auto-style2">
                <br />
                <br />
                Card number</td>
            <td class="auto-style2">
                <br />
                <br />
                <asp:TextBox ID="txtCartNumber" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="vertical-align: middle" class="auto-style2">
                <br />
                <br />
                Expiry date
            </td>
            <td class="auto-style2">
                <br /><br />
                <select  name="sbxMonth" id="sbxMonth">
                    <option value="" disabled selected>Month</option>
                    <option value="1">01</option>
                    <option value="2">02</option>
                    <option value="3">03</optio>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6">06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
               </select>
                <select name="sbxYear" id="sbxYear">
                    <option value="" disabled selected>Year</option>
                    <option value="1">2018</option>
                    <option value="2">2019</option>
                    <option value="3">2020</option>
                    <option value="4">2021</option>
                    <option value="5">2022</option>
                    <option value="6">2023</option>
                    <option value="7">2024</option>
                    <option value="8">2025</option>
               </select>
            </td>
        </tr>

        <tr>
            <td style="vertical-align: middle" class="auto-style2">
                <br />
                <br />
                CVV2</td>
            <td class="auto-style2">
                <br />
                <br />
                <asp:TextBox ID="txtCVV" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="vertical-align: middle" class="auto-style2">
                <br />
                <br />
                Card holder</td>
            <td class="auto-style2">
                <br />
                <br />
                <asp:TextBox ID="txtCardHolder" Height="40px" Width="250px" BorderStyle="Solid" BorderWidth="1px" runat="server" BackColor="#f5e7c6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <br />
                <br />
                <asp:ImageButton ID="btnPayment" runat="server" Height="68px" ImageUrl="~/img/btn_payment.png" Width="178px" OnClick="btnPayment_Click" />

            </td>
        </tr>
    </table>
</asp:Content>
