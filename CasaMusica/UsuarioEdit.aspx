<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusica.Master" AutoEventWireup="true" CodeBehind="UsuarioEdit.aspx.cs" Inherits="CasaMusica.UsuarioEdit" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-row">
            <div class="form-group col-md-4">
                <label>Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Nombre" ID="txtBoxNombre" />
                <asp:RegularExpressionValidator ErrorMessage="No puede contener numeros!" ControlToValidate="txtBoxNombre" CssClass="alert alert-danger" runat="server" ValidationExpression="^[a-zA-Z ]*$" />
            </div>
            <div class="form-group col-md-4">
                <label>Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Apellido" ID="txtBoxApellido" />
                <asp:RegularExpressionValidator ErrorMessage="No puede contener numeros!" ControlToValidate="txtBoxApellido" CssClass="alert alert-danger" runat="server" ValidationExpression="^[a-zA-Z ]*$" />
            </div>
            <div class="form-group col-md-3">
                <label>DNI</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="DNI" ID="txtBoxDni" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxDni" Display="Dynamic" ErrorMessage="DNI invalido" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-3">
                <label>Fecha de Nacimiento</label>
                <asp:TextBox CssClass="form-control mb-3" runat="server" placeholder="DD/MM/AAAA" MaxLength="10" ID="txtBoxFechaNac" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxFechaNac" Display="Dynamic" ErrorMessage="DD/MM/AAAA" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label>Email</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Email" ID="txtBoxEmail" />
                <small class="form-text text-muted">Usa un correo válido. Se utilizará para iniciar sesión.</small>
                <asp:RegularExpressionValidator ErrorMessage="Ingrese un Email valido!" ControlToValidate="txtBoxEmail" CssClass="alert alert-danger mt-4" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                <div class="row">
                    <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblEmailExistente" runat="server" />
                </div>
            </div>
            <div class="form-group col-md-4">
                <label>Nombre de Usuario</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Usuario" ID="txtBoxUsuario" MaxLength="20" />
                <div class="row">
                    <asp:Label Text="" Visible="false" CssClass="alert alert-danger ml-1 mt-1" ID="lblUsuarioExistente" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Usuario Invalido!" ControlToValidate="txtBoxUsuario" CssClass="alert alert-danger" runat="server" ValidationExpression="^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$" />
                </div>
            </div>
            <div class="form-group col-md-3">
                <label>Contraseña</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Contraseña" ID="txtBoxPassword" TextMode="Password" />
                <small class="form-text text-muted">Debe tener entre 4-8 letras o numeros.</small>
                <asp:RegularExpressionValidator ErrorMessage="Entre 4-8, letras o numeros!" ControlToValidate="txtBoxPassword" CssClass="alert alert-danger" runat="server" ValidationExpression="^(?=.*\d).{4,8}$" />
                <div class="form-check mb-3">
                    <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkBoxVerContraseña" OnCheckedChanged="chkBoxVerContraseña_CheckedChanged" AutoPostBack="true" />
                    <asp:Label Text="Ver Contraseña" CssClass="form-check-label" runat="server" />
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label>Calle</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Calle" ID="txtBoxDireccionCalle" />
                <asp:RegularExpressionValidator ErrorMessage="Sin caracteres especiales!" ControlToValidate="txtBoxDireccionCalle" CssClass="alert alert-danger mt-4" runat="server" ValidationExpression="[0-9a-zA-Z #,-]+" />
            </div>
            <div class="form-group col-md-2">
                <label>Numero</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Numero" ID="txtBoxDireccionNumero" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxDireccionNumero" Display="Dynamic" ErrorMessage="Nro incorrecto" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group col-md-1">
                <label>Piso</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Piso" ID="txtBoxDireccionPiso" />
                <asp:RegularExpressionValidator ErrorMessage="Sin caracteres especiales!" ControlToValidate="txtBoxDireccionPiso" CssClass="alert alert-danger mt-4" runat="server" ValidationExpression="[0-9a-zA-Z #,-]+" />
            </div>
            <div class="form-group col-md-1">
                <label>Dpto.</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Dpto" ID="txtBoxDireccionDpto" />
                <asp:RegularExpressionValidator ErrorMessage="Sin caracteres especiales!" ControlToValidate="txtBoxDireccionDpto" CssClass="alert alert-danger mt-4" runat="server" ValidationExpression="[0-9a-zA-Z #,-]+" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-4">
                <label>Telefono</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Telefono" ID="txtBoxTelefono" />
                <asp:RegularExpressionValidator ErrorMessage="No puede contener + - _ * /" ControlToValidate="txtBoxTelefono" CssClass="alert alert-danger" runat="server" ValidationExpression="^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$" />
            </div>
            <div class="form-group col-md-2">
                <label>CP</label>
                <asp:TextBox runat="server" CssClass="form-control mb-3" placeholder="Cod. Postal" ID="txtBoxCP" />
                <asp:RegularExpressionValidator runat="server" CssClass="alert alert-danger" ControlToValidate="txtBoxCP" Display="Dynamic" ErrorMessage="Solo num." ValidationExpression="\d+"></asp:RegularExpressionValidator>
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
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="form-row">
            <div class="col offset-9">
                <asp:Button CssClass="btn btn-secondary mb-5" Text="Aceptar" runat="server" ID="btnAceptar" OnClick="btnAceptar_Click" />
                <a href="ABM_Usuarios.aspx" class="btn btn-secondary ml-1 mb-5">Volver</a>
            </div>
        </div>
    </div>

    <%--MODALS--%>
    <div class="modal fade" id="modalNuevoUsuario" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <asp:Label ID="Label1" runat="server" Text="">Alta Usuario Admin</asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label2" runat="server" Text="">Alta Exitosa</asp:Label>
                        </div>
                        <div class="modal-footer">
                            <a href="ABM_Usuarios.aspx" class="btn btn-info">Volver</a>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="modalErrorForm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text="">Error!</asp:Label>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" runat="server" Text="">Debés completar todos los campos antes de continuar.</asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cerrar</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
