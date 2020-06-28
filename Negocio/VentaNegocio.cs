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
                datos.SetearParametro("@IDUsuario", venta.IDUsuario);
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
    }
}
