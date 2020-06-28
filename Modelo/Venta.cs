using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Venta
    {
        public long ID { get; set; }
        public CarritoUser Carrito { get; set; }
        public long IDUsuario { get; set; }
        public decimal Importe { get; set; }

        public Venta()
        {
            this.Carrito = new CarritoUser();
        }
    }
}
