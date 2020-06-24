<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="DefaultUser.aspx.cs" Inherits="CasaMusica.DefaultUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-4 mb-4">
            <div class="col col-md-4">
                <asp:TextBox CssClass="form-control" runat="server" />
            </div>
            <div class="col">
                <a href="#">
                    <svg class="bi bi-search text-primary" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                    </svg>
                </a>
            </div>
        </div>
        <div class="row">
            <%foreach (var item in listaProductos)
                {%>
            <div class="col col-md-4">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="<% = item.URLImagen %>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><% = item.Nombre %></h5>
                        <h6 class="card-title"><% = item.Marca.Nombre %></h6>
                        <p class="card-text"><% = item.Descripcion %></p>
                        <a href="#" class="btn btn-outline-secondary">Detalle</a>
                        <a href="DefaultUser.aspx?ID=<% = item.ID %>" class="btn btn-outline-success">
                            <svg class="bi bi-heart text-light" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</asp:Content>
