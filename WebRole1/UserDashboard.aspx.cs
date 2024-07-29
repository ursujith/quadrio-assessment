using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage.Table;
using Microsoft.WindowsAzure.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        CloudStorageAccount sa;
        CloudTableClient client;
        CloudTable table;

        protected void Page_Load(object sender, EventArgs e)
        {
            sa = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("book"));
            client = sa.CreateCloudTableClient();
            table = client.GetTableReference("book");
            table.CreateIfNotExists();
            TableQuery<ContactEntity> query = new TableQuery<ContactEntity>();
            ContactGrid.DataSource = table.ExecuteQuery<ContactEntity>(query);
            ContactGrid.DataBind();
        }
        protected void homePage(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");

        }
    }
}