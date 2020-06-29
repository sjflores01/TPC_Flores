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
        public Usuario Usuario { get; set; }
        public decimal Importe { get; set; }
        public DateTime Fecha { get; set; }

        public Venta()
        {
            this.Carrito = new CarritoUser();
            this.Usuario = new Usuario();
        }
    }
}
