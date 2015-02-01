using Constr.DataModel.Menu;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class MainMenuActionMap : ClassMap<MainMenuAction>
    {
        public MainMenuActionMap()
        {
            Table("MD_MAINMENUACTION");
            Id(x => x.id);
            Map(x => x.idMainMenu, "IDMAINMENU");
            Map(x => x.idActionType, "IDACTIONTYPE");
            Map(x => x.idObjFrm, "IDOBJFRM");
            Map(x => x.code, "CODE");
            Map(x => x.name, "NAME");
            References(x => x.parent).Column("IDMAINMENU");
        }
    }
}