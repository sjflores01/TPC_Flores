﻿using System;
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
        public string imagenURL { get; set; }

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

                    dropDownMarcas.DataSource = marcaNegocio.Listar();
                    dropDownMarcas.SelectedIndex = -1;
                    dropDownMarcas.DataValueField = "ID";
                    dropDownMarcas.DataTextField = "Nombre";
                    dropDownMarcas.Items.Insert(0, new ListItem("", ""));
                    dropDownMarcas.DataBind();

                    dropDownCategorias.DataSource = categoriaNegocio.Listar();
                    dropDownCategorias.SelectedIndex = -1;
                    dropDownCategorias.DataValueField = "ID";
                    dropDownCategorias.DataTextField = "Nombre";
                    dropDownCategorias.Items.Insert(0, new ListItem("", ""));
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
                    producto.Marca = marcaNegocio.Listar().Find(m => m.ID == Convert.ToInt64(dropDownMarcas.SelectedItem.Value));
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
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalErrorForm", "$('#modalErrorForm').modal();", true);
            }
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

        protected void txtBoxNombre_TextChanged(object sender, EventArgs e)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            string nombre = txtBoxNombre.Text;

            if (productoNegocio.BucarNombre(nombre))
            {
                lblNombreExistente.Visible = true;
                lblNombreExistente.Text = "Ya hay un articulo con este nombre.";
                txtBoxNombre.Text = "";
            }
        }

        protected void btnPreviewImg_Click(object sender, EventArgs e)
        {
            imagenURL = txtBoxImagen.Text;
        }

        public bool ValidarForm()
        {
            if (IsPostBack)
            {
                if (txtBoxCodigo.Text == "")
                {
                    return false;
                }
                if (txtBoxNombre.Text == "")
                {
                    return false;
                }
                if (txtBoxDescripcion.Text == "")
                {
                    return false;
                }
                if (txtBoxImagen.Text == "")
                {
                    return false;
                }
                if (dropDownMarcas.SelectedItem == null)
                {
                    return false;
                }
                if (dropDownCategorias.SelectedItem == null)
                {
                    return false;
                }
                if (txtBoxStock.Text == "")
                {
                    return false;
                }
                if (txtBoxPrecio.Text == "")
                {
                    return false;
                }
            }

            return true;
        }
        
    }
}