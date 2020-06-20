using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class LocalidadNegocio
    {
        public List<Localidad> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            Localidad localidad;
            List<Localidad> lista = new List<Localidad>();

            try
            {
                datos.SetearQuery("SELECT * FROM Localidades");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    localidad = new Localidad();
                    
                    localidad.ID = datos.Lector.GetInt32(0);
                    localidad.Nombre = datos.Lector.GetString(2);

                    lista.Add(localidad);
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
