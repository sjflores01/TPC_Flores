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
                <label for="inputAddress">Codigo</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="">
            </div>
            <div class="form-group col-md-6">
                <label for="inputAddress2">Nombre</label>
                <input type="text" class="form-control" id="inputAddress2" placeholder="">
            </div>
        </div>
        <div class="form-group">
            <label for="inputAddress2">URL Imagen</label>
            <input type="text" class="form-control" placeholder="">
        </div>
        <button type="submit" class="btn btn-primary">Agregar</button>
        <a href="ABM_Marcas.aspx" class="btn btn-primary">Volver</a>
    </div>
</asp:Content>
