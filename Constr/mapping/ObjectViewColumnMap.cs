using Constr.Model;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ObjectViewColumnMap : ClassMap<ObjectViewColumn>
    {
        public ObjectViewColumnMap()
        {
            Table("MD_OBJVIEWCOL");
            Id(x => x.id);
            Map(x => x.idObjView, "IDOBJVIEW");
            Map(x => x.idCol, "IDCOL");
            Map(x => x.idObjCol, "IDOBJCOL");
            Map(x => x.idDomain, "IDDOMAIN");
            Map(x => x.isId, "ISID");
            Map(x => x.isIdParent, "ISIDPARENT");
            Map(x => x.isIdParentObject, "ISIDPARENTOBJECT");
            Map(x => x.isIdCatalog, "ISIDCATALOG");
            References(x => x.column).Column("IDCOL");
        }
    }
}