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
    public partial class Perfil : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }
        public List<Favorito> listadoFavoritos { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                usuario = (Usuario)Session["sesionUsuario"];

                if (usuario == null)
                {
                    Response.Redirect("Login.aspx");
                }

                FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
                listadoFavoritos = favoritoNegocio.Listar(usuario.IDFavorito);


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
    }
}