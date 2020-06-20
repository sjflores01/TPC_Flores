using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Contacto
    {
        public Direccion Direccion { get; set; }
        public string Email { get; set; }
        public int Telefono { get; set; }

        public Contacto()
        {
            this.Direccion = new Direccion();
        }
    }
}
