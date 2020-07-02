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
    public partial class Ventas : System.Web.UI.Page
    {
        public List<Venta> listadoVentas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();

            listadoVentas = ventaNegocio.Listar();
        }
    }
}