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
    public partial class ABM_Usuarios : System.Web.UI.Page
    {
        public List<Usuario> listaUsuarios { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            try
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["ID"] != null)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalEliminar", "$('#modalEliminar').modal();", true);
                    }
                }

                listaUsuarios = usuarioNegocio.Listar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarioNegocio.BajaUsuario(Convert.ToInt64(Request.QueryString["ID"]));
            Response.Redirect("ABM_Usuarios.aspx");
        }
    }
}