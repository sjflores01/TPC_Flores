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
                datos.SetearParametro("@IDUsuario", venta.Usuario.ID);
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
