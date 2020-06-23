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
    public partial class CasaMusicaCliente : System.Web.UI.MasterPage
    {
        public Usuario usuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["sesionUsuario"];

            if (usuario != null)
            {
                btnLogin.Visible = false;
                btnPerfil.Visible = true;

                if(usuario.Tipo == 1)
                {
                    btnAdminView.Visible = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx");
        }

        protected void btnAdminView_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}