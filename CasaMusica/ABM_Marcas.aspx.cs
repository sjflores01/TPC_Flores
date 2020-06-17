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

            if(Request.QueryString["ID"] != null && Request.QueryString["ID"] != "")
            {
                marcaNegocio.Baja(Request.QueryString["ID"]);
            }

            listadoMarcas = marcaNegocio.Listar();
        }
    }
}