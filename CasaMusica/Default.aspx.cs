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
    public partial class Default : System.Web.UI.Page
    {
        public List<Usuario> listaUltimosUsuarios { get; set; }
        public List<Venta> listaUltimasVentas { get; set; }
        public List<Producto> listaMasVendidos { get; set; }
        public List<Producto> listaMasLikeados { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                    VentaNegocio ventaNegocio = new VentaNegocio();
                    ProductoNegocio productoNegocio = new ProductoNegocio();

                    listaUltimosUsuarios = usuarioNegocio.ListarUltimos();
                    listaUltimasVentas = ventaNegocio.ListarUltimas();
                    listaMasVendidos = productoNegocio.ListarMasVendidos();
                    listaMasLikeados = productoNegocio.ListarMasLikeados();
                }
                catch (Exception ex)
                {

                    throw ex;
                }

            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["sesionUsuario"] = null;
            Response.Redirect("DefaultUser.aspx");
        }
    }
}