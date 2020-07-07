<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="CasaMusica.Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col my-3">
                <a href="Default.aspx" class="btn btn-secondary">Volver</a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Nro. Op.</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">$</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Ver</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var item in listadoVentas)
                            {%>
                        <tr>
                            <td><% = item.ID %></td>
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
        </div>
    </div>
</asp:Content>
