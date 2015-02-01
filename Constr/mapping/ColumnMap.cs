using Constr.Common;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ColumnMap : ClassMap<Column>
    {
        public ColumnMap()
        {
            Table("MD_COL");
            Id(x => x.id);
            Map(x => x.code, "CODE");
            Map(x => x.name, "NAME");
        }
    }
}