using Constr.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.jsModel
{
    public class jsForm
    {
        public decimal? id { get; set; }
        public string name { get; set; }
        //public bool haveCatalog { get; set; }
        public bool isCatalogVisible { get; set; }
        public IList<jsGrid> grids { get; set; }

        public jsForm(ObjectForm objectForm)
        {
            id = objectForm.id;
            name = objectForm.name;
            isCatalogVisible = objectForm.isCatalogVisible;

            grids = new List<jsGrid>();
            foreach (var grid in objectForm.objectFormViewItems)
            {
                grids.Add(new jsGrid(grid));
            }
        }
    }
}