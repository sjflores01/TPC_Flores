using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class ProvinciaNegocio
    {
        public List<Provincia> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            Provincia provincia;
            List<Provincia> lista = new List<Provincia>();

            try
            {
                datos.SetearQuery("SELECT * FROM Provincias ORDER BY Nombre");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    provincia = new Provincia();

                    provincia.ID = datos.Lector.GetInt32(0);
                    provincia.Nombre = datos.Lector.GetString(1);

                    lista.Add(provincia);
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
