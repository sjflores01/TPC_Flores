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
    public partial class CompraDetalle : System.Web.UI.Page
    {
        public Venta venta { get; set; }
        public List<Producto> listaProductos { get; set; }
        public Usuario usuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();
            CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            
            try
            {
                venta = ventaNegocio.Listar().Find(v => v.ID == Convert.ToInt64(Request.QueryString["ID"]));
                venta.Usuario = usuarioNegocio.ListarClientes().Find(u => u.ID == venta.Usuario.ID);
                venta.Carrito.Productos = carritoUserNegocio.CargarListaCarrito(venta.Carrito.ID);
                listaProductos = venta.Carrito.Productos;

            }
            catch (Exception)
            {

                Response.Redirect("Error.aspx");
            }
        }
    }
}