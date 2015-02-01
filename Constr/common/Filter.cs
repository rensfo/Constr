using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.DataModel.jqGrid
{
    /// <summary>
    /// Summary description for Filter
    /// </summary>
    public class Filter
    {
        public Filter() { }
        public string groupOp { get; set; }
        public List<Rule> rules { get; set; }
        public List<Filter> filters { get; set; }
    }
}