<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageAdmi.master" AutoEventWireup="false" CodeFile="AdministradorConfig.aspx.vb" Inherits="AdministradorConfig" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Image ID="Image4" runat="server" Height="124px" ImageUrl="~/settings-icon.png" Width="130px" />
&nbsp;<br />
<br />
<asp:Label ID="Label6" runat="server" Text="Seleccione la opción que desea cambiar:"></asp:Label>
    &nbsp;<asp:DropDownList ID="listaConfig" runat="server">
    <asp:ListItem Value="Dia Emision">Dia Emision</asp:ListItem>
    <asp:ListItem Value="Dia de Pago">Dia de Pago</asp:ListItem>
    <asp:ListItem Value="Tasa de Interes">Tasa de Interes</asp:ListItem>
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label7" runat="server" Text="Digite el nuevo valor:"></asp:Label>
    <asp:TextBox ID="txtValor" runat="server" Width="105px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="121px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="configuarTasa" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="iDMuni" SessionField="IdUsuario" Type="Int32" />
            <asp:ControlParameter ControlID="txtValor" Name="valor" PropertyName="Text" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="configuarLimite" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="iDMuni" SessionField="IdUsuario" Type="Int32" />
        <asp:ControlParameter ControlID="txtValor" Name="valor" PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="configuarEmision" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="iDMuni" SessionField="IdUsuario" Type="Int32" />
        <asp:ControlParameter ControlID="txtValor" Name="valor" PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
    <br />
</asp:Content>

