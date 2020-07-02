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
    public partial class CasaMusica : System.Web.UI.MasterPage
    {
        public Usuario usuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["sesionUsuario"];

            if (usuario.Tipo != 1)
            {
                Response.Redirect("Error.aspx");
            }
        }

    }
}