using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using Negocio;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
            List<Categoria> lista = new List<Categoria>();
            Categoria categoria;
            AccesoADatos datos = new AccesoADatos();

            try
            {
                datos.SetearQuery("SELECT * FROM Categorias");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    categoria = new Categoria();
                    
                    categoria.Eliminado = datos.Lector.GetBoolean(2);
                    if (!categoria.Eliminado)
                    {
                        categoria.ID = datos.Lector.GetInt32(0);
                        categoria.Nombre = datos.Lector.GetString(1);

                        lista.Add(categoria);
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
