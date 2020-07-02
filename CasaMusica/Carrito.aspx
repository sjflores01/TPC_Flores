<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="CasaMusica.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <asp:Label Text="Hola " CssClass="display-3 text-info" ID="lblBienvenida" runat="server" />
        </div>
    </div>
    <div class="container">
        <div class="row">
            <asp:Label Text="Tu carrito no tiene items! 
                   Que esperas!? Volvé a la home y agregá lo que quieras!"
                ID="lblCarritoVacio" CssClass="display-4 text-secondary" runat="server" />
        </div>
        <div class="row my-4">
            <table class="table text-secondary">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Cod.</th>
                        <th scope="col"></th>
                        <th scope="col">Articulo</th>
                        <th scope="col">Pr. Unit</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in listaCarrito)
                        {%>
                    <tr>
                        <th scope="row"><% = item.Codigo %></th>
                        <td>
                            <img src="<% = item.URLImagen %>" alt="Alternate Text" width="50px" class="rounded" />
                        </td>
                        <td><% = item.Nombre %></td>
                        <td><% = item.Precio.ToString("F2") %></td>
                        <td>
                            <a href="Carrito.aspx?ModifID=<% = item.ID %>&cant=resta">
                                <svg class="bi bi-file-arrow-down" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />
                                    <path fill-rule="evenodd" d="M4.646 8.146a.5.5 0 0 1 .708 0L8 10.793l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z" />
                                    <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0v-6A.5.5 0 0 1 8 4z" />
                                </svg>
                            </a>
                            <% = item.CantidadElegida %>
                            <a href="Carrito.aspx?ModifID=<% = item.ID %>">
                                <svg class="bi bi-file-arrow-up" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" d="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />
                                    <path fill-rule="evenodd" d="M4.646 7.854a.5.5 0 0 0 .708 0L8 5.207l2.646 2.647a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 0 0 0 .708z" />
                                    <path fill-rule="evenodd" d="M8 12a.5.5 0 0 0 .5-.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 0 .5.5z" />
                                </svg>
                            </a>
                        </td>
                        <td>
                            <a href="Carrito.aspx?ElimID=<% = item.ID %>">
                                <svg class="bi bi-trash text-danger" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                </svg>
                            </a>
                        </td>
                        <asp:Label Text="No hay más stock!" CssClass="alert alert-danger" Visible="false" ID="lblNoStock" runat="server" />
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col col-md-4">
                <div class="form-group font-weight-bold">
                    <asp:Label Text="Precio Final: $" ID="lblTextPrecio" Visible="false" runat="server" />
                    <asp:Label Text="" ID="lblPrecioFinal" Visible="false" runat="server" />
                </div>
            </div>
            <div class="col offset-10">
                <asp:Button Text="Finalizar Compra" ID="btnFinalizar" CssClass="btn btn-primary" runat="server" Visible="false" OnClick="btnFinalizar_Click" />
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:Button Text="Volver a Home" CssClass="btn btn-primary" ID="btnVolver" runat="server" PostBackUrl="~/DefaultUser.aspx" />
            </div>
        </div>
    </div>
     <%--MODALS--%>
            <div class="modal fade" id="modalEliminar" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text="">Carrito</asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblModalBody" runat="server" Text="">Eliminar Articulo del Carrito?</asp:Label>
                            </div>
                            <div class="modal-footer">
                                <asp:Button Text="Borrar" ID="btnBorrar" CssClass="btn btn-info" OnClick="btnBorrar_Click" runat="server" />
                                <a href="ABM_Usuarios.aspx" class="btn btn-info">Volver</a>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
</asp:Content>
