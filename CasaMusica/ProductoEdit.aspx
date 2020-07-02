<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="ProductoEdit.aspx.cs" Inherits="CasaMusica.ProductoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function ValidarFormProductoEdit() {

            var codigo = $("#<% = txtBoxCodigo %>").value;
            var nombre = $("#<% = txtBoxNombre %>").value;
            var descripcion = $("#<% = txtBoxDescripcion %>").value;
            var imagenURL = $("#<% = txtBoxImagen %>").value;
            var precio = $("#<% = txtBoxPrecio %>").value;
            var stock = $("#<% = txtBoxStock %>").value;
            var marca = $("#<% = dropDownMarcas %>").value;
            var categoria = $("#<% = dropDownCategorias %>").value;
            var result = true;

            if (codigo === "") {
                $("#<% = txtBoxCodigo %>").removeClass("is-valid");
                $("#<% = txtBoxCodigo %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = txtBoxCodigo %>").removeClass("is-invalid");
                $("#<% = txtBoxCodigo %>").addClass("is-valid");
            }

            if (nombre === "") {
                $("#<% = txtBoxNombre %>").removeClass("is-valid");
                $("#<% = txtBoxNombre %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = txtBoxNombre %>").removeClass("is-invalid");
                $("#<% = txtBoxNombre %>").addClass("is-valid");
            }

            if (descripcion === "") {
                $("#<% = txtBoxDescripcion %>").removeClass("is-valid");
                $("#<% = txtBoxDescripcion %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = txtBoxDescripcion %>").removeClass("is-invalid");
                $("#<% = txtBoxDescripcion %>").addClass("is-valid");
            }

            if (imagenURL === "") {
                $("#<% = txtBoxImagen %>").removeClass("is-valid");
                $("#<% = txtBoxImagen %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = txtBoxImagen %>").removeClass("is-invalid");
                $("#<% = txtBoxImagen %>").addClass("is-valid");
            }

            if (precio === "") {
                $("#<% = txtBoxPrecio %>").removeClass("is-valid");
                $("#<% = txtBoxPrecio %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = txtBoxPrecio %>").removeClass("is-invalid");
                $("#<% = txtBoxPrecio %>").addClass("is-valid");
            }

            if (stock === "") {
                $("#<% = txtBoxStock %>").removeClass("is-valid");
                $("#<% = txtBoxStock %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = txtBoxStock %>").removeClass("is-invalid");
                $("#<% = txtBoxStock %>").addClass("is-valid");
            }

            if (marca === 0) {
                $("#<% = dropDownMarcas %>").removeClass("is-valid");
                $("#<% = dropDownMarcas %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = dropDownMarcas %>").removeClass("is-invalid");
                $("#<% = dropDownMarcas %>").addClass("is-valid");
            }

            if (categoria === 0) {
                $("#<% = dropDownCategorias %>").removeClass("is-valid");
                $("#<% = dropDownCategorias %>").addClass("is-invalid");
                result = false;
            } else {
                $("#<% = dropDownCategorias %>").removeClass("is-invalid");
                $("#<% = dropDownCategorias %>").addClass("is-valid");
            }

            return result;
        }
    </script>
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
                    <asp:Button Text="Vista Previa" CssClass="btn btn-secondary" ClientIDMode="Static" ID="btnPreviewImg" runat="server" OnClick="btnPreviewImg_Click" />
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
            <div class="form-group col-md-2">
                <label>Precio</label>
                <asp:TextBox Text="" CssClass="form-control" runat="server" ClientIDMode="Static" ID="txtBoxPrecio" />
            </div>
            <div class="form-group col-md-2">
                <label>Stock</label>
                <asp:TextBox Text="" CssClass="form-control" runat="server" ClientIDMode="Static" ID="txtBoxStock" />
            </div>
        </div>
        <asp:Button CssClass="btn btn-secondary" Text="Agregar" runat="server" ID="btnAgregar" OnClientClick="return ValidarFormProductoEdit()" OnClick="btnAgregar_Click" />
        <a href="ABM_Productos.aspx" class="btn btn-primary">Volver</a>
    </div>
</asp:Content>
