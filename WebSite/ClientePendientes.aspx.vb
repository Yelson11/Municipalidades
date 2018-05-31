Imports System.Data
Partial Class ClientePendientes
    Inherits System.Web.UI.Page

    Protected Sub btnAceptar_Click(sender As Object, e As EventArgs) Handles btnAceptar.Click
        Dim dvSql As DataView = DirectCast(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        Response.Redirect("ClientePendientes.aspx")
    End Sub
End Class
