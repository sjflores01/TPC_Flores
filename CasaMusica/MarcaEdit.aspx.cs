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
    public partial class MarcaEdit : System.Web.UI.Page
    {
        public Marca marca { get; set; }
        public string imagenURL { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            marca = marcaNegocio.Listar().Find(m => m.ID == Convert.ToInt64(Request.QueryString["ID"]));

            if (!IsPostBack)
            {
                if (marca != null)
                {
                    txtBoxCodigo.Text = marca.Codigo;
                    txtBoxNombre.Text = marca.Nombre;
                    txtBoxImagen.Text = marca.URLImagen;
                }

            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            if (marca == null)
            {
                marca = new Marca();
            }

            marca.Codigo = txtBoxCodigo.Text;
            marca.Nombre = txtBoxNombre.Text;
            marca.URLImagen = txtBoxImagen.Text;

            if (marca.ID != 0)
            {
                marca.Codigo = txtBoxCodigo.Text;
                marca.Nombre = txtBoxNombre.Text;
                marca.URLImagen = txtBoxImagen.Text;

                marcaNegocio.Modificar(marca);
            }
            else
            {
                marcaNegocio.Agregar(marca);
            }

            Response.Redirect("ABM_Marcas.aspx");

        }

        protected void btnPreviewImg_Click(object sender, EventArgs e)
        {
            imagenURL = txtBoxImagen.Text;
        }

        protected void txtBoxCodigo_TextChanged(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            string codigo = txtBoxCodigo.Text.ToUpper();

            txtBoxCodigo.Text = codigo;

            if (marcaNegocio.BuscarCodigo(codigo))
            {
                lblCodigoExistente.Visible = true;
                lblCodigoExistente.Text = "El codigo ingresado ya está siendo utilizado.";
                txtBoxCodigo.Text = "";
            }
        }

        protected void txtBoxNombre_TextChanged(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            string nombre = txtBoxNombre.Text;

            if (marcaNegocio.BuscarCodigo(nombre))
            {
                lblNombreExistente.Visible = true;
                lblNombreExistente.Text = "Ya exuste una marca con este nombre.";
                txtBoxNombre.Text = "";
            }
        }
    }
}