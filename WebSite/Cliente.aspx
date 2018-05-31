<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnCerrarSesión_Click(sender As Object, e As EventArgs)
        Response.Redirect("InicioCliente.aspx")
    End Sub
</script>

<!--
Template Name: Corporation
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Corporation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
    <style type="text/css">
        .auto-style3 {
            width: 241px;
            height: 144px;
        }
        .auto-style4 {
            left: 296px;
            right: 0;
            top: 64px;
            height: 71px;
        }
        .auto-style5 {
            left: 0px;
            top: 0px;
            width: 936px;
        }
        .auto-style6 {
            width: 83px;
        }
        .auto-style7 {
            left: 0;
            top: 65px;
        }
    </style>
</head>
<body id="top">
    <form id="form1" runat="server">
<div class="wrapper col1">
  <div id="head" class="auto-style5">
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="index.html">Municipalidades de Costa Rica </a></h1>
      <br />
      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
    <p class="auto-style7">
      <asp:Button ID="btnCerrarSesión" runat="server" BackColor="#999999" ForeColor="White" OnClick="btnCerrarSesión_Click" Text="Cerrar Sesión" Width="109px" />
      </p>
    <div id="topnav" class="auto-style4">
      <ul>
          <li class="auto-style6"><a class="active" href="Cliente.aspx">Inicio</a></li>
        <li><a href="ClientePendientes.aspx">Recibos Pendientes</a></li>
        <li><a href="ClienteConsultar.aspx">Consultar Recibos</a></li>
        <li><ul>
            <li><a href="#">Link 1</a></li>
            <li><a href="#">Link 2</a></li>
            <li><a href="#">Link 3</a></li>
          </ul>
        </li>
        <li class="last"><a href="ClienteHistorial.aspx">&nbsp;Historial de Recibos</a></li>
      </ul>
    </div>
  </div>
</div>
<div class="wrapper col2">
  <div id="gallery">
    <ul>
      <li></li>
      <li></li>
      <li class="last"></li>
        <asp:Image ID="Image4" runat="server" Height="271px" ImageUrl="~/paga a tiempo.png" Width="956px" />
    </ul>
    <div class="clear"></div>
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
    <div id="content">
      <h1>¡ATENCIÓN USUARIOS!</h1>
      <p>La municipalidad le informa que no se cobra por ningún trámite de uso de suelo, visados o patentes, ni tampoco por gestionar trámites antes del tiempo establecido.</p>
      <p>Evite ser víctima del fraude y cualquier duda o sospecha acérquese al palacio municipal.</p>
      <div class="homecontent">
        <ul>
        </ul>
        <div class="clear"></div>
      </div>
    </div>
    <div id="column">
      <div id="featured">
        <ul>
          <li>
            <h2>Cobertura Completa<img src="mapa_provincias.jpg" alt="" class="auto-style3" /></h2>
            <p>Contamos con servicio para todas las municipalidades del país. </p>
            <p class="more"><a href="https://es.wikipedia.org/wiki/Anexo:Cantones_de_Costa_Rica">Leer Más &raquo;</a></p>
          </li>
        </ul>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<div class="wrapper col5">
  <div id="footer">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
&nbsp;<!-- End Contact Form --><!-- End Company Details --><div id="copyright">
      <p class="fl_left">Copyright &copy; 2018 - Derechos Reservados -  href="#">Carlos Vega - Yelson Monge</a></p>
      <p class="fl_right">&nbsp;<a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
      <br class="clear" />
    </div>
      <asp:Image ID="Image2" runat="server" CssClass="auto-style2" Height="45px" ImageUrl="~/bandera costa rica.png" Width="446px" />
&nbsp;&nbsp;
      <asp:Image ID="Image1" runat="server" CssClass="auto-style1" Height="45px" ImageUrl="~/escudo cr.png" Width="45px" />
&nbsp;&nbsp;<asp:Image ID="Image3" runat="server" CssClass="auto-style2" Height="45px" ImageUrl="~/bandera costa rica.png" Width="426px" />
    <div class="clear">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Italic="False" Font-Names="Segoe UI Light" Font-Size="X-Small" Text="Términos y condiciones | Políticas de privacidad | Declaración del uso de cookies"></asp:Label>
      </div>
  </div>
</div>
    </form>
</body>
</html>