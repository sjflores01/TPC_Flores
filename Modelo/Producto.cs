using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Producto
    {
        public long ID { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string URLImagen { get; set; }
        public Marca Marca { get; set; }
        public Categoria Categoria { get; set; }
        public decimal Precio { get; set; }
        public long Stock { get; set; }
        public int CantidadElegida { get; set; }
        public bool Eliminado { get; set; }


        public Producto()
        {
            this.Marca = new Marca();
            this.Categoria = new Categoria();
        }
    }
}
