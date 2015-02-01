using Constr.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.Model
{
	public class Obj
	{
        public virtual decimal? id { get; set; }
        public virtual decimal? idParent { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }
        public virtual bool haveCatalog { get; set; }
        public virtual decimal? idObjCatalog { get; set; }
        public virtual decimal? idCatalog { get; set; }
        //public virtual IList<ObjectForm> objectFormItems { get; set; }
        public virtual Object catalog { get; set; }
	}
}