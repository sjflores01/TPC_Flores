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
    public partial class Compra : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }
        public Venta venta { get; set; }
        public List<Producto> listaProductos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();
            usuario = (Usuario)Session["sesionUsuario"];

            try
            {
                venta = new Venta();
                venta.Usuario.ID = usuario.ID;
                venta.Carrito.ID = usuario.IDCarrito;
                venta.Carrito.Productos = carritoUserNegocio.CargarListaCarrito(venta.Carrito.ID);
                listaProductos = venta.Carrito.Productos;
                venta.Importe = carritoUserNegocio.SumarImporte(venta.Carrito.Productos);
                venta.Fecha = DateTime.Now;

                lblPrecioFinal.Text = venta.Importe.ToString("F2");

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();
            ProductoNegocio productoNegocio = new ProductoNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            ventaNegocio.CargarVenta(venta);
            productoNegocio.ImpactoStock(venta.Carrito.Productos);

            usuario = usuarioNegocio.ValidarUsuario(usuario);
            Session["sesionUsuario"] = usuario;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalCompraExitosa", "$('#modalCompraExitosa').modal();", true);

        }
    }
}