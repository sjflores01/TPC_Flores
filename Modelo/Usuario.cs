using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Usuario : Persona
    {
        public long ID { get; set; }
        public int Tipo { get; set; }
        public string NombreUsuario { get; set; }
        public string Clave { get; set; }
        public bool Eliminado { get; set; }
    }
}
