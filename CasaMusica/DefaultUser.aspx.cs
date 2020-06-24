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
            try
            {
                usuario = (Usuario)Session["sesionUsuario"];
                ProductoNegocio productoNegocio = new ProductoNegocio();
                listaProductos = productoNegocio.Listar();

                if (Request.QueryString["ID"] != null)
                {
                    if (usuario != null)
                    {
                            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
                            favoritoNegocio.AgregarFavorito(usuario.ID, Convert.ToInt64(Request.QueryString["ID"]));
                            Response.Redirect("DefaultUser.aspx");
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}