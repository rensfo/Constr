using Constr.DataModel.Menu;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using NHibernate.Connection;
using NHibernate.Driver;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Constr.FluentNHibernate.Helper
{
    /// <summary>
    /// Summary description for FluentNHibernateHelper
    /// </summary>
    public static class FluentNHibernateHelper
    {
        private static ISessionFactory _sessionFactory;
        public static ISessionFactory SessionFactory
        {
            get
            {
                if (_sessionFactory == null)
                {
                    var dbConfig =  OracleDataClientConfiguration.Oracle10
                        //.ConnectionString(c => c.FromConnectionStringWithKey("Oracle"))
                      //.ConnectionString(c => c.Is("Data Source=reales.world;User ID=test;Password=test"))
                      .ConnectionString(c => c.Is("Data Source=xe;User ID=erp;Password=erp"))
                      .Provider<DriverConnectionProvider>()
                      .Driver<OracleClientDriver>()
                      .ShowSql();

                    _sessionFactory = Fluently.Configure()
                      .Database(dbConfig)
                      .Mappings(m => m.FluentMappings.AddFromAssemblyOf<MainMenu>())
                      .BuildSessionFactory();
                }
                return _sessionFactory;
            }
        }

        public static ISession OpenSession()
        {
            return SessionFactory.OpenSession();
        }
    }
}
