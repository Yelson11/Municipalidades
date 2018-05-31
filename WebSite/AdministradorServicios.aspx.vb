Imports System.Data

Partial Class AdministradorServicios
    Inherits System.Web.UI.Page

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        If (listaServicios.Text = "Agua") Then
            MsgBox("Administrador.aspx")
        ElseIf (listaServicios.Text = "Intereses Moratorios") Then
            MsgBox("Administrador.aspx")
        Else
            Dim dvSql As DataView = DirectCast(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
            txtValor.Text = ""
        End If

    End Sub
End Class
