using Constr.Model;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ObjectViewMap : ClassMap<ObjectView>
    {
        public ObjectViewMap()
        {
            Table("MD_OBJVIEW");
            Id(x => x.id);
            Map(x => x.idObj, "IDOBJ");
            Map(x => x.code, "CODE");
            Map(x => x.name, "NAME");
        }
    }
}