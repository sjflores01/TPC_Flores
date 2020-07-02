<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="CasaMusica.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col col-md-6">
                <h4 class="display-4">Favoritos</h4>
            </div>
            <div class="col col-md-6">
                <h4 class="display-4">Datos de Contacto</h4>
            </div>
        </div>
        <div class="row">
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">$</th>
                            <th scope="col">Ver</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listadoFavoritos)
                            {%>
                        <tr>
                            <td><% = item.Producto.Nombre %></td>
                            <td><% = item.Producto.Marca.Nombre %></td>
                            <td><% = item.Producto.Precio.ToString("F2") %></td>
                            <td><a href="VerDetalle.aspx?ID=<% = item.Producto.ID %>" class="btn btn-dark">Ver</a></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
            <div class="col col-md-6">
                <div class="form-row">
                    <div class="form-group col">
                        <label>Email</label>
                        <asp:TextBox Text="" ID="txtBoxEmail" CssClass="form-control" Enabled="false" runat="server" />
                        <label>Usuario</label>
                        <asp:TextBox Text="" ID="txtBoxUsuario" CssClass="form-control" Enabled="false" runat="server" />
                        <label>Domicilio de Entrega</label>
                        <asp:TextBox Text="" ID="txtBoxDomicilio" CssClass="form-control" Enabled="false" runat="server" />
                        <asp:Button Text="Editar" ID="btnEditar" CssClass="btn btn-dark" runat="server" OnClick="btnEditar_Click" />
                        <asp:Button Text="Cerrar Sesion" ID="btnCerrarSesion" CssClass="btn btn-dark" runat="server" OnClick="btnCerrarSesion_Click" />
                    </div>
                </div>
                <h4 class="display-4">Mis Pedidos</h4>
                <div class="row">
                    <div class="col col-md-6">
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th scope="col">Nro. Op</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">$</th>
                                    <th scope="col">Detalle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var item in listadoVentas)
                                    {%>
                                <tr>
                                    <td><% = item.ID %></td>
                                    <td><% = item.Fecha.ToShortDateString() %></td>
                                    <td><% = item.Importe.ToString("F2") %></td>
                                    <td><a href="CompraDetalle.aspx?ID=<% = item.ID %>" class="btn btn-dark">Ver</a></td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col offset-10">
                <a href="DefaultUser.aspx" class="btn btn-secondary">Ir al Home</a>
            </div>
        </div>
    </div>
</asp:Content>
