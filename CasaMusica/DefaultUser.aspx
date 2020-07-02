<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="DefaultUser.aspx.cs" Inherits="CasaMusica.DefaultUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-4 mb-4">
                <div class="col col-md-1 mt-4">
                    <asp:Label Text="Buscar: " CssClass="text-secondary font-weight-bold" Font-Size="X-Large" runat="server" />
                </div>
                <div class="col col-md-8">
                    <asp:TextBox CssClass="form-control mt-4" ID="txtBoxBuscar" runat="server" />

                </div>
                <div class="col col-md-2">
                    <asp:LinkButton Text="" runat="server" ID="btnBuscar" CssClass="btn btn-outline-secondary mt-4" OnClick="btnBuscar_Click">
                    <i class="glyphicon glyphicon-search"></i>
                    <svg class="bi bi-search text-light font-weight-bold" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                    </svg></asp:LinkButton>
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
                        <a href="VerDetalle.aspx?ID=<% = item.ID %>" class="btn btn-outline-secondary">Detalle</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</asp:Content>
