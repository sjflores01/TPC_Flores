<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="ProductoEdit.aspx.cs" Inherits="CasaMusica.ProductoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="/JS/Funciones_Cliente.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row pb-3">

            <asp:label text="Alta/Modificacion Productos" class="display-4" runat="server" />
        </div>
        <div class="row">

            <div class="form-group col-md-3">
                <label>Codigo</label>
                <asp:Label Text="Campo Requerido" CssClass="alert alert-danger ml-1 mb-1" runat="server" ID="lblCodigoRequerido" />
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxCodigo" />
            </div>
            <div class="form-group col-md-6">
                <label>Nombre</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxNombre" />
            </div>

        </div>
        <div class="form-group">
            <label>Descripcion</label>
            <asp:TextBox CssClass="form-control" runat="server" TextMode="MultiLine" ID="txtBoxDescripcion" />
        </div>
        <div class="form-group">
            <label>URL Imagen</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxImagen" />
        </div>
        <div class="row">

            <div class="form-group col-md-4">
                <label>Marca</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownMarcas">
                    <asp:ListItem Text="text1" />
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-4">
                <label>Categoria</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownCategorias">
                    <asp:ListItem Text="text1" />
                </asp:DropDownList>
            </div>

        </div>
        <div class="row">

            <div class="form-group col-md-2">
                <label>Precio</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxPrecio" />
            </div>
            <div class="form-group col-md-2">
                <label>Stock</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxStock" />
            </div>

        </div>
        
        <asp:Button CssClass="btn btn-primary" Text="Agregar" runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" />
        <a href="ABM_Productos.aspx" class="btn btn-primary">Volver</a>

    </div>
</asp:Content>
