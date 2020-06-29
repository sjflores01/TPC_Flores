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
        public Producto producto { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            ProductoNegocio productoNegocio = new ProductoNegocio();

            producto = productoNegocio.Listar().Find(p => p.ID == Convert.ToInt64(Request.QueryString["ID"]));

            try
            {
                if (!IsPostBack)
                {
                    lblCodigoRequerido.Visible = false;

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

                    if (producto != null)
                    {
                        txtBoxCodigo.Text = producto.Codigo;
                        txtBoxNombre.Text = producto.Nombre;
                        txtBoxDescripcion.Text = producto.Descripcion;
                        txtBoxImagen.Text = producto.URLImagen;
                        txtBoxPrecio.Text = producto.Precio.ToString("F2");
                        txtBoxStock.Text = producto.Stock.ToString();
                        dropDownMarcas.SelectedIndex = Convert.ToInt32(producto.Marca.ID) - 1;
                        dropDownCategorias.SelectedIndex = (producto.Categoria.ID) - 1;
                    }
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ValidarForm())
            {
                try
                {
                    ProductoNegocio productoNegocio = new ProductoNegocio();
                    MarcaNegocio marcaNegocio = new MarcaNegocio();
                    CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

                    if (producto == null)
                    {
                        producto = new Producto();
                    }

                    producto.Codigo = txtBoxCodigo.Text;
                    producto.Nombre = txtBoxNombre.Text;
                    producto.Descripcion = txtBoxDescripcion.Text;
                    producto.URLImagen = txtBoxImagen.Text;
                    producto.Precio = Convert.ToDecimal(txtBoxPrecio.Text);
                    producto.Stock = Convert.ToInt64(txtBoxStock.Text);
                    producto.Marca = new Marca();
                    producto.Marca = marcaNegocio.Listar().Find(m => m.ID == Convert.ToInt64(dropDownMarcas.SelectedItem.Value));
                    producto.Categoria = new Categoria();
                    producto.Categoria = categoriaNegocio.Listar().Find(c => c.ID == Convert.ToInt64(dropDownCategorias.SelectedItem.Value));
                    producto.Eliminado = false;


                    if (producto.ID != 0)
                    {
                        productoNegocio.Modificar(producto);
                    }
                    else
                    {
                        productoNegocio.Agregar(producto);
                    }

                    Response.Redirect("ABM_Productos.aspx");
                }
                catch (Exception ex)
                {

                    throw ex;
                }

            }

        }

        public bool ValidarForm()
        {
            bool result = false;

            if (txtBoxCodigo.Text == "")
            {
                lblCodigoRequerido.Visible = true;
            }
            else
            {
                lblCodigoRequerido.Visible = false;
                result = true;
            }

            return result;
        }

        protected void txtBoxCodigo_TextChanged(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            string codigo = txtBoxCodigo.Text.ToUpper();

            txtBoxCodigo.Text = codigo;

            if (productoNegocio.BuscarCodigo(codigo))
            {
                lblCodigoExistente.Visible = true;
                lblCodigoExistente.Text = "El codigo ingresado ya está siendo utilizado.";
                txtBoxCodigo.Text = "";
            }
        }
    }
}