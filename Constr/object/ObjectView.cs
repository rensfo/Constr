using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.Model
{
	public class ObjectView
	{
        public virtual decimal? id { get; set; }
        public virtual decimal? idObj { get; set; }
        public virtual string viewName { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }

        public ObjectView() { }
	}
}