using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using Negocio;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> Listar()
        {
            List<Marca> lista = new List<Marca>();
            Marca marca;
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("SELECT * FROM Marcas");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    marca = new Marca();

                    marca.Eliminado = datos.Lector.GetBoolean(4);
                    if (!marca.Eliminado)
                    {
                        marca.ID = datos.Lector.GetInt64(0);
                        marca.Codigo = datos.Lector.GetString(1);
                        marca.Nombre = datos.Lector.GetString(2);
                        marca.URLImagen = datos.Lector.GetString(3);

                        lista.Add(marca);
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
