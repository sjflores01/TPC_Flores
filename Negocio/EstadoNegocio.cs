using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class EstadoNegocio
    {
        public List<Estado> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            List<Estado> lista = new List<Estado>();
            Estado estado;

            try
            {
                datos.SetearQuery("SELECT * FROM Estados");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    estado = new Estado();

                    estado.ID = datos.Lector.GetInt32(0);
                    estado.Nombre = datos.Lector.GetString(1);

                    lista.Add(estado);
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
