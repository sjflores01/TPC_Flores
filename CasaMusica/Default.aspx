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
                    <thead>
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">$</th>
                            <th scope="col">Ver</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td><a href="#" class="btn btn-dark">Ver Detalle</a></td>
                        </tr>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td><a href="#" class="btn btn-dark">Ver Detalle</a></td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Categoria</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                        </tr>
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
                    <thead>
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Categoria</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Detalles</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listadoUsuarios)
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
        </div>
    </div>

</asp:Content>
