using Constr.Model;
using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Constr.mapping
{
    public class ObjectFormViewColumnMap : ClassMap<ObjectFormViewColumn>
    {
        public ObjectFormViewColumnMap()
        {
            Table("MD_OBJFRMVIEWCOL");
            Id(x => x.id);
            Map(x => x.idObjFrmView, "IDOBJFRMVIEW");
            Map(x => x.idObjViewCol, "IDOBJVIEWCOL");
            Map(x => x.isVisible, "ISVISIBLE");
            Map(x => x.isEditable, "ISEDITABLE");
            Map(x => x.isMultiline, "ISMULTILINE");
            Map(x => x.setter, "SETTER");
            References(x => x.objectFormView).Column("IDOBJFRMVIEW");
            References(x => x.objectViewColumn).Column("IDOBJVIEWCOL");
        }
    }
}