<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="CasaMusica.CrearUsuario" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="form-row mt-4">

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
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
        <div class="form-row">
                    <div class="form-group col-md-3">
                        <label>Provincia</label>
                        <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownProv" OnSelectedIndexChanged="dropDownProv_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                    <div class="form-group col-md-4">
                        <label>Departamento</label>
                        <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownDpto" OnSelectedIndexChanged="dropDownDpto_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                    <div class="form-group col-md-4">
                        <label>Localidad</label>
                        <asp:DropDownList CssClass="form-control" runat="server" ID="dropDownLocal" AutoPostBack="true" />
                    </div>
                    <div class="form-group col-md-1">
                        <label>CP</label>
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="CP" ID="txtBoxCP" />
                    </div>
        </div>
                </ContentTemplate>
            </asp:UpdatePanel>


        <asp:Button Text="Aceptar" ID="btnCrearUsuario" CssClass="btn btn-primary mt-4 mb-4" runat="server" OnClick="btnCrearUsuario_Click" />
        <asp:Button Text="Volver" ID="btnVolver" CssClass="btn btn-primary" runat="server" OnClick="btnVolver_Click" />


        <div class="modal fade" id="modalNuevoUsuario" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">
                                    <asp:Label ID="lblModalTitle" runat="server" Text="">Usuario Creado con exito!</asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblModalBody" runat="server" Text="">Que queres hacer?</asp:Label>
                            </div>
                            <div class="modal-footer">
                                <a href="DefaultUser.aspx" class="btn btn-info">Seguir Navegando</a>
                                <a href="Perfil.aspx" class="btn btn-info">Ver mi Perfil</a>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

    </div>
</asp:Content>
