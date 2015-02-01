using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.Common
{
	public class Column
	{
        public virtual decimal? id { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }
	}
}