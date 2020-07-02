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
    public partial class ClienteDetalle : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                usuario = usuarioNegocio.ListarClientes().Find(u => u.ID == Convert.ToInt64(Request.QueryString["ID"]));
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx");
            }
        }
    }
}