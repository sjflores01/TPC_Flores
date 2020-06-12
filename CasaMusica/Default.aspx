<%@ Page Title="AdminView" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CasaMusica.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Img</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Stock</th>
                        <th scope="col">#</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in listaProductos)
                        {%>
                    <tr>
                        <th scope="row"><% = item.Codigo %></th>
                        <td>
                            <img src="<% = item.URLImagen %>" width="50px" class="rounded"></td>
                        <td><% = item.Nombre %></td>
                        <td><% = item.Marca.Nombre %></td>
                        <td><% = item.Stock %></td>
                        <td><a class="btn btn-outline-primary" href="#">Modificar</a></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
