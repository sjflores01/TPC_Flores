using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Negocio
{
    public class DepartamentoNegocio
    {
        public List<Departamento> Listar()
        {
            AccesoADatos datos = new AccesoADatos();
            Departamento departamento;
            List<Departamento> lista = new List<Departamento>();

            try
            {
                datos.SetearQuery("SELECT * FROM Departamentos ORDER BY Nombre");
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    departamento = new Departamento();

                    departamento.ID = datos.Lector.GetInt32(0);
                    departamento.Nombre = datos.Lector.GetString(2);

                    lista.Add(departamento);
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

        public List<Departamento> FiltrarXProv(int IDProvincia)
        {
            AccesoADatos datos = new AccesoADatos();
            List<Departamento> lista = new List<Departamento>();
            Departamento departamento;

            try
            {
                datos.SetearSP("SP_FiltrarDptoXProv");
                datos.Comando.Parameters.Clear();
                datos.SetearParametro("@IDProvincia", IDProvincia);
                datos.EjecutarLector();

                while (datos.Lector.Read())
                {
                    departamento = new Departamento();

                    departamento.ID = datos.Lector.GetInt32(0);
                    departamento.Nombre = datos.Lector.GetString(2);

                    lista.Add(departamento);
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
