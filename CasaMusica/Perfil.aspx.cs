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
    public partial class Perfil : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }
        public List<Favorito> listadoFavoritos { get; set; }
        public List<Venta> listadoVentas { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
            VentaNegocio ventaNegocio = new VentaNegocio();

            try
            {
                usuario = (Usuario)Session["sesionUsuario"];

                if (usuario == null)
                {
                    Response.Redirect("Login.aspx");
                }

                listadoFavoritos = favoritoNegocio.Listar(usuario.IDFavorito);
                listadoVentas = ventaNegocio.Listar().FindAll(v => v.Usuario.ID == usuario.ID);


                txtBoxEmail.Text = usuario.Contacto.Email;
                txtBoxUsuario.Text = usuario.NombreUsuario;
                txtBoxDomicilio.Text = usuario.Contacto.Direccion.Calle + usuario.Contacto.Direccion.Numero;
                if (usuario.Contacto.Direccion.Piso != null)
                {
                    txtBoxDomicilio.Text += ", Piso: " + usuario.Contacto.Direccion.Piso;
                }
                if (usuario.Contacto.Direccion.Dpto != null)
                {
                    txtBoxDomicilio.Text += ". Dpto: " + usuario.Contacto.Direccion.Dpto;
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearUsuario.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["sesionUsuario"] = null;
            Response.Redirect("DefaultUser.aspx");
        }
    }
}