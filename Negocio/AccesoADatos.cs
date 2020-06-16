using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoADatos
    {
        public SqlConnection Conexion { get; set; }
        public SqlCommand Comando { get; set; }
        public SqlDataReader Lector { get; set; }

        public AccesoADatos()
        {
            Conexion = new SqlConnection("data source=DESKTOP-1CME8C0\\SQLEXPRESS; initial catalog= DB_FLORES; integrated security= sspi");
            Comando = new SqlCommand();
            Comando.Connection = Conexion;
        }

        public void SetearQuery(string query)
        {
            Comando.CommandType = System.Data.CommandType.Text;
            Comando.CommandText = query;
        }

        public void SetearSP(string sp)
        {
            Comando.CommandType = System.Data.CommandType.StoredProcedure;
            Comando.CommandText = sp;
        }

        public void SetearParametro(string param, object val)
        {
            Comando.Parameters.AddWithValue(param, val);
        }

        public void EjecutarAccion()
        {
            try
            {
                Conexion.Open();
                Comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void EjecutarLector()
        {
            try
            {
                Conexion.Open();
                Lector = Comando.ExecuteReader();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void CerrarConexion()
        {
            Conexion.Close();
        }
    }
}
