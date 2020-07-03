<%@ Page Title="" Language="C#" MasterPageFile="~/CasaMusicaCliente.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="CasaMusica.Contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function ValidarFormContacto() {
            var nombre = $("#txtBoxNombre").value;
            var email = $("#txtBoxEmail").value;
            var mensaje = $('#txtBoxMensaje').value;
            var result = true;

            if (nombre === undefined) {
                $("#txtBoxNombre").addClass("is-invalid");
                result = false;
            }
            if (email === "") {
                $("#txtBoxEmail").addClass("is-invalid");
                result = false;
            }
            if (mensaje === "") {
                $("#txtBoxMensaje").addClass("is-invalid");
                result = false;
            }

            return result;
        }
    </script>
    <div class="container">
        <div class="row">
            <div class="col col-md-6">
                <div class="form-group">
                    <h5 class="display-2 mb-5">Contactanos!!</h5>
                </div>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col col-md-6">
                <div class="form-group">
                    <asp:Label Text="Direccion: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                    <asp:Label Text="Email: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                    <asp:Label Text="Telefono: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                    <asp:Label Text="Horarios de Atencion: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <h6 class="display-4">O podes dejarnos tu comentario o consulta:</h6>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col col-md-6">
                <div class="form-group">
                    <asp:Label Text="Nombre: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtBoxNombre" runat="server" />
                    <asp:Label Text="Email: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtBoxEmail" runat="server" />
                    <asp:Label Text="Mensaje: " CssClass="form-text" Font-Size="X-Large" runat="server" />
                    <asp:TextBox CssClass="form-control" ID="txtBoxMensaje" TextMode="MultiLine" runat="server" />
                </div>
                <asp:Button Text="Enviar" CssClass="btn btn-secondary" runat="server" OnClientClick="return ValidarFormContacto()" />
            </div>
        </div>
    </div>
</asp:Content>
