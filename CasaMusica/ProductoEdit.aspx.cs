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
    public partial class ProductoEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            try
            {
                if (!IsPostBack)
                {
                    dropDownMarcas.DataSource = marcaNegocio.Listar();
                    dropDownMarcas.SelectedIndex = -1;
                    dropDownMarcas.DataValueField = "ID";
                    dropDownMarcas.DataTextField = "Nombre";
                    dropDownMarcas.DataBind();

                    dropDownCategorias.DataSource = categoriaNegocio.Listar();
                    dropDownCategorias.SelectedIndex = -1;
                    dropDownCategorias.DataValueField = "ID";
                    dropDownCategorias.DataTextField = "Nombre";
                    dropDownCategorias.DataBind();
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();

            try
            {
                ProductoNegocio productoNegocio = new ProductoNegocio();
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

                producto.Codigo = txtBoxCodigo.Text;
                producto.Nombre = txtBoxNombre.Text;
                producto.Descripcion = txtBoxDescripcion.Text;
                producto.URLImagen = txtBoxImagen.Text;
                producto.Precio = Convert.ToDecimal(txtBoxPrecio.Text);
                producto.Stock = Convert.ToInt64(txtBoxStock.Text);
                producto.Marca = new Marca();
                producto.Marca = marcaNegocio.Listar().Find(m => m.ID.ToString() == dropDownMarcas.SelectedItem.Value.ToString());
                producto.Categoria = new Categoria();
                producto.Categoria = categoriaNegocio.Listar().Find(c => c.ID.ToString() == dropDownCategorias.SelectedItem.Value.ToString());
                producto.Eliminado = false;

                productoNegocio.Agregar(producto);

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}