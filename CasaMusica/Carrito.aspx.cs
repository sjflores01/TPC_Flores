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

            try
            {
                if (usuario != null)
                {
                    lblBienvenida.Text += usuario.NombreUsuario + "!";
                    listaCarrito = carritoUserNegocio.CargarListaCarrito(usuario.IDCarrito);

                    if (listaCarrito.Count > 0)
                    {
                        lblCarritoVacio.Visible = false;
                        lblTextPrecio.Visible = true;
                        lblPrecioFinal.Visible = true;
                        btnFinalizar.Visible = true;

                        if(Request.QueryString["ElimID"] != null)
                        {
                            long IDProducto = Convert.ToInt64(Request.QueryString["ElimID"]);
                            carritoUserNegocio.EliminarItem(IDProducto, usuario.IDCarrito);
                            Response.Redirect("Carrito.aspx");
                        }

                        lblPrecioFinal.Text = carritoUserNegocio.SumarImporte(listaCarrito).ToString("F2");
                    }
                    else
                    {
                        lblCarritoVacio.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            if (listaCarrito != null)
            {
                Response.Redirect("Compra.aspx");
            }
        }

        protected void btnAceptarEliminar_Click(object sender, EventArgs e)
        {

        }

        //protected void linkBtnEliminarCarrito_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalEliminarCarrito", "$('#modalEliminarCarrito').modal();", true);
        //}
    }
}