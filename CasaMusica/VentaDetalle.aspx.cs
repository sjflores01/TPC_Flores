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
    public partial class VentaDetalle : System.Web.UI.Page
    {
        public Venta venta { get; set; }
        public List<Producto> listaProductos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();
            CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            EstadoNegocio estadoNegocio = new EstadoNegocio();

            try
            {
                venta = ventaNegocio.Listar().Find(v => v.ID == Convert.ToInt64(Request.QueryString["ID"]));
                venta.Usuario = usuarioNegocio.ListarClientes().Find(u => u.ID == venta.Usuario.ID);
                venta.Carrito.Productos = carritoUserNegocio.CargarListaCarrito(venta.Carrito.ID);
                listaProductos = venta.Carrito.Productos;
                if (!IsPostBack)
                {
                    dropDownEstado.DataSource = estadoNegocio.Listar();
                    dropDownEstado.DataValueField = "ID";
                    dropDownEstado.DataTextField = "Nombre";
                    dropDownEstado.SelectedIndex = venta.Estado.ID - 1;
                    dropDownEstado.DataBind();
                }

            }
            catch (Exception ex)
            {

                Response.Redirect("Error.aspx");
            }
        }

        protected void btnActualizarEstado_Click(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();

            try
            {
                ventaNegocio.ActualizarEstado(venta.ID, Convert.ToInt32(dropDownEstado.SelectedValue));
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalActualizacion", "$('#modalActualizacion').modal();", true);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}