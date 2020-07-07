<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="CompraDetalle.aspx.cs" Inherits="CasaMusica.CompraDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <p class="display-4">Detalles de la operacion Nro: <% = venta.ID %></p>
        </div>
        <div class="row">
            <div class="col col col-md-6">
                <div class="form-group">
                    <p class="form-text">Nombre y Apellido: <b><% = venta.Usuario.Nombre %> <% = venta.Usuario.Apellido %></b></p>
                    <p class="form-text">Email: <b><% = venta.Usuario.Contacto.Email %></b> </p>
                    <p class="form-text">Telefono: <b><% = venta.Usuario.Contacto.Telefono %></b> </p>
                    <p class="form-text">Direccion: <b><% = venta.Usuario.Contacto.Direccion.Calle %> , <% = venta.Usuario.Contacto.Direccion.Numero %>. <% = venta.Usuario.Contacto.Direccion.Piso %> <% = venta.Usuario.Contacto.Direccion.Dpto %></b></p>
                    <p class="form-text">Localidad: <b><% = venta.Usuario.Contacto.Direccion.Localidad.Nombre %></b></p>
                    <p class="form-text">Departamento: <b><% = venta.Usuario.Contacto.Direccion.Departamento.Nombre %></b></p>
                    <p class="form-text">Provincia: <b><% = venta.Usuario.Contacto.Direccion.Provincia.Nombre %></b> </p>
                </div>
            </div>
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Imagen</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Un.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listaProductos)
                            {%>
                        <tr>
                            <td><% = item.Codigo %></td>
                            <td>
                                <img src="<% = item.URLImagen %>" alt="Alternate Text" width="50px" class="rounded" />
                            </td>
                            <td><% = item.Nombre %></td>
                            <td><% = item.CantidadElegida %></td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <div class="col offset-5">
                    <p>Importe Total: <b>$<% = venta.Importe.ToString("F2") %></b></p>
                    <p>Fecha de la operacion: <b><% = venta.Fecha.ToShortDateString() %></b></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col col-md-3">
                <p class="alert alert-success">Estado: <% = venta.Estado.Nombre %></p>
            </div>
        </div>
    </div>
</asp:Content>
