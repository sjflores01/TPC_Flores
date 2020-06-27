using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class FavoritoNegocio
    {
        public List<Favorito> Listar(long idFavorito)
        {
            AccesoADatos datos = new AccesoADatos();
            List<Favorito> lista = new List<Favorito>();
            Favorito prodFavorito;

            try
            {
                datos.SetearSP("SP_ListarFavoritos");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDFavorito", idFavorito);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    prodFavorito = new Favorito();
                    prodFavorito.Producto.Eliminado = datos.Lector.GetBoolean(0);

                    if (!prodFavorito.Producto.Eliminado)
                    {
                        prodFavorito.Producto.ID = datos.Lector.GetInt64(1);
                        prodFavorito.Producto.Nombre = datos.Lector.GetString(2);
                        prodFavorito.Producto.Marca.Nombre = datos.Lector.GetString(3);
                        prodFavorito.Producto.Precio = datos.Lector.GetDecimal(4);

                        lista.Add(prodFavorito);
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

        public void AgregarFavorito(long IDFavorito, long IDProducto)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_AgregarFavorito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDFavorito", IDFavorito);
                datos.SetearParametro("@IDProducto", IDProducto);
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

        public void BorrarFavorito(long IDFavorito, long IDProducto)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_EliminarFavorito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDFavorito", IDFavorito);
                datos.SetearParametro("@IDProducto", IDProducto);
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

        public bool BuscarFavorito(long IDFavorito, long IDProducto)
        {
            AccesoADatos datos = new AccesoADatos();
            bool result = false;

            try
            {
                datos.SetearSP("SP_ContarFavoritos");
                datos.SetearParametro("@IDFavorito", IDFavorito);
                datos.SetearParametro("@IDProducto", IDProducto);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    if (datos.Lector.GetInt32(0) > 0)
                    {
                        result = true;
                    }
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
