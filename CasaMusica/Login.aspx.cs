using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Negocio;

namespace CasaMusica
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                usuario.Contacto.Email = txtBoxEmail.Text;
                usuario.Clave = txtBoxPassword.Text;

                if (usuario.Contacto.Email.Contains("@musicapp"))
                {
                    usuario = usuarioNegocio.ValidarUsuarioAdmin(usuario);
                }
                else
                {
                    usuario = usuarioNegocio.ValidarUsuario(usuario);
                }

                if (usuario.ID != 0)
                {
                    Session.Add("sesionUsuario", usuario);

                    Response.Redirect("DefaultUser.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalErrorLogin", "$('#modalErrorLogin').modal();", true);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void chkBoxVerContraseña_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBoxVerContraseña.Checked == true)
            {
                txtBoxPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtBoxPassword.TextMode = TextBoxMode.Password;
            }
        }
    }
}