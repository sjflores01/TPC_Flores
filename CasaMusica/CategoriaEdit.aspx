<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="CategoriaEdit.aspx.cs" Inherits="CasaMusica.CategoriaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row pb-3">
            <asp:Label Text="Alta/Modificacion Categorias" class="display-4" runat="server" />
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <label>Nombre</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxNombre" OnTextChanged="txtBoxNombre_TextChanged" />
                <div class="row">
                    <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblNombreExistente" runat="server" />
                </div>
            </div>
        </div>

        <asp:Button Text="Aceptar" CssClass="btn btn-secondary mb-5" runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" />
        <a href="ABM_Categorias.aspx" class="btn btn-secondary mb-5">Volver</a>
    </div>

    <%--MODALS--%>
    <div class="modal fade" id="modalErrorForm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text="">Error!</asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblModalBody" runat="server" Text="">Debés completar todos los campos antes de continuar.</asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
</asp:Content>
