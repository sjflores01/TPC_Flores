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
    public partial class VerDetalle : System.Web.UI.Page
    {
        public Producto producto { get; set; }
        public Usuario usuario { get; set; }
        public bool artFav { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            long idProducto = Convert.ToInt64(Request.QueryString["ID"]);

            try
            {
                usuario = (Usuario)Session["sesionUsuario"];
                producto = productoNegocio.Listar().Find(p => p.ID == idProducto);
                lblPrecio.Text = producto.Precio.ToString("F2");

                if (usuario != null)
                {
                    if (!IsPostBack)
                    {
                        artFav = favoritoNegocio.BuscarFavorito(usuario.IDFavorito, idProducto);
                    }

                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void linkBtnFavorito_Click(object sender, EventArgs e)
        {
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            favoritoNegocio.AgregarFavorito(usuario.IDFavorito, Convert.ToInt64(Request.QueryString["ID"]));
            artFav = true;
        }

        protected void linkBtnElimFavorito_Click(object sender, EventArgs e)
        {
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            favoritoNegocio.BorrarFavorito(usuario.IDFavorito, Convert.ToInt64(Request.QueryString["ID"]));
            artFav = false;
        }

        protected void btnAgregarArticulo_Click(object sender, EventArgs e)
        {
            CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();

            try
            {
                if (usuario != null)
                {
                    carritoUserNegocio.AgregarProductoCarrito(usuario.IDCarrito, Convert.ToInt64(Request.QueryString["ID"]), Convert.ToInt32(txtBoxCantidad.Text));
                    Response.Redirect("DefaultUser.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void txtBoxCantidad_TextChanged(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();

            if (!productoNegocio.ChequearStock(producto, Convert.ToInt32(txtBoxCantidad.Text)))
            {
                lblNoStock.Text = "No tenemos esa cantidad disponible para Vender";
                lblNoStock.Visible = true;
                txtBoxCantidad.Text = "";
            }
        }
    }
}