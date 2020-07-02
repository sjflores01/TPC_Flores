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

        <asp:Button Text="Aceptar" CssClass="btn btn-primary" runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" />
        <a href="ABM_Categorias.aspx" class="btn btn-primary">Volver</a>
    </div>
</asp:Content>
