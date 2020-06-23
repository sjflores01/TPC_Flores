<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CasaMusica.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-4">
            <div class="col-4 offset-4">
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox runat="server" ID="txtBoxEmail" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtBoxPassword" TextMode="Password" />
                </div>
                    <div class="form-check mb-3">
                        <asp:CheckBox CssClass="form-check-input" runat="server" ID="chkBoxVerContraseña" OnCheckedChanged="chkBoxVerContraseña_CheckedChanged" />
                        <asp:Label Text="Ver Contraseña" CssClass="form-check-label" runat="server" />
                    </div>
                <asp:Button Text="Iniciar Sesion" ID="btnIniciarSesion" CssClass="btn btn-primary" runat="server" OnClick="btnIniciarSesion_Click" />
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
    <div class="modal fade" id="modalErrorLogin" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                <asp:Label ID="lblModalBody" runat="server" Text="">Que queres hacer?</asp:Label>
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
