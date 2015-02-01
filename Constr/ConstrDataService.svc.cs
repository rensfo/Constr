using Constr.DataModel.jqGrid;
using Constr.DataModel.Menu;
using Constr.FluentNHibernate.Helper;
using Constr.jsModel;
using Constr.Model;
using NHibernate.Criterion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Web.Script.Serialization;

namespace Constr
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ConstrDataService
    {
        public ConstrDataService()
        {
            FluentNHibernateHelper.OpenSession();
            //Console.SetOut(new System.IO.StreamWriter(@"C:\Testing\ConsoleOutput.txt"));
        }

        [OperationContract]
        [WebInvoke(Method = "POST",
        BodyStyle = WebMessageBodyStyle.WrappedRequest,
        ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json)]
        public string GetMenu()
        {
            MainMenuItem mmi = new MainMenuItem();
            try
            {
                var session = FluentNHibernateHelper.OpenSession();

                var lst = session.QueryOver<MainMenuItem>()
                    .Where(x => x.idParent == null)
                    .List<MainMenuItem>();
                mmi = lst.FirstOrDefault();

                JavaScriptSerializer s = new JavaScriptSerializer();
                var str = s.Serialize(mmi);

                return str;
            }
            catch (Exception ex)
            {
                throw new WebFaultException<string>(ex.Message, System.Net.HttpStatusCode.InternalServerError);
            }
        }

        [OperationContract]
        [WebInvoke(Method = "POST",
        BodyStyle = WebMessageBodyStyle.WrappedRequest,
        ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json)]
        public string GetForm(decimal id)
        {
            ObjectForm form = new ObjectForm();
            try
            {
                var session = FluentNHibernateHelper.OpenSession();
                var lst = session.QueryOver<ObjectForm>()
                    .Where(x => x.id == id)
                    .List<ObjectForm>();
                form = lst.FirstOrDefault();
                jsForm jsform = new jsForm(form);
                JavaScriptSerializer s = new JavaScriptSerializer();
                var str = s.Serialize(jsform);

                return str;
            }
            catch (Exception ex)
            {
                throw new WebFaultException<string>(ex.Message, System.Net.HttpStatusCode.InternalServerError);
            }
        }

        [OperationContract]
        [WebInvoke(Method = "POST",
        BodyStyle = WebMessageBodyStyle.WrappedRequest,
        ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json)]
        public string GetData(bool _search, double nd, int page, int rows, string sidx, string sord, string filters)
        {
            try
            {
                var serializer = new JavaScriptSerializer();

                if (_search)
                {
                    serializer.Deserialize<Filter>(filters);
                }

                var lst = new List<object>();
                for (var i = (page - 1) * rows + 1; i <= page * rows; i++)
                {
                    lst.Add(new
                    {
                        id = i,
                        code = "code" + i,
                        name = string.Format("_search={0};nd={1};page={2};rows={3};sidx={4};sord={5};filters={6}", _search, nd, page, rows, sidx, sord, filters)
                    });
                }

                return serializer.Serialize(new
                {
                    total = 10,
                    page = page,
                    records = rows * 10,
                    rows = lst
                });
            }
            catch (Exception ex)
            {
                throw new WebFaultException<string>(ex.Message, System.Net.HttpStatusCode.BadRequest);
            }
        }

        [OperationContract]
        [WebInvoke(Method = "POST",
        BodyStyle = WebMessageBodyStyle.WrappedRequest,
        ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json)]
        public string test()
        {
            return "ok";
        }
    }
}
