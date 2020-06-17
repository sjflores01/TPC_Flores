<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="MarcaEdit.aspx.cs" Inherits="CasaMusica.MarcaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row pb-3">
            <asp:Label Text="Alta/Modificacion Marcas" class="display-4" runat="server" />
        </div>
        <div class="row">
            <div class="form-group col-md-3">
                <label>Codigo</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxCodigo" />
            </div>
            <div class="form-group col-md-6">
                <label>Nombre</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxNombre" />
            </div>
        </div>
        <div class="form-group">
            <label>URL Imagen</label>
            <asp:TextBox CssClass="form-control" runat="server" ID="txtBoxImagen" />
        </div>
        <asp:Button Text="Aceptar" CssClass="btn btn-primary" runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" />
        <a href="ABM_Marcas.aspx" class="btn btn-primary">Volver</a>
    </div>
</asp:Content>
