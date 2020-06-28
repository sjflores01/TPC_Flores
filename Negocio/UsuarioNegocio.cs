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

                    usuario.Eliminado = datos.Lector.GetBoolean(17);

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
                        usuario.Contacto.Telefono = datos.Lector.GetString(12);
                        usuario.Contacto.Direccion.Localidad.ID = datos.Lector.GetInt32(13);
                        usuario.Contacto.Direccion.CP = datos.Lector.GetString(14);
                        usuario.Contacto.Direccion.Localidad.Nombre = datos.Lector.GetString(18);
                        usuario.Contacto.Direccion.Departamento.Nombre = datos.Lector.GetString(19);
                        usuario.Contacto.Direccion.Provincia.Nombre = datos.Lector.GetString(20);
                        usuario.FechaNac = datos.Lector.GetDateTime(15);
                        usuario.FechaReg = datos.Lector.GetDateTime(16);
                        usuario.IDFavorito = datos.Lector.GetInt64(21);
                        usuario.IDCarrito = datos.Lector.GetInt64(22);

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

        public Usuario ValidarUsuarioAdmin(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("SELECT * FROM VW_UsuariosAdmin");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    if (usuario.Contacto.Email == datos.Lector.GetString(1) &&
                        usuario.Clave == datos.Lector.GetString(2))
                    {
                        usuario.ID = datos.Lector.GetInt64(0);
                        usuario.NombreUsuario = datos.Lector.GetString(3);
                        usuario.Nombre = datos.Lector.GetString(4);
                        usuario.Apellido = datos.Lector.GetString(5);
                        usuario.Dni = datos.Lector.GetInt32(6);
                        usuario.Tipo = datos.Lector.GetInt32(7);
                        usuario.Contacto.Direccion.Calle = datos.Lector.GetString(8);
                        usuario.Contacto.Direccion.Numero = datos.Lector.GetInt32(9);
                        usuario.Contacto.Direccion.Piso = datos.Lector.GetString(10);
                        usuario.Contacto.Direccion.Dpto = datos.Lector.GetString(11);
                        usuario.Contacto.Telefono = datos.Lector.GetString(12);
                        usuario.Contacto.Direccion.Localidad.ID = datos.Lector.GetInt32(13);
                        usuario.Contacto.Direccion.CP = datos.Lector.GetString(14);
                        usuario.Contacto.Direccion.Localidad.Nombre = datos.Lector.GetString(18);
                        usuario.Contacto.Direccion.Departamento.Nombre = datos.Lector.GetString(19);
                        usuario.Contacto.Direccion.Provincia.Nombre = datos.Lector.GetString(20);
                        usuario.FechaNac = datos.Lector.GetDateTime(15);
                        usuario.FechaReg = datos.Lector.GetDateTime(16);
                    }
                }

                return usuario;
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

        public List<Usuario> ListarUltimos()
        {
            AccesoADatos datos = new AccesoADatos();
            List<Usuario> lista = new List<Usuario>();
            Usuario usuario;

            try
            {
                datos.SetearQuery("SELECT * FROM VW_UltimosUsuarios");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    usuario = new Usuario();

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
                    usuario.Contacto.Telefono = datos.Lector.GetString(12);
                    usuario.Contacto.Direccion.Localidad.ID = datos.Lector.GetInt32(13);
                    usuario.Contacto.Direccion.CP = datos.Lector.GetString(14);
                    usuario.Contacto.Direccion.Localidad.Nombre = datos.Lector.GetString(18);
                    usuario.Contacto.Direccion.Departamento.Nombre = datos.Lector.GetString(19);
                    usuario.Contacto.Direccion.Provincia.Nombre = datos.Lector.GetString(20);
                    usuario.FechaNac = datos.Lector.GetDateTime(15);
                    usuario.FechaReg = datos.Lector.GetDateTime(16);

                    lista.Add(usuario);
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
                datos.SetearParametro("@CP", usuario.Contacto.Direccion.CP);
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

        public void ModificarUsuario(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_ModificarUsuario");
                datos.SetearParametro("@ID", usuario.ID);
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
                datos.SetearParametro("@CP", usuario.Contacto.Direccion.CP);
                datos.SetearParametro("@FechaNac", usuario.FechaNac);
                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void BajaUsuario(long ID)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_BajaUsuario");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@ID", ID);
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

        public Usuario ValidarUsuario(Usuario usuario)
        {
            AccesoADatos datos = new AccesoADatos();
            Usuario result = new Usuario();

            try
            {
                datos.SetearSP("SP_ValidarUsuario");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@Email", usuario.Contacto.Email);
                datos.SetearParametro("@Clave", usuario.Clave);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    result.ID = datos.Lector.GetInt64(0);
                    result.Contacto.Email = datos.Lector.GetString(1);
                    result.Clave = datos.Lector.GetString(2);
                    result.NombreUsuario = datos.Lector.GetString(3);
                    result.Nombre = datos.Lector.GetString(4);
                    result.Apellido = datos.Lector.GetString(5);
                    result.Dni = datos.Lector.GetInt32(6);
                    result.Tipo = datos.Lector.GetInt32(7);
                    result.Contacto.Direccion.Calle = datos.Lector.GetString(8);
                    result.Contacto.Direccion.Numero = datos.Lector.GetInt32(9);
                    result.Contacto.Direccion.Piso = datos.Lector.GetString(10);
                    result.Contacto.Direccion.Dpto = datos.Lector.GetString(11);
                    result.Contacto.Telefono = datos.Lector.GetString(12);
                    result.Contacto.Direccion.Localidad.ID = datos.Lector.GetInt32(13);
                    result.Contacto.Direccion.CP = datos.Lector.GetString(14);
                    result.FechaNac = datos.Lector.GetDateTime(15);
                    result.FechaReg = datos.Lector.GetDateTime(16);
                    result.Contacto.Direccion.Departamento.ID = datos.Lector.GetInt32(18);
                    result.Contacto.Direccion.Provincia.ID = datos.Lector.GetInt32(19);
                    result.IDFavorito = datos.Lector.GetInt64(20);
                    result.IDCarrito = datos.Lector.GetInt64(21);

                }
                return result;
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
