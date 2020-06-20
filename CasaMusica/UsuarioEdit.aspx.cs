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
    public partial class UsuarioEdit : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
                DepartamentoNegocio departamentoNegocio = new DepartamentoNegocio();
                LocalidadNegocio localidadNegocio = new LocalidadNegocio();

                if (!IsPostBack)
                {
                    dropDownProv.DataSource = provinciaNegocio.Listar();
                    dropDownProv.DataValueField = "ID";
                    dropDownProv.DataTextField = "Nombre";
                    dropDownProv.SelectedIndex = -1;
                    dropDownProv.DataBind();
                    dropDownDpto.DataSource = departamentoNegocio.Listar();
                    dropDownDpto.DataValueField = "ID";
                    dropDownDpto.DataTextField = "Nombre";
                    dropDownDpto.SelectedIndex = -1;
                    dropDownDpto.DataBind();
                    dropDownLocal.DataSource = localidadNegocio.Listar();
                    dropDownLocal.DataValueField = "ID";
                    dropDownLocal.DataTextField = "Nombre";
                    dropDownDpto.SelectedIndex = -1;
                    dropDownLocal.DataBind();
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                if(usuario == null)
                {
                    usuario = new Usuario();
                }

                usuario.Eliminado = false;
                usuario.Tipo = 1;
                usuario.Apellido = txtBoxApellido.Text;
                usuario.Nombre = txtBoxNombre.Text;
                usuario.Dni = Convert.ToInt32(txtBoxDni.Text);
                usuario.FechaReg = DateTime.Now;
                usuario.FechaNac = Convert.ToDateTime(txtBoxFechaNac.Text);
                usuario.Clave = txtBoxPassword.Text;
                usuario.NombreUsuario = txtBoxUsuario.Text;
                usuario.Contacto.Email = txtBoxEmail.Text;
                usuario.Contacto.Telefono = Convert.ToInt32(txtBoxTelefono.Text);
                usuario.Contacto.Direccion.Calle = txtBoxDireccionCalle.Text;
                usuario.Contacto.Direccion.Numero = Convert.ToInt32(txtBoxDireccionNumero.Text);
                usuario.Contacto.Direccion.Piso = txtBoxDireccionPiso.Text;
                usuario.Contacto.Direccion.Dpto = txtBoxDireccionDpto.Text;
                usuario.Contacto.Direccion.Localidad.ID = Convert.ToInt32(dropDownLocal.SelectedValue);

                usuarioNegocio.AltaUsuario(usuario);

                Response.Redirect("ABM_Usuarios.aspx");

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}