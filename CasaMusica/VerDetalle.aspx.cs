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
            if (usuario != null)
            {
                if (usuario.Tipo == 2)
                {
                    FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
                    favoritoNegocio.AgregarFavorito(usuario.IDFavorito, Convert.ToInt64(Request.QueryString["ID"]));
                    artFav = true;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void linkBtnElimFavorito_Click(object sender, EventArgs e)
        {
            try
            {
                if (usuario.Tipo == 2)
                {
                    FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
                    favoritoNegocio.BorrarFavorito(usuario.IDFavorito, Convert.ToInt64(Request.QueryString["ID"]));
                    artFav = false;
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void btnAgregarArticulo_Click(object sender, EventArgs e)
        {

            try
            {
                if (usuario != null)
                {
                    if (usuario.Tipo == 2)
                    {
                        CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();
                        if (carritoUserNegocio.BuscarProductoXCarrito(usuario.IDCarrito, producto.ID))
                        {
                            carritoUserNegocio.ModificarProductoXCarrito(usuario.IDCarrito, producto.ID, Convert.ToInt32(txtBoxCantidad.Text));
                        }
                        else
                        {
                            carritoUserNegocio.AgregarProductoCarrito(usuario.IDCarrito, producto.ID, Convert.ToInt32(txtBoxCantidad.Text));
                        }
                        Response.Redirect("DefaultUser.aspx");
                    }
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