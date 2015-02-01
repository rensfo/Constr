using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Constr.Model
{
	public class ObjectFormView
	{
        public virtual decimal? id { get; set; }
        public virtual decimal? idObjFrm { get; set; }
        public virtual decimal? idParent { get; set; }
        public virtual decimal? idObjView { get; set; }
        [ScriptIgnore]
        public virtual ObjectForm objectForm { get; set; }
        [ScriptIgnore]
        public virtual ObjectFormView parent { get; set; }
        public virtual IList<ObjectFormView> objectFormViewItems { get; set; }
        public virtual IList<ObjectFormViewColumn> columns { get; set; }
        public virtual ObjectView objectView { get; set; }

        public ObjectFormView()
        {
            
        }
	}
}