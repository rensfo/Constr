using Constr.DataModel;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ActionTypeMap : ClassMap<ActionType>
    {
        public ActionTypeMap()
        {
            Table("MD_ACTIONTYPE");
            Id(x => x.id);
            Map(x => x.code, "CODE");
            Map(x => x.name, "NAME");
        }
    }
}