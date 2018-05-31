<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageAdmi.master" AutoEventWireup="false" CodeFile="AdministradorServicios.aspx.vb" Inherits="AdministradorServicios" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Image ID="Image4" runat="server" Height="124px" ImageUrl="~/settings-icon.png" Width="130px" />
<br />
<br />
&nbsp;<asp:Label ID="Label3" runat="server" Text="Seleccione el servicio que desea cambiar:"></asp:Label>
    &nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="listaServicios" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Nombre">
</asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label4" runat="server" Text="Digite el nuevo valor:"></asp:Label>
    &nbsp;<asp:TextBox ID="txtValor" runat="server" Width="105px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="121px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br />
<br />
<br />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="cargarServicios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="cambiarServicio" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="listaServicios" Name="servicio" PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="txtValor" Name="valorNuevo" PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

