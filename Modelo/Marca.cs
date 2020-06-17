using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Marca
    {
        public long ID { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string URLImagen { get; set; }
        public bool Eliminado { get; set; }

        public override string ToString()
        {
            return Nombre;
        }

        public void Agregar(Marca marca)
        {
            throw new NotImplementedException();
        }
    }
}
