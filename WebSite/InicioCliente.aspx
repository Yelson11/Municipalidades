﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InicioCliente.aspx.vb" Inherits="InicioCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style14 {
            height: 22px;
            width: 504px;
        }
        .auto-style15 {
            height: 22px;
            width: 791px;
        }
        .auto-style16 {
            height: 22px;
        }
        .auto-style8 {
            height: 23px;
            width: 504px;
        }
        .auto-style11 {
            height: 23px;
            width: 791px;
        }
        .auto-style1 {
            height: 23px;
        }
        .auto-style9 {
            height: 24px;
            width: 504px;
        }
        .auto-style12 {
            height: 24px;
            width: 791px;
        }
        .auto-style7 {
            height: 24px;
        }
        .auto-style10 {
            width: 504px;
        }
        .auto-style13 {
            width: 791px;
        }
        .auto-style17 {
            width: 504px;
            height: 36px;
        }
        .auto-style18 {
            width: 791px;
            height: 36px;
        }
        .auto-style19 {
            height: 36px;
        }
        .auto-style20 {
            width: 504px;
            height: 40px;
        }
        .auto-style21 {
            width: 791px;
            height: 40px;
        }
        .auto-style22 {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <table style="width:100%;">
                <tr>
                    <td colspan="3">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/encabezado.png" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" ForeColor="#042F59" Text="Iniciar Sesión"></asp:Label>
                    </td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style13">
                        <asp:Button ID="btnAdministrador" runat="server" BackColor="#F0F0F0" BorderColor="#CCCCCC" BorderStyle="Double" Font-Bold="True" Font-Italic="False" Font-Names="Segoe UI" Font-Size="Medium" Font-Underline="False" ForeColor="#074887" Height="40px" Text="Administrador" Width="170px" />
                        <asp:Button ID="btnCliente" runat="server" BackColor="#074887" BorderColor="#CCCCCC" BorderStyle="Double" Font-Bold="True" Font-Italic="False" Font-Names="Segoe UI" Font-Size="Medium" Font-Underline="False" ForeColor="White" Height="40px" Text="Cliente" Width="170px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style17"></td>
                    <td class="auto-style18">
                        <asp:Image ID="Image2" runat="server" Height="48px" ImageUrl="~/user.png" Width="55px" />
                        <asp:Label ID="Label2" runat="server" Font-Names="Segoe UI Semibold" Font-Size="Large" Text="ID de Abonado:" ForeColor="#074887"></asp:Label>
&nbsp;<asp:TextBox ID="txtUsuario" runat="server" Height="23px" Width="163px"></asp:TextBox>
                    </td>
                    <td class="auto-style19"></td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style20"></td>
                    <td class="auto-style21">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnEntrar" runat="server" BackColor="#042F59" BorderColor="#CCCCCC" BorderStyle="Double" Font-Bold="True" Font-Italic="False" Font-Names="Segoe UI" Font-Size="Small" Font-Underline="False" ForeColor="White" Height="32px" Text="Entrar" Width="134px" />
                        </td>
                    <td class="auto-style22"></td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style13">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="iniciarAbonado" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtUsuario" Name="id" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        <div>
        </div>
    </form>
</body>
</html>
