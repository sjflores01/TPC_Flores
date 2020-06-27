using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;

namespace Negocio
{
    public class ProductoNegocio
    {
        public List<Producto> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            List<Producto> lista = new List<Producto>();
            Producto producto;

            try
            {
                datos.SetearQuery("SELECT * FROM VW_ProductosLista");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    producto = new Producto();
                    
                    producto.Eliminado = datos.Lector.GetBoolean(9);
                    producto.Marca.Eliminado = datos.Lector.GetBoolean(14);
                    producto.Categoria.Eliminado = datos.Lector.GetBoolean(17);

                    if (!producto.Eliminado && !producto.Marca.Eliminado && !producto.Categoria.Eliminado)
                    {
                        producto.ID = datos.Lector.GetInt64(0);
                        producto.Codigo = datos.Lector.GetString(1);
                        producto.Nombre = datos.Lector.GetString(2);
                        producto.Descripcion = datos.Lector.GetString(3);
                        producto.URLImagen = datos.Lector.GetString(4);
                        producto.Precio = datos.Lector.GetDecimal(5);
                        producto.Stock = datos.Lector.GetInt64(6);
                        producto.Marca.ID = datos.Lector.GetInt64(10);
                        producto.Marca.Codigo = datos.Lector.GetString(11);
                        producto.Marca.Nombre = datos.Lector.GetString(12);
                        producto.Marca.URLImagen = datos.Lector.GetString(13);
                        producto.Categoria.ID = datos.Lector.GetInt32(15);
                        producto.Categoria.Nombre = datos.Lector.GetString(16);

                        lista.Add(producto);
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

        public void Agregar(Producto producto)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_AltaProducto");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@Codigo", producto.Codigo);
                datos.SetearParametro("@Nombre", producto.Nombre);
                datos.SetearParametro("@Descripcion", producto.Descripcion);
                datos.SetearParametro("@ImagenURL", producto.URLImagen);
                datos.SetearParametro("@Precio", producto.Precio);
                datos.SetearParametro("@Stock", producto.Stock);
                datos.SetearParametro("@IDMarca", producto.Marca.ID);
                datos.SetearParametro("@IDCategoria", producto.Categoria.ID);
                datos.SetearParametro("@Eliminado", producto.Eliminado);

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

        public void Modificar(Producto producto)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_ModifProducto");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@ID", producto.ID);
                datos.SetearParametro("@Codigo", producto.Codigo);
                datos.SetearParametro("@Nombre", producto.Nombre);
                datos.SetearParametro("@Descripcion", producto.Descripcion);
                datos.SetearParametro("@ImagenURL", producto.URLImagen);
                datos.SetearParametro("@Precio", producto.Precio);
                datos.SetearParametro("@Stock", producto.Stock);
                datos.SetearParametro("@IDMarca", producto.Marca.ID);
                datos.SetearParametro("@IDCategoria", producto.Categoria.ID);

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

        public void Baja(string id)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_BajaProducto");
                datos.SetearParametro("@ID", id);
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
