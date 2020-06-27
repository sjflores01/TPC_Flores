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
    public partial class Carrito : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }
        public List<Producto> listaCarrito { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();

            usuario = (Usuario)Session["sesionUsuario"];

            listaCarrito = carritoUserNegocio.CargarListaCarrito(usuario.IDCarrito);
        }
    }
}