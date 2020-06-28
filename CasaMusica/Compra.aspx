<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="CasaMusica.Compra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <h6 class="display-4">Ya falta poco!</h6>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:Label Text="Por favor, chequea todo antes de continuar..." CssClass="small" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="col col-md-4">
                <div class="form-group">
                    <asp:Label Text="Datos de contacto" CssClass="form-text" runat="server" />
                    <asp:Label Text="Nombre y Apellido: " ID="lblNombreApellido" CssClass="form-text" runat="server" />
                    <asp:Label Text="Email: " ID="lblEmail" CssClass="form-text" runat="server" />
                    <asp:Label Text="Telefono: " ID="lblTelefono" CssClass="form-text" runat="server" />
                </div>
            </div>
            <div class="col col-md-6">
                <table class="table text-secondary">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Cod.</th>
                            <th scope="col">Articulo</th>
                            <th scope="col">Pr. Unit</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Modalidad de Pago</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listaProductos)
                            {%>
                        <tr>
                            <th scope="row"><% = item.Codigo %></th>
                            <td><% = item.Nombre %></td>
                            <td><% = item.Precio %></td>
                            <td><% = item.CantidadElegida %></td>
                            <td>Reserva</td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
                <div class="form-group font-weight-bold">
                    <asp:Label Text="Precio Final: $" ID="lblTextPrecio" CssClass="alert alert-info" runat="server" />
                    <asp:Label Text="" ID="lblPrecioFinal" CssClass="alert alert-info" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click" />
                    <asp:Button Text="Volver" ID="btnVolver" CssClass="btn btn-primary" runat="server" PostBackUrl="~/Carrito.aspx" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalCompraExitosa" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text="">Tus Articulos fueron reservados con exito!</asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblModalBody" runat="server" Text="">Contactanos para concretar la compra.</asp:Label>
                            </div>
                            <div class="modal-footer">
                                <a href="Contacto.aspx" class="btn btn-info">Contacto</a>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>



</asp:Content>
