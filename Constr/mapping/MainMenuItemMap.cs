using Constr.DataModel.Menu;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class MainMenuItemMap : ClassMap<MainMenuItem>
    {
        public MainMenuItemMap()
        {
            Table("MD_MAINMENU");
            Id(x => x.id);
            Map(x => x.code, "CODE");
            Map(x => x.name, "NAME");
            Map(x => x.idParent, "IDPARENT");
            References(x => x.parent).Column("IDPARENT").Fetch.Join();
            HasMany(x => x.mainMenuItems).KeyColumn("IDPARENT");
            HasMany(x => x.mainMenuActions).KeyColumn("IDMAINMENU");
        }
    }
}