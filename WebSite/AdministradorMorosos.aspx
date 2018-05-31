<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageAdmi.master" AutoEventWireup="false" CodeFile="AdministradorMorosos.aspx.vb" Inherits="AdministradorMorosos" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
        <asp:BoundField DataField="TotalMorosidad" HeaderText="TotalMorosidad" SortExpression="TotalMorosidad" />
        <asp:BoundField DataField="CantidadRecibos" HeaderText="CantidadRecibos" SortExpression="CantidadRecibos" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="verMorososxMunicipalidad" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="idMunicipalidad" SessionField="IdUsuario" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

