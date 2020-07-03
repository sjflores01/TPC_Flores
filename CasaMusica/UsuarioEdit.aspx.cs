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
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

                usuario = usuarioNegocio.Listar().Find(u => u.ID == Convert.ToInt64(Request.QueryString["ID"]));

                if (!IsPostBack)
                {
                    dropDownProv.DataSource = provinciaNegocio.Listar();
                    dropDownProv.DataValueField = "ID";
                    dropDownProv.DataTextField = "Nombre";
                    dropDownProv.DataBind();
                    dropDownProv.Items.Insert(0, new ListItem("", ""));

                    if (usuario != null)
                    {
                        txtBoxApellido.Text = usuario.Apellido;
                        txtBoxNombre.Text = usuario.Nombre;
                        txtBoxDni.Text = usuario.Dni.ToString();
                        txtBoxFechaNac.Text = usuario.FechaNac.ToShortDateString();
                        txtBoxEmail.Text = usuario.Contacto.Email;
                        txtBoxUsuario.Text = usuario.NombreUsuario;
                        txtBoxPassword.Text = usuario.Clave;
                        txtBoxDireccionCalle.Text = usuario.Contacto.Direccion.Calle;
                        txtBoxDireccionNumero.Text = usuario.Contacto.Direccion.Numero.ToString();
                        txtBoxDireccionPiso.Text = usuario.Contacto.Direccion.Piso;
                        txtBoxDireccionDpto.Text = usuario.Contacto.Direccion.Dpto;
                        txtBoxTelefono.Text = usuario.Contacto.Telefono.ToString();
                        txtBoxCP.Text = usuario.Contacto.Direccion.CP;
                        //dropDownProv.SelectedIndex = dropDownProv.Items.IndexOf(dropDownProv.Items.FindByValue(usuario.Contacto.Direccion.Provincia.ID.ToString()));
                        //dropDownDpto.SelectedIndex = dropDownProv.Items.IndexOf(dropDownProv.Items.FindByValue(usuario.Contacto.Direccion.Departamento.ID.ToString()));
                        //dropDownLocal.SelectedIndex = dropDownProv.Items.IndexOf(dropDownProv.Items.FindByValue(usuario.Contacto.Direccion.Localidad.ID.ToString()));

                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (ValidarForm())
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

                try
                {
                    if (usuario == null)
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
                    usuario.Contacto.Telefono = txtBoxTelefono.Text;
                    usuario.Contacto.Direccion.Calle = txtBoxDireccionCalle.Text;
                    usuario.Contacto.Direccion.Numero = Convert.ToInt32(txtBoxDireccionNumero.Text);
                    usuario.Contacto.Direccion.Piso = txtBoxDireccionPiso.Text;
                    usuario.Contacto.Direccion.Dpto = txtBoxDireccionDpto.Text;
                    usuario.Contacto.Direccion.Localidad.ID = Convert.ToInt32(dropDownLocal.SelectedValue);
                    usuario.Contacto.Direccion.CP = txtBoxCP.Text;

                    if (usuario.ID != 0)
                    {
                        usuarioNegocio.ModificarUsuario(usuario);
                    }
                    else
                    {
                        if (usuarioNegocio.BuscarEmail(txtBoxEmail.Text))
                        {
                            lblEmailExistente.Visible = true;
                            lblEmailExistente.Text = "Email existente en BBDD, por favor ingresá otro.";
                            txtBoxEmail.Text = "";

                        }
                        else if (usuarioNegocio.BuscarUsuario(txtBoxUsuario.Text))
                        {
                            lblUsuarioExistente.Visible = true;
                            lblUsuarioExistente.Text = "El Usuario esta tomado, por favor ingresá otro.";
                            txtBoxUsuario.Text = "";
                        }
                        else
                        {
                            usuarioNegocio.AltaUsuario(usuario);

                        }
                    }

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalNuevoUsuario", "$('#modalNuevoUsuario').modal();", true);

                }
                catch (Exception ex)
                {

                    throw ex;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalErrorForm", "$('#modalErrorForm').modal();", true);
            }
            
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
                    dropDownDpto.Items.Insert(0, new ListItem("", ""));
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
                    dropDownLocal.Items.Insert(0, new ListItem("", ""));
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void chkBoxVerContraseña_CheckedChanged(object sender, EventArgs e)
        {
            if (chkBoxVerContraseña.Checked)
            {
                txtBoxPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtBoxPassword.TextMode = TextBoxMode.Password;
            }
        }

        public bool ValidarForm()
        {
            if (IsPostBack)
            {
                if (txtBoxApellido.Text == "")
                {
                    return false;
                }
                if (txtBoxNombre.Text == "")
                {
                    return false;
                }
                if (txtBoxUsuario.Text == "")
                {
                    return false;
                }
                if (txtBoxEmail.Text == "")
                {
                    return false;
                }
                if (txtBoxPassword.Text == "")
                {
                    return false;
                }
                if (txtBoxCP.Text == "")
                {
                    return false;
                }
                if (txtBoxDireccionCalle.Text == "")
                {
                    return false;
                }
                if (txtBoxDireccionNumero.Text == "")
                {
                    return false;
                }
                if (txtBoxPassword.Text == "")
                {
                    return false;
                }
                if (dropDownProv.SelectedItem == null)
                {
                    return false;
                }
                if (dropDownDpto.SelectedItem == null)
                {
                    return false;
                }
                if (dropDownLocal.SelectedItem == null)
                {
                    return false;
                }
                if (txtBoxTelefono.Text == "")
                {
                    return false;
                }
                if (txtBoxFechaNac.Text == "")
                {
                    return false;
                }
            }

            return true;
        }
    }
}