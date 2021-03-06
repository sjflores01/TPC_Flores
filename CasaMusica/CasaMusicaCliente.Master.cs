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
    public partial class CasaMusicaCliente : System.Web.UI.MasterPage
    {
        public Usuario usuario { get; set; }
        public List<Producto> listaCarrito { get; set; }
        public List<Categoria> listaCategoria { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (Usuario)Session["sesionUsuario"];
            CarritoUserNegocio carritoUserNegocio = new CarritoUserNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            try
            {
                listaCategoria = categoriaNegocio.Listar();
                if (usuario != null)
                {
                    btnLogin.Visible = false;

                    if (usuario.Tipo == 1)
                    {
                        btnAdminView.Visible = true;
                    }
                    else
                    {
                        btnPerfil.Visible = true;
                        listaCarrito = carritoUserNegocio.CargarListaCarrito(usuario.IDCarrito);
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx");
        }

        protected void btnAdminView_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}