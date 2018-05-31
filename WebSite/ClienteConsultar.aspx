<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageCliente.master" AutoEventWireup="false" CodeFile="ClienteConsultar.aspx.vb" Inherits="ClienteConsultar" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label4" runat="server" Text="Digite el Id del recibo que desea consultar:"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPropiedad" runat="server" Width="105px" Height="22px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="121px" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="detalleRecibo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="IdRecibo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

