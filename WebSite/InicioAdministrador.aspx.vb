Imports System.Data

Partial Class InicioAdministrador
    Inherits System.Web.UI.Page

    Protected Sub btnCliente_Click(sender As Object, e As EventArgs) Handles btnCliente.Click
        Response.Redirect("InicioCliente.aspx")
    End Sub
    Protected Sub btnEntrar_Click(sender As Object, e As EventArgs) Handles btnEntrar.Click
        Dim numero As Integer
        Dim dvSql As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        If dvSql.Count > 0 Then
            numero = 1
        End If
        If numero = 1 Then
            Session("IdUsuario") = dvSql(0).Item(0)
            Response.Redirect("Administrador.aspx")
        Else
            MsgBox("ERROR: Usuario Inexistente")
        End If
    End Sub
End Class
