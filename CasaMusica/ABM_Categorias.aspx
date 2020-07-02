<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="ABM_Categorias.aspx.cs" Inherits="CasaMusica.ABM_Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">#</th>
                        <th scope="col">
                            <svg class="bi bi-trash" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                            </svg>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in listadoCategorias)
                        {%>
                    <tr>
                        <th scope="row"><% = item.ID %></th>
                        <td><% = item.Nombre %></td>
                        <td><a class="btn btn-outline-primary" href="CategoriaEdit.aspx?ID=<% = item.ID %>">Modificar</a></td>
                        <td><a href="ABM_Categorias.aspx?ID=<% = item.ID %>">
                            <svg class="bi bi-x-circle-fill text-danger" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.146-3.146a.5.5 0 0 0-.708-.708L8 7.293 4.854 4.146a.5.5 0 1 0-.708.708L7.293 8l-3.147 3.146a.5.5 0 0 0 .708.708L8 8.707l3.146 3.147a.5.5 0 0 0 .708-.708L8.707 8l3.147-3.146z" />
                            </svg>
                        </a>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row pt-2">
        <div class="col offset-10">
            <a href="CategoriaEdit.aspx" class="btn btn-dark">Agregar Nueva</a>
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
                                    <asp:Label ID="lblModalTitle" runat="server" Text="">Baja Categoria</asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblModalBody" runat="server" Text="">Que queres hacer?</asp:Label>
                            </div>
                            <div class="modal-footer">
                                <asp:Button Text="Borrar" ID="btnBorrar" CssClass="btn btn-info" OnClick="btnBorrar_Click" runat="server" />
                                <a href="ABM_Categorias.aspx" class="btn btn-info">Volver</a>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
</asp:Content>
