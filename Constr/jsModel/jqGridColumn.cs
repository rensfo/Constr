using Constr.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Constr.jsModel
{
    public class jsGridColumn
    {
        public string name { get; set; }
        public string label { get; set; }
        public bool? key { get; set; }
        public bool? hidden { get; set; }

        public jsGridColumn(ObjectFormViewColumn ofvc)
        {
            name = ofvc.objectViewColumn.column.code;
            label = ofvc.objectViewColumn.column.name;
            key = ofvc.objectViewColumn.isId;
            hidden = !(ofvc.isVisible ?? false);
        }
    }
}
