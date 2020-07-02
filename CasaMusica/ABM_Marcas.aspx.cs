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
    public partial class ABM_Marcas : System.Web.UI.Page
    {
        public List<Marca> listadoMarcas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalEliminar", "$('#modalEliminar').modal();", true);
                }
            }

            listadoMarcas = marcaNegocio.Listar();
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            marcaNegocio.Baja(Request.QueryString["ID"]);
            Response.Redirect("ABM_Marcas.aspx");
        }
    }
}