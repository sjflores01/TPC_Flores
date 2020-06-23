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
    public partial class CrearUsuario : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                if (!IsPostBack)
                {
                    dropDownProv.DataSource = provinciaNegocio.Listar();
                    dropDownProv.DataValueField = "ID";
                    dropDownProv.DataTextField = "Nombre";
                    dropDownProv.DataBind();
                    dropDownProv.Items.Insert(0, new ListItem("", ""));

                    if (Session["sesionUsuario"] != null)
                    {
                        usuario = (Usuario)Session["sesionUsuario"];

                        txtBoxApellido.Text = usuario.Apellido;
                        txtBoxNombre.Text = usuario.Nombre;
                        txtBoxDni.Text = usuario.Dni.ToString();
                        txtBoxFechaNac.Text = usuario.FechaNac.ToString();
                        txtBoxEmail.Text = usuario.Contacto.Email;
                        txtBoxUsuario.Text = usuario.NombreUsuario;
                        txtBoxPassword.Text = usuario.Clave;
                        txtBoxDireccionCalle.Text = usuario.Contacto.Direccion.Calle;
                        txtBoxDireccionNumero.Text = usuario.Contacto.Direccion.Numero.ToString();
                        txtBoxDireccionPiso.Text = usuario.Contacto.Direccion.Piso;
                        txtBoxDireccionDpto.Text = usuario.Contacto.Direccion.Dpto;
                        txtBoxTelefono.Text = usuario.Contacto.Telefono.ToString();
                        txtBoxCP.Text = usuario.Contacto.Direccion.CP;
                        dropDownLocal.SelectedIndex = usuario.Contacto.Direccion.Localidad.ID - 1;
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            try
            {
                if (usuario == null)
                {
                    usuario = new Usuario();
                }

                usuario.Eliminado = false;
                usuario.Tipo = 2;
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
                usuario.Contacto.Direccion.CP = txtBoxCP.Text;

                if (usuario.ID != 0)
                {
                    usuarioNegocio.ModificarUsuario(usuario);
                    Session["sesionUsuario"] = usuario;
                    Response.Redirect("Perfil.aspx");
                }
                else
                {
                    usuarioNegocio.AltaUsuario(usuario);
                    Session.Add("sesionUsuario", usuario);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalNuevoUsuario", "$('#modalNuevoUsuario').modal();", true);
                    upModal.Update();
                }



            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {

        }

        protected void dropDownProv_SelectedIndexChanged(object sender, EventArgs e)
        {
            DepartamentoNegocio departamentoNegocio = new DepartamentoNegocio();

            try
            {
                if (dropDownProv.SelectedIndex != 0)
                {
                    dropDownDpto.DataSource = departamentoNegocio.FiltrarXProv(Convert.ToInt32(dropDownProv.SelectedValue));
                    dropDownDpto.DataValueField = "ID";
                    dropDownDpto.DataTextField = "Nombre";
                    dropDownDpto.DataBind();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void dropDownDpto_SelectedIndexChanged(object sender, EventArgs e)
        {
            LocalidadNegocio localidadNegocio = new LocalidadNegocio();

            try
            {
                if (dropDownDpto.SelectedIndex != 0)
                {
                    dropDownLocal.DataSource = localidadNegocio.FiltrarXDpto(Convert.ToInt32(dropDownDpto.SelectedValue));
                    dropDownLocal.DataValueField = "ID";
                    dropDownLocal.DataTextField = "Nombre";
                    dropDownLocal.DataBind();
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}