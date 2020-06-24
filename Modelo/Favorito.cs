using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Favorito
    {
        public int ID { get; set; }
        public long IDUsuario { get; set; }
        public Producto Producto { get; set; }

        public Favorito()
        {
            this.Producto = new Producto();
        }
    }
}
