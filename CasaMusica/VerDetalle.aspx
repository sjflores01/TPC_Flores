<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="VerDetalle.aspx.cs" Inherits="CasaMusica.VerDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card mb-6">
            <div class="row no-gutters">
                <div class="col-md-8">
                    <img src="<% = producto.URLImagen %>" class="card-img" alt="...">
                </div>
                <div class="col-md-4">
                    <div class="card-body">
                        <h5 class="card-title"><% = producto.Nombre  %></h5>
                        <h6 class="card-title"><% = producto.Marca.Nombre  %></h6>
                        <p class="card-text"><% = producto.Categoria.Nombre %></p>
                        <p class="card-text"><small class="text-muted"><% = producto.Descripcion %></small></p>
                        <h6>
                            <asp:Label Text="Precio: $" CssClass="card-title" ID="lblTxtPrecio" runat="server" />
                            <asp:Label Text="" CssClass="card-title" ID="lblPrecio" runat="server" />
                        </h6>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="row form-inline">
                                    <div class="col align-content-center">
                                        <asp:Label Text="Cantidad" CssClass="card-text" runat="server" />
                                        <asp:TextBox CssClass="card-text form-control mb-2" Columns="2" MaxLength="3" ID="txtBoxCantidad" Text="1" runat="server" OnTextChanged="txtBoxCantidad_TextChanged" AutoPostBack="true" />
                                        <div class="row">
                                            <asp:Label Text="" ID="lblNoStock" CssClass="small alert alert-danger" Visible="false" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md">
                        <asp:Button Text="Agregar al Carrito" CssClass="btn btn-success" ID="btnAgregarArticulo" runat="server" OnClick="btnAgregarArticulo_Click" />
                    </div>
                    <% if (artFav)
                        {%>
                    <div class="col-md">
                        <asp:LinkButton ID="linkBtnElimFavorito" runat="server" CssClass="btn btn-success" OnClick="linkBtnElimFavorito_Click">
                        <i class="glyphicon glyphicon-search"></i>
                            <svg class="bi bi-heart text-light" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg></asp:LinkButton>
                    </div>
                    <%}
                        else
                        {%>
                    <div class="col-md">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-success" OnClick="linkBtnFavorito_Click">
                        <i class="glyphicon glyphicon-search"></i> 
                            <svg class="bi bi-heart text-light" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg> </asp:LinkButton>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
