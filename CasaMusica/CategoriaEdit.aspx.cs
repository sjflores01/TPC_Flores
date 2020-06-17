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
    public partial class CategoriaEdit : System.Web.UI.Page
    {
        public Categoria categoria { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            try
            {
                categoria = categoriaNegocio.Listar().Find(c => c.ID == Convert.ToInt32(Request.QueryString["ID"]));

                if (!IsPostBack)
                {
                    if (categoria != null)
                    {
                        txtBoxNombre.Text = categoria.Nombre;
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
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            try
            {
                if (categoria == null)
                {
                    categoria = new Categoria();
                }

                categoria.Nombre = txtBoxNombre.Text;

                if (categoria.ID != 0)
                {
                    categoriaNegocio.Modificar(categoria);
                }
                else
                {
                    categoriaNegocio.Agregar(categoria);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}