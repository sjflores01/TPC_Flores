<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="MarcaEdit.aspx.cs" Inherits="CasaMusica.MarcaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row pb-3">
            <asp:Label Text="Alta/Modificacion Marcas" class="display-4" runat="server" />
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="form-group col-md-3">
                        <label>Codigo</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxCodigo" OnTextChanged="txtBoxCodigo_TextChanged" AutoPostBack="true" />
                        <div class="row">
                            <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblCodigoExistente" runat="server" />
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Nombre</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxNombre" OnTextChanged="txtBoxNombre_TextChanged" AutoPostBack="true" />
                        <div class="row">
                            <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblNombreExistente" runat="server" />
                        </div>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="form-group">
                <label>URL Imagen</label>
                <asp:TextBox Text="" CssClass="form-control mb-3" runat="server" ID="txtBoxImagen" />
                <asp:Button Text="Vista Previa" CssClass="btn btn-secondary" ClientIDMode="Static" ID="btnPreviewImg" runat="server" OnClick="btnPreviewImg_Click" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxImagen" ErrorMessage="URL Invalida" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                <img src="<% = imagenURL %>" class="img-thumbnail" alt="Error al cargar URL" widht="100px" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button Text="Aceptar" CssClass="btn btn-primary" runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" />
    <a href="ABM_Marcas.aspx" class="btn btn-primary">Volver</a>
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
