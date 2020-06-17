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
    public partial class ABM_Categorias : System.Web.UI.Page
    {
        public List<Categoria> listadoCategorias { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            try
            {
                if (Request.QueryString["ID"] != null && Request.QueryString["ID"] != "")
                {
                    categoriaNegocio.Baja(Request.QueryString["ID"]);
                }

                listadoCategorias = categoriaNegocio.Listar();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}