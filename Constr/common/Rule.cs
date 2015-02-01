using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.DataModel.jqGrid
{
    /// <summary>
    /// Summary description for Rule
    /// </summary>
    public class Rule
    {
        public Rule(){ }
        public string field { get; set; }
        public string op { get; set; }
        public string data { get; set; }
    }
}