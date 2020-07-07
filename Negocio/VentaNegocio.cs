using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class VentaNegocio
    {
        public void CargarVenta(Venta venta)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_CargarVenta");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDCarrito", venta.Carrito.ID);
                datos.SetearParametro("@Importe", venta.Importe);
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

        public List<Venta> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            List<Venta> lista = new List<Venta>();
            Venta venta;

            try
            {
                datos.SetearQuery("SELECT V.ID, V.Fecha, U.NombreUsuario, U.ID, V.Importe, V.IDCarrito, E.ID, E.Estado FROM Ventas AS V" +
                    " INNER JOIN Carritos AS C ON V.IDCarrito = C.ID" +
                    " INNER JOIN Estados AS E ON V.IDEstado = E.ID" +
                    " INNER JOIN Usuarios AS U ON C.IDUsuario = U.ID" +
                    " ORDER BY V.Fecha DESC");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    venta = new Venta();

                    venta.ID = datos.Lector.GetInt64(0);
                    venta.Fecha = datos.Lector.GetDateTime(1);
                    venta.Usuario.NombreUsuario = datos.Lector.GetString(2);
                    venta.Usuario.ID = datos.Lector.GetInt64(3);
                    venta.Importe = datos.Lector.GetDecimal(4);
                    venta.Carrito.ID = datos.Lector.GetInt64(5);
                    venta.Estado.ID = datos.Lector.GetInt32(6);
                    venta.Estado.Nombre = datos.Lector.GetString(7);

                    lista.Add(venta);
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

        public void ActualizarEstado(long IDVenta, int IDEstado)
        {
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearSP("SP_ActualizarVenta");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDVenta", IDVenta);
                datos.SetearParametro("@IDEstado", IDEstado);
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

        public List<Venta> ListarUltimas()
        {
            AccesoADatos datos = new AccesoADatos();
            List<Venta> lista = new List<Venta>();
            Venta venta;

            try
            {
                datos.SetearQuery("SELECT * FROM VW_UltimasVentas");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    venta = new Venta();

                    venta.ID = datos.Lector.GetInt64(0);
                    venta.Fecha = datos.Lector.GetDateTime(1);
                    venta.Usuario.NombreUsuario = datos.Lector.GetString(2);
                    venta.Importe = datos.Lector.GetDecimal(3);
                    venta.Estado.Nombre = datos.Lector.GetString(4);

                    lista.Add(venta);
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
