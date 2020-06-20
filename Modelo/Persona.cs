using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Persona
    {
        public string Apellido { get; set; }
        public string Nombre { get; set; }
        public int Dni { get; set; }
        public DateTime FechaNac { get; set; }
        public DateTime FechaReg { get; set; }
        public Contacto Contacto { get; set; }

        public Persona()
        {
            this.Contacto = new Contacto();
        }
    }
}
