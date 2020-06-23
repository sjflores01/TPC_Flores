<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="CasaMusica.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">

            <div class="col col-md-6">
            <h4 class="display-4">Mis Deseados</h4>
            </div>
            <div class="col col-md-6">
                <h4 class="display-4">Datos de Contacto</h4>
            </div>

        </div>
        <div class="row">

            <div class="col col-md-6">
                <table class="table table-sm">
                    <thead>
                        <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">$</th>
                            <th scope="col">Ver</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--Cargar Lista Favoritos--%>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td><a href="#" class="btn btn-dark">Ver Detalle</a></td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="col col-md-6">
                <div class="form-row">
                    <div class="form-group col">
                        <label>Email</label>
                        <asp:TextBox Text="" ID="txtBoxEmail" CssClass="form-control" Enabled="false" runat="server" />
                        <label>Usuario</label>
                        <asp:TextBox Text="" ID="txtBoxUsuario" CssClass="form-control" Enabled="false" runat="server" />
                        <label>Domicilio de Entrega</label>
                        <asp:TextBox Text="" ID="txtBoxDomicilio" CssClass="form-control" Enabled="false" runat="server" />
                        <asp:Button Text="Editar" ID="btnEditar" CssClass="btn btn-dark" runat="server" OnClick="btnEditar_Click" />
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col offset-10">
                <a href="DefaultUser.aspx" class="btn btn-primary">Ir al Home</a>
            </div>
        </div>
    </div>
</asp:Content>
