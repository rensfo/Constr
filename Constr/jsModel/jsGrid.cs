using Constr.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.jsModel
{
    public class jsGrid
    {
        public decimal? id { get; set; }
        public string name { get; set; }
        public IList<jsGridColumn> columns { get; set; }
        public IList<jsGridAction> actions { get; set; }
        public IList<jsGrid> children { get; set; }

        public jsGrid(ObjectFormView objectFormView)
        {
            id = objectFormView.id;
            name = objectFormView.objectView.name;

            columns = new List<jsGridColumn>();
            foreach (var col in objectFormView.columns)
                columns.Add(new jsGridColumn(col));

            children = new List<jsGrid>();
            foreach (var grid in objectFormView.objectFormViewItems)
                children.Add(new jsGrid(grid));

            //Действия
        }
    }
}