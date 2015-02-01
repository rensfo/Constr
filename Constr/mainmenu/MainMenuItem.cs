using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web.Script.Serialization;

namespace Constr.DataModel.Menu
{
    /// <summary>
    /// Summary description for MainMenuItem
    /// </summary>
    //[DataContract(IsReference = true)]
    public class MainMenuItem
    {
        public virtual decimal? id { get; set; }
        public virtual decimal? idParent { get; set; }
        public virtual string code { get; set; }
        public virtual string name { get; set; }
        [ScriptIgnore]
        public virtual MainMenuItem parent { get; set; }
        public virtual IList<MainMenuItem> mainMenuItems { get; set; }
        public virtual IList<MainMenuAction> mainMenuActions { get; set; }

        public MainMenuItem()
        {
            mainMenuItems = new List<MainMenuItem>();
            mainMenuActions = new List<MainMenuAction>();
        }
    }
}
