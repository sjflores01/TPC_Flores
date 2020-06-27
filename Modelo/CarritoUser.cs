using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class CarritoUser
    {
        public long ID { get; set; }
        public List<Producto> Productos { get; set; }

        public CarritoUser()
        {
            this.Productos = new List<Producto>();
        }

    }
}
