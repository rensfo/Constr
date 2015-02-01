using Constr.Model;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ObjectFormViewMap : ClassMap<ObjectFormView>
    {
        public ObjectFormViewMap()
        {
            Table("MD_OBJFRMVIEW");
            Id(x => x.id);
            Map(x => x.idObjFrm, "IDOBJFRM");
            Map(x => x.idObjView, "IDOBJVIEW");
            Map(x => x.idParent, "IDPARENT");
            References(x => x.objectForm).Column("IDOBJFRM");
            References(x => x.parent).Column("IDPARENT");
            HasMany(x => x.objectFormViewItems).KeyColumn("IDPARENT");
            HasMany(x => x.columns).KeyColumn("IDOBJFRMVIEW");
            References(x => x.objectView).Column("IDOBJVIEW");
        }
    }
}