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
    public partial class ABM_Productos : System.Web.UI.Page
    {
        public List<Producto> listaProductos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            try
            {
                if(Request.QueryString["ID"] != null && Request.QueryString["ID"] != "")
                {
                    productoNegocio.Baja(Request.QueryString["ID"]);
                }
                listaProductos = productoNegocio.Listar();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}