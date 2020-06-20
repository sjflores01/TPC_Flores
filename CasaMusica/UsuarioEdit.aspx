<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="UsuarioEdit.aspx.cs" Inherits="CasaMusica.UsuarioEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="form-row">

            <div class="form-group col-md-4">
                <label>Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Nombre" ID="txtBoxNombre" />
            </div>
            <div class="form-group col-md-4">
                <label>Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Apellido" ID="txtBoxApellido" />
            </div>
            <div class="form-group col-md-3">
                <label>DNI</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="DNI" ID="txtBoxDni" />
            </div>

        </div>
        <div class="form-row">

            <div class="form-group col-md-3">
                <label>Fecha de Nacimiento</label>
                <asp:TextBox CssClass="form-control" runat="server" placeholder="DD/MM/AAAA" MaxLength="10" ID="txtBoxFechaNac" />
            </div>

        </div>
        <div class="form-row">

            <div class="form-group col-md-4">
                <label>Email</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Email" ID="txtBoxEmail" />
                <small class="form-text text-muted">Usa un correo válido. Se utilizará para iniciar sesión.</small>
            </div>
            <div class="form-group col-md-4">
                <label>Nombre de Usuario</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Usuario" ID="txtBoxUsuario" />
            </div>
            <div class="form-group col-md-3">
                <label>Contraseña</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Contraseña" ID="txtBoxPassword" TextMode="Password" />
                <small class="form-text text-muted">La contraseña no puede contener caracteres especiales, y debe tener un máximo de 8 letras o numeros.</small>
            </div>

        </div>
        <div class="form-row">

            <div class="form-group col-md-4">
                <label>Calle</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Calle" ID="txtBoxDireccionCalle" />
            </div>
            <div class="form-group col-md-2">
                <label>Numero</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Numero" ID="txtBoxDireccionNumero" />
            </div>
            <div class="form-group col-md-1">
                <label>Piso</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Piso" ID="txtBoxDireccionPiso" />
            </div>
            <div class="form-group col-md-1">
                <label>Dpto.</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Dpto" ID="txtBoxDireccionDpto" />
            </div>

        </div>
        <div class="form-row">

            <div class="form-group col-md-4">
                <label>Telefono</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Telefono" ID="txtBoxTelefono" />
            </div>

        </div>
        <div class="form-row">

            <div class="form-group col-md-3">
                <label>Provincia</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownProv" />
            </div>
            <div class="form-group col-md-4">
                <label>Departamento</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownDpto" />
            </div>
            <div class="form-group col-md-4">
                <label>Localidad</label>
                <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownLocal" />
            </div>
            <div class="form-group col-md-1">
                <label>CP</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Cod. Postal" ID="txtBoxCP" />
            </div>

        </div>
        <div class="form-row">

            <div class="col offset-10">
                <asp:Button CssClass="btn btn-primary" Text="Aceptar" runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" />
            </div>

        </div>

    </div>
</asp:Content>
