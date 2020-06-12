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
                datos.SetearQuery("SELECT P.ID, P.Codigo, P.Nombre, P.Descripcion, P.ImagenURL, P.Precio, P.Stock, M.ID, C.ID, P.Eliminado, M.Codigo, M.Nombre, C.Nombre, M.Eliminado, C.Eliminado " +
                                  "FROM Productos AS P " +
                                  "INNER JOIN Marcas AS M ON P.IDMarca = M.ID " +
                                  "INNER JOIN Categorias as C ON P.IDCategoria = C.ID");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    producto = new Producto();
                    producto.Marca = new Marca();
                    producto.Categoria = new Categoria();

                    producto.Eliminado = datos.Lector.GetBoolean(9);
                    producto.Marca.Eliminado = datos.Lector.GetBoolean(13);
                    producto.Categoria.Eliminado = datos.Lector.GetBoolean(14);

                    if (!producto.Eliminado && !producto.Marca.Eliminado && !producto.Categoria.Eliminado)
                    {
                        producto.ID = datos.Lector.GetInt64(0);
                        producto.Codigo = datos.Lector.GetString(1);
                        producto.Nombre = datos.Lector.GetString(2);
                        producto.Descripcion = datos.Lector.GetString(3);
                        producto.URLImagen = datos.Lector.GetString(4);
                        producto.Precio = datos.Lector.GetDecimal(5);
                        producto.Stock = datos.Lector.GetInt64(6);
                        producto.Marca.ID = datos.Lector.GetInt64(7);
                        producto.Categoria.ID = datos.Lector.GetInt32(8);
                        producto.Marca.Codigo = datos.Lector.GetString(10);
                        producto.Marca.Nombre = datos.Lector.GetString(11);
                        producto.Categoria.Nombre = datos.Lector.GetString(12);

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
    }
}
