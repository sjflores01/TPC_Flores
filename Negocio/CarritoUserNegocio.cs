using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class CarritoUserNegocio
    {
        public void AgregarProductoCarrito(long IDCarrito, long IDProducto, decimal precioProducto, int cantidad)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_CargarProducto_X_Carrito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDCarrito", IDCarrito);
                datos.SetearParametro("@IDProducto", IDProducto);
                datos.SetearParametro("@Cantidad", cantidad);
                datos.SetearParametro("@Precio", precioProducto);
                datos.EjecutarAccion();
                datos.CerrarConexion();
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

        public bool BuscarProductoXCarrito(long IDCarrito, long IDProducto)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_BuscarProductoXCarrito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDCarrito", IDCarrito);
                datos.SetearParametro("@IDProducto", IDProducto);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    if(IDProducto == datos.Lector.GetInt64(0))
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


        public CarritoUser BuscarCarrito(long IDUsuario)
        {
            AccesoADatos datos = new AccesoADatos();
            CarritoUser carrito = new CarritoUser();

            try
            {
                datos.SetearSP("SP_BuscarCarrito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDUsuario", IDUsuario);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    carrito.ID = datos.Lector.GetInt64(0);
                }

                return carrito;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ModificarProductoXCarrito(long IDCarrito, long IDProducto, int cantidad)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_ModifCantidadProductoXCarrito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDCarrito", IDCarrito);
                datos.SetearParametro("@IDProducto", IDProducto);
                datos.SetearParametro("Cantidad", cantidad);
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

        public void EliminarItem(long IDProducto, long IDCarrito)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_EliminarProductosXCarrito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDCarrito", IDCarrito);
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

        public decimal SumarImporte(List<Producto> listaCarrito)
        {
            decimal result = 0;

            foreach (var item in listaCarrito)
            {
                result += item.Precio * item.CantidadElegida;
            }

            return result;
        }

        public List<Producto> CargarListaCarrito(long IDCarrito)
        {
            AccesoADatos datos = new AccesoADatos();
            List<Producto> listaCarrito = new List<Producto>();
            Producto producto = new Producto();

            try
            {
                datos.SetearSP("SP_ListarProductos_X_Carrito");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDCarrito", IDCarrito);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    producto = new Producto();

                    producto.Eliminado = datos.Lector.GetBoolean(0);
                    producto.Marca.Eliminado = datos.Lector.GetBoolean(1);
                    producto.Categoria.Eliminado = datos.Lector.GetBoolean(2);

                    if (!producto.Eliminado && !producto.Marca.Eliminado && !producto.Categoria.Eliminado)
                    {
                        producto.ID = datos.Lector.GetInt64(3);
                        producto.Codigo = datos.Lector.GetString(4);
                        producto.Nombre = datos.Lector.GetString(5);
                        producto.URLImagen = datos.Lector.GetString(6);
                        producto.Precio = datos.Lector.GetDecimal(7);
                        producto.Stock = datos.Lector.GetInt64(8);
                        producto.CantidadElegida = datos.Lector.GetInt32(11);

                        listaCarrito.Add(producto);
                    }

                }
                return listaCarrito;

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
