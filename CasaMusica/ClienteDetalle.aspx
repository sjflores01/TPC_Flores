<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="ClienteDetalle.aspx.cs" Inherits="CasaMusica.ClienteDetalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <p class="display-4">Datos del Cliente</p>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <p class="form-text">Fecha de Alta en Sistema: <b><% = usuario.FechaReg.ToShortDateString() %></b></p>
                    <p class="form-text">Nombre y Apellido: <b><% = usuario.Nombre %> <% = usuario.Apellido %></b></p>
                    <p class="form-text">DNI: <b><% = usuario.Dni %></b></p>
                    <p class="form-text">Fecha de Nacimiento: <b><% = usuario.FechaNac.ToShortDateString() %></b></p>
                    <p class="form-text">Email: <b><% = usuario.Contacto.Email %></b> </p>
                    <p class="form-text">Telefono: <b><% = usuario.Contacto.Telefono %></b></p>
                    <p class="form-text">Direccion: <b><% = usuario.Contacto.Direccion.Calle %> , <% = usuario.Contacto.Direccion.Numero %>. <% = usuario.Contacto.Direccion.Piso %> <% = usuario.Contacto.Direccion.Dpto %></b></p>
                    <p class="form-text">CP: <b><% = usuario.Contacto.Direccion.CP %></b></p>
                    <p class="form-text">Localidad: <b><% = usuario.Contacto.Direccion.Localidad.Nombre %></b></p>
                    <p class="form-text">Departamento: <b><% = usuario.Contacto.Direccion.Departamento.Nombre %></b></p>
                    <p class="form-text">Provincia: <b><% = usuario.Contacto.Direccion.Provincia.Nombre %></b> </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
