using System;
using System.Collections.Generic;
using System.Linq;

namespace Constr.DataModel
{
    /// <summary>
    /// Summary description for Class1
    /// </summary>
    public class ActionType
    {
        public ActionType()
        {
        }
        public virtual decimal? id { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }
    }
}
