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
        public List<Favorito> Listar(long idUsuario)
        {
            AccesoADatos datos = new AccesoADatos();
            List<Favorito> lista = new List<Favorito>();
            Favorito prodFavorito;

            try
            {
                datos.SetearSP("SP_ListarFavoritos");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDUsuario", idUsuario);
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

                throw;
            }
            finally
            {
                datos.CerrarConexion();
            }

        }

        public void AgregarFavorito(long IDusuario, long IDProducto)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_AgregarFavorito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDUsuario", IDusuario);
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
    }
}
