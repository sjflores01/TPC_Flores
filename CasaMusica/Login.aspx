<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CasaMusica.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-4">
            <div class="col-4 offset-4">
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtBoxPassword" TextMode="Password" />
                </div>
                    <div class="form-check mb-3">
                        <asp:CheckBox Text="" CssClass="form-check-input" runat="server" ID="chkBoxVerContraseña" />
                        <asp:Label Text="Ver Contraseña" CssClass="form-check-label" runat="server" />
                    </div>
                <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
                <div class="form-group">
                    <div class="row mt-2">
                        <div class="col">
                            <a href="CrearUsuario.aspx" class="">No tengo Cuenta</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
