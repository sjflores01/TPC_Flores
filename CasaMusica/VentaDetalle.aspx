<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="VentaDetalle.aspx.cs" Inherits="CasaMusica.VentaDetalle" %>

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
            <div class="col col-md-2">
                <div class="form-group">
                    <label class="form-text">Actualizar Estado:</label>
                </div>
            </div>
            <div class="col col-md-3">
                <asp:DropDownList ID="dropDownEstado" CssClass="form-control" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col col-md-2">
                <asp:Button Text="Actualizar" CssClass="btn btn-success" ID="btnActualizarEstado" runat="server" OnClick="btnActualizarEstado_Click" />
            </div>
        </div>
    </div>

    <%--MODALS--%>
    <div class="modal fade" id="modalActualizacion" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text="">Venta</asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" runat="server" Text="">El estado fue actualizado con éxito. ¿Qué queres hacer?</asp:Label>
                        </div>
                        <div class="modal-footer">
                            <a href="Default.aspx" class="btn btn-secondary">Ir al Inicio</a>
                            <a href="Ventas.aspx" class="btn btn-secondary">Ir a Ventas</a>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
