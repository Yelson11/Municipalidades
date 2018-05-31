Imports System.Data

Partial Class InicioCliente
    Inherits System.Web.UI.Page

    Protected Sub btnAdministrador_Click(sender As Object, e As EventArgs) Handles btnAdministrador.Click
        Response.Redirect("InicioAdministrador.aspx")
    End Sub
    Protected Sub btnEntrar_Click(sender As Object, e As EventArgs) Handles btnEntrar.Click
        Dim numero As Integer
        Dim dvSql As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        If dvSql.Count > 0 Then
            numero = 1
        End If
        If numero = 1 Then
            Session("IdUsuario") = dvSql(0).Item(0)
            Response.Redirect("Cliente.aspx") 'Redirije a otra pagina
        Else
            MsgBox("ERROR: Usuario Inexistente")
        End If
    End Sub
End Class
