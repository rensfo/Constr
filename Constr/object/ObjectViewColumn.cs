using Constr.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.Model
{
	public class ObjectViewColumn
	{
        public virtual decimal? id { get; set; }
        public virtual decimal? idObjView { get; set; }
        public virtual decimal? idCol { get; set; }
        public virtual decimal? idObjCol { get; set; }
        public virtual decimal? idDomain { get; set; }
        public virtual bool? isId { get; set; }
        public virtual bool? isIdParent { get; set; }
        public virtual bool? isIdParentObject { get; set; }
        public virtual bool? isIdCatalog { get; set; }
        public virtual Column column { get; set; }

	}
}