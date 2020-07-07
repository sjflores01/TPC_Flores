<%@ Page Title="AdminView" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CasaMusica.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <asp:Label Text="Ultimas Ventas" CssClass="h4 text-dark pb-3" runat="server" />
            </div>
            <div class="col-md-6">
                <asp:Label Text="Mas Vendidos" CssClass="h4 text-dark pb-3" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">$</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Ver</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listaUltimasVentas)
                            {%>
                        <tr>
                            <td><% = item.Fecha.ToShortDateString() %></td>
                            <td><% = item.Usuario.NombreUsuario %></td>
                            <td><% = item.Importe.ToString("F2") %></td>
                            <td><% = item.Estado.Nombre %></td>
                            <td><a href="VentaDetalle.aspx?ID=<% = item.ID %>" class="btn btn-dark">Ver Detalle</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Cant.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listaMasVendidos)
                            {%>
                        <tr>
                            <td><% = item.Codigo %></td>
                            <td><% = item.Nombre %></td>
                            <td><% = item.Marca.Nombre %></td>
                            <td><% = item.Categoria.Nombre %></td>
                            <td><% = item.CantidadElegida %></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <asp:Label Text="Mas Likeados" CssClass="h4 text-dark mb-4" runat="server" />
            </div>
            <div class="col-md-6">
                <asp:Label Text="Ultimos Usuarios Registrados" CssClass="h4 text-dark" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Likes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listaMasLikeados)
                            {%>
                        <tr>
                           <td><% = item.Codigo %></td>
                            <td><% = item.Nombre %></td>
                            <td><% = item.Marca.Nombre %></td>
                            <td><% = item.Categoria.Nombre %></td>
                            <td><% = item.CantidadElegida %></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Detalles</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listaUltimosUsuarios)
                            {%>
                        <tr>
                            <td><% = item.FechaReg.ToShortDateString() %></td>
                            <td><% = item.NombreUsuario %></td>
                            <td><a href="DatosCliente.aspx?ID=<% = item.ID %>" class="btn btn-dark">Ver Datos</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <asp:Button Text="Cerrar Sesion" CssClass="btn btn-secondary" ID="btnCerrarSesion" OnClick="btnCerrarSesion_Click" runat="server" />
        </div>
    </div>

</asp:Content>
