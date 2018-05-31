Imports System.Data
Partial Class ClienteConsultar
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        Session("IdRecibo") = txtPropiedad.Text
        Response.Redirect("ClienteConsultar.aspx")
    End Sub
End Class
