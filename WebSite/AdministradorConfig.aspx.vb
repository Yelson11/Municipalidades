Imports System.Data

Partial Class AdministradorConfig
    Inherits System.Web.UI.Page

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        If (listaConfig.Text = "Dia Emision") Then
            Dim dvSql As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
            txtValor.Text = ""
        ElseIf (listaConfig.Text = "Dia de Pago") Then
            Dim dvSql As DataView = DirectCast(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
            txtValor.Text = ""
        ElseIf (listaConfig.Text = "Tasa de Interes") Then
            Dim dvSql As DataView = DirectCast(SqlDataSource3.Select(DataSourceSelectArguments.Empty), DataView)
            txtValor.Text = ""
        End If
    End Sub
End Class
