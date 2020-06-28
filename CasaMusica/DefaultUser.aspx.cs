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
    public partial class DefaultUser : System.Web.UI.Page
    {
        public List<Producto> listaProductos { get; set; }
        public Usuario usuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["sesionUsuario"];
            ProductoNegocio productoNegocio = new ProductoNegocio();

            try
            {
                listaProductos = productoNegocio.Listar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}