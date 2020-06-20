using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            Usuario usuario;
            List<Usuario> lista = new List<Usuario>();

            try
            {
                datos.SetearQuery("SELECT * FROM VW_UsuariosAdmin");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    usuario = new Usuario();

                    usuario.Eliminado = datos.Lector.GetBoolean(16);

                    if (!usuario.Eliminado)
                    {
                        usuario.ID = datos.Lector.GetInt64(0);
                        usuario.Contacto.Email = datos.Lector.GetString(1);
                        usuario.Clave = datos.Lector.GetString(2);
                        usuario.NombreUsuario = datos.Lector.GetString(3);
                        usuario.Nombre = datos.Lector.GetString(4);
                        usuario.Apellido = datos.Lector.GetString(5);
                        usuario.Dni = datos.Lector.GetInt32(6);
                        usuario.Tipo = datos.Lector.GetInt32(7);
                        usuario.Contacto.Direccion.Calle = datos.Lector.GetString(8);
                        usuario.Contacto.Direccion.Numero = datos.Lector.GetInt32(9);
                        usuario.Contacto.Direccion.Piso = datos.Lector.GetString(10);
                        usuario.Contacto.Direccion.Dpto = datos.Lector.GetString(11);
                        usuario.Contacto.Telefono = datos.Lector.GetInt32(12);
                        usuario.Contacto.Direccion.Localidad.ID = datos.Lector.GetInt32(13);
                        usuario.Contacto.Direccion.Localidad.Nombre = datos.Lector.GetString(17);
                        usuario.Contacto.Direccion.Departamento.Nombre = datos.Lector.GetString(18);
                        usuario.Contacto.Direccion.Provincia.Nombre = datos.Lector.GetString(19);
                        usuario.FechaNac = datos.Lector.GetDateTime(14);
                        usuario.FechaReg = datos.Lector.GetDateTime(15);

                        lista.Add(usuario);
                    }

                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void AltaUsuario(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();
            try
            {
                datos.SetearSP("SP_AltaUsuario");
                datos.SetearParametro("@Email", usuario.Contacto.Email);
                datos.SetearParametro("@Clave", usuario.Clave);
                datos.SetearParametro("@NombreUsuario", usuario.NombreUsuario);
                datos.SetearParametro("@Nombres", usuario.Nombre);
                datos.SetearParametro("@Apellidos", usuario.Apellido);
                datos.SetearParametro("@Dni", usuario.Dni);
                datos.SetearParametro("@IDTipo", usuario.Tipo);
                datos.SetearParametro("@Calle", usuario.Contacto.Direccion.Calle);
                datos.SetearParametro("@Numero", usuario.Contacto.Direccion.Numero);
                datos.SetearParametro("@Piso", usuario.Contacto.Direccion.Piso);
                datos.SetearParametro("@Dpto", usuario.Contacto.Direccion.Dpto);
                datos.SetearParametro("@Telefono", usuario.Contacto.Telefono);
                datos.SetearParametro("@IDLocalidad", usuario.Contacto.Direccion.Localidad.ID);
                datos.SetearParametro("@FechaNac", usuario.FechaNac);
                datos.SetearParametro("@FechaReg", usuario.FechaReg);
                datos.SetearParametro("@Eliminado", usuario.Eliminado);
                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
    }
}
