using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Direccion
    {
        public string Piso { get; set; }
        public string Dpto { get; set; }
        public int Numero { get; set; }
        public string Calle { get; set; }
        public string CP { get; set; }
        public Localidad Localidad { get; set; }
        public Departamento Departamento { get; set; }
        public Provincia Provincia { get; set; }

        public Direccion()
        {
            this.Localidad = new Localidad();
            this.Departamento = new Departamento();
            this.Provincia = new Provincia();
        }
    }
}
