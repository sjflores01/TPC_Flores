<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="ProductoEdit.aspx.cs" Inherits="CasaMusica.ProductoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row pb-3">
            <asp:Label Text="Alta/Modificacion Productos" class="display-4" runat="server" />
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="form-group col-md-3">
                        <label>Codigo</label>
                        <asp:TextBox Text="" CssClass="form-control" runat="server" ClientIDMode="Static" ID="txtBoxCodigo" OnTextChanged="txtBoxCodigo_TextChanged" AutoPostBack="true" />
                        <div class="row">
                            <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblCodigoExistente" runat="server" />
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Nombre</label>
                        <asp:TextBox Text="" CssClass="form-control" runat="server" ClientIDMode="Static" ID="txtBoxNombre" OnTextChanged="txtBoxNombre_TextChanged" AutoPostBack="true" />
                        <div class="row">
                            <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblNombreExistente" runat="server" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="form-group">
            <label>Descripcion</label>
            <asp:TextBox Text="" CssClass="form-control" runat="server" TextMode="MultiLine" ClientIDMode="Static" ID="txtBoxDescripcion" />
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="form-group">
                    <label>URL Imagen</label>
                    <asp:TextBox Text="" CssClass="form-control" runat="server" ID="txtBoxImagen" />
                    <asp:Button Text="Vista Previa" CssClass="btn btn-secondary mt-2" ClientIDMode="Static" ID="btnPreviewImg" runat="server" OnClick="btnPreviewImg_Click" />
                    <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxImagen" ErrorMessage="URL Invalida" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                    <img src="<% = imagenURL %>" class="img-thumbnail" alt="Error al cargar URL" widht="100px" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="row">

            <div class="form-group col-md-4">
                <label>Marca</label>
                <asp:DropDownList CssClass="form-control" runat="server" ClientIDMode="Static" ID="dropDownMarcas">
                    <asp:ListItem Text="text1" />
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-4">
                <label>Categoria</label>
                <asp:DropDownList CssClass="form-control" runat="server" ClientIDMode="Static" ID="dropDownCategorias">
                    <asp:ListItem Text="text1" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-4">
                <label>Precio</label>
                <asp:TextBox Text="" CssClass="form-control mb-3" runat="server" ClientIDMode="Static" ID="txtBoxPrecio" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxPrecio" ErrorMessage="Dato incorrecto" ValidationExpression="^\d+(\,\d\d)?$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group col-md-4">
                <label>Stock</label>
                <asp:TextBox Text="" CssClass="form-control mb-3" type="number" runat="server" ClientIDMode="Static" ID="txtBoxStock" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxStock" Display="Dynamic" ErrorMessage="Dato incorrecto" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </div>
        </div>
        <asp:Button CssClass="btn btn-secondary mb-5" Text="Agregar" runat="server" ID="btnAgregar" OnClientClick="return ValidarFormProductoEdit()" OnClick="btnAgregar_Click" />
        <a href="ABM_Productos.aspx" class="btn btn-secondary mb-5">Volver</a>
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
