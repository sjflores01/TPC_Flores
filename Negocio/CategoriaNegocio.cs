using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using Negocio;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
            List<Categoria> lista = new List<Categoria>();
            Categoria categoria;
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("SELECT * FROM Categorias");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    categoria = new Categoria();
                    
                    categoria.Eliminado = datos.Lector.GetBoolean(2);
                    if (!categoria.Eliminado)
                    {
                        categoria.ID = datos.Lector.GetInt32(0);
                        categoria.Nombre = datos.Lector.GetString(1);

                        lista.Add(categoria);
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

        public void Agregar(Categoria categoria)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_AltaCategoria");
                datos.SetearParametro("@Nombre", categoria.Nombre);
                datos.SetearParametro("@Eliminado", categoria.Eliminado);

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

        public void Modificar(Categoria categoria)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_ModifCategoria");
                datos.SetearParametro("@ID", categoria.ID);
                datos.SetearParametro("@Nombre", categoria.Nombre);

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

        public bool BuscarNombre(string nombre)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("SELECT * FROM Categorias WHERE Eliminado = 0");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    if(nombre == datos.Lector.GetString(1))
                    {
                        datos.CerrarConexion();
                        return true;
                    }
                }

                return false;
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

        public void Baja(string ID)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_BajaCategoria");
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
    }
}
