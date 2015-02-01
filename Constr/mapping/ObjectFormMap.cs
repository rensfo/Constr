using Constr.Model;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ObjectFormMap : ClassMap<ObjectForm>
    {
        public ObjectFormMap()
        {
            Table("MD_OBJFRM");
            Id(x => x.id);
            Map(x => x.idObj, "IDOBJ");
            Map(x => x.code, "CODE");
            Map(x => x.name, "NAME");
            Map(x => x.isCatalogVisible, "ISCATALOGVISIBLE");
            Map(x => x.idObjView, "IDOBJVIEW");
            References(x => x.ObjView).Column("IDOBJVIEW");
            HasMany(x => x.objectFormViewItems).KeyColumn("IDOBJFRM").Where("IDPARENT is null");
            References(x => x.obj).Column("IDOBJ");
        }
    }
}