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
            string filtro = Request.QueryString["list"];

            try
            {
                if (!IsPostBack)
                {
                    if (filtro == null)
                    {
                        listaProductos = productoNegocio.Listar();
                    }
                    else
                    {
                        listaProductos = productoNegocio.Listar().FindAll(l => l.Categoria.Nombre == filtro);
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();

            listaProductos = productoNegocio.Listar().FindAll(p => p.Nombre.ToLower().Contains(txtBoxBuscar.Text.ToLower()));
        }
    }
}