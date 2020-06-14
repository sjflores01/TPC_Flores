<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="CasaMusica.CrearUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="form-row">

            <div class="form-group col">
                <label>Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Nombre" ID="txtBoxNombre" />
            </div>
            <div class="form-group col">
                <label>Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Apellido" ID="txtBoxApellido" />
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

            <div class="form-group col-md-4">
                <label>Provincia</label>
                <select class="form-control">
                    <option selected>Elegir</option>

                    <%--Crear lista con provincias--%>

                    <option>...</option>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label>Localidades</label>
                <select class="form-control">
                    <option selected>Elegir</option>

                    <%--Crear lista con provincias--%>

                    <option>...</option>
                </select>
            </div>
            <div class="form-group col-md-2">
                <label for="inputZip">CP</label>
                <asp:TextBox runat="server" CssClass="form-control" placeholder="Cod. Postal" ID="txtBoxCP" />  
            </div>

        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">
                    Check me out
                </label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Sign in</button>

    </div>
</asp:Content>
