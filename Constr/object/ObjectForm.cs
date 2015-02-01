using Constr.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.Model
{
    public class ObjectForm
    {
        public virtual decimal? id { get; set; }
        public virtual decimal? idObj { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }
        public virtual bool isCatalogVisible { get; set; }
        public virtual decimal? idObjView { get; set; }
        public virtual ObjectView ObjView { get; set; }
        public virtual IList<ObjectFormView> objectFormViewItems { get; set; }
        public virtual Obj obj { get; set; }

        public ObjectForm() { }
    }
}