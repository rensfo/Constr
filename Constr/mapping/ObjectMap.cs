using Constr.Model;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ObjectMap : ClassMap<Obj>
    {
        public ObjectMap()
        {
            Table("MD_OBJ");
            Id(x=>x.id, "ID");
            Map(x=>x.idParent, "IDPARENT");
            Map(x=>x.code, "CODE");
            Map(x => x.name, "NAME");
            Map(x => x.haveCatalog, "HAVECATALOG");
            Map(x => x.idObjCatalog, "IDOBJCATALOG");
            Map(x => x.idCatalog, "IDCATALOG");
            //HasMany(x => x.objectFormItems).KeyColumn("IDOBJ");
        }
    }
}