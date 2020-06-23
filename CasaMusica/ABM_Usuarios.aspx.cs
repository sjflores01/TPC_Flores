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
                listaUsuarios = usuarioNegocio.Listar();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalBaja", "$('#modalBaja').modal();", true);
            upModal.Update();
        }
    }
}