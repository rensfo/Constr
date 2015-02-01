using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web.Script.Serialization;

namespace Constr.DataModel.Menu
{
    /// <summary>
    /// Summary description for MainMenuAction
    /// </summary>
    public class MainMenuAction
    {
        public virtual decimal? id { get; set; }
        public virtual decimal? idMainMenu { get; set; }
        public virtual decimal? idActionType { get; set; }
        public virtual decimal? idObjFrm { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }
        public virtual ActionType actionType { get; set; }
        [ScriptIgnore]
        public virtual MainMenuItem parent { get; set; }
    }
}
