<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageAdmi.master" AutoEventWireup="false" CodeFile="AdministradorDistritos.aspx.vb" Inherits="AdministradorDistritos" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
        <asp:BoundField DataField="CodigoPostal" HeaderText="CodigoPostal" SortExpression="CodigoPostal" />
        <asp:BoundField DataField="Morosidad" HeaderText="Morosidad" SortExpression="Morosidad" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="verDistrito" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="1" Name="idMuni" SessionField="IdUsuario" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

