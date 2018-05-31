<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageCliente.master" AutoEventWireup="false" CodeFile="ClientePendientes.aspx.vb" Inherits="ClientePendientes" %>

<%-- Agregue aquí los controles de contenido --%>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Label ID="Label4" runat="server" Text="Digite el ID de la propiedad a la que desea cancelarle el recibo más antiguo:"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPropiedad" runat="server" Width="105px" Height="22px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="btnAceptar" runat="server" Text="Aceptar" Width="121px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="IdPropiedad" HeaderText="IdPropiedad" SortExpression="IdPropiedad" />
        <asp:BoundField DataField="TotalPagosSinInteresMoratorio" HeaderText="TotalPagosSinInteresMoratorio" SortExpression="TotalPagosSinInteresMoratorio" />
        <asp:BoundField DataField="InteresMoratorio" HeaderText="InteresMoratorio" SortExpression="InteresMoratorio" />
        <asp:BoundField DataField="TotalPagado" HeaderText="TotalPagado" SortExpression="TotalPagado" />
        <asp:BoundField DataField="FechaLimite" HeaderText="FechaLimite" SortExpression="FechaLimite" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="pagarRecibo" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtPropiedad" Name="IdPropiedad" PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-OBVU3M4;Initial Catalog=ControlMunicipalidades;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="verRecibosPendientes" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="IdUsuario" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

