using Constr.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Constr.Model
{
	public class ObjectFormViewColumn
	{
        public virtual decimal? id { get; set; }
        public virtual decimal? idObjFrmView { get; set; }
        public virtual decimal? idObjViewCol { get; set; }
        public virtual bool? isVisible { get; set; }
        public virtual bool? isEditable { get; set; }
        public virtual bool? isMultiline { get; set; }
        public virtual string setter { get; set; }
        [ScriptIgnore]
        public virtual ObjectFormView objectFormView { get; set; }
        public virtual ObjectViewColumn objectViewColumn { get; set; }

        public ObjectFormViewColumn()
        {

        }
	}
}