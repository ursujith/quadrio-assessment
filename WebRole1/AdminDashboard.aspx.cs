using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Azure;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
namespace WebRole1
{
    public class ContactEntity : TableEntity
    {
        
        public string Description { get; set; }
        public string Rating { get; set; }
        public string Name { get; internal set; }
        public string Rate { get; internal set; }

        public ContactEntity() { }
        public ContactEntity(string name, string rate, string description, string rating)
        {
            RowKey = name;
            PartitionKey = rate;
            Description = description;
            Rating = rating;
            
        }
    }
    public partial class AdminDashboard : System.Web.UI.Page
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

        protected void cmdInsert_Click(object sender, EventArgs e)
        {
            string name = txtname.Text;
            string rate = txtrate.Text;
            string contactNumber = txtdescription.Text;
            string contactType = txtrating.Text;
            ContactEntity contact = new ContactEntity(name, rate, contactNumber, contactType);
            TableOperation iop = TableOperation.Insert(contact);
            table.Execute(iop);
            Response.Redirect("~/AdminDashboard.aspx");
        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            TableOperation rop = TableOperation.Retrieve<ContactEntity>(txtedrate.Text, txtedname.Text);
            TableResult result = table.Execute(rop);
            ContactEntity rcontact = (ContactEntity)result.Result;
            rcontact.Description= txteddescription.Text;
            rcontact.Rating = txtedrating.Text;
            table.Execute(TableOperation.Replace(rcontact));
            Response.Redirect("~/AdminDashboard.aspx");
        }
        protected void homePage(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");

        }

        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            TableOperation rop = TableOperation.Retrieve<ContactEntity>(txtedrate.Text ,txtedname.Text);
            TableResult result = table.Execute(rop);
            ContactEntity rcontact = (ContactEntity)result.Result;
            table.Execute(TableOperation.Delete(rcontact));
            Response.Redirect("~/AdminDashboard.aspx");
        }

        protected void ContactGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            tbladdrecord.Visible = false;
            ContactGrid.Visible = false;
            tbleditrecord.Visible = true;
            int index = Int32.Parse(e.CommandArgument.ToString());
            GridViewRow row = ContactGrid.Rows[index];
            txtedname.Text = row.Cells[0].Text;
            txtedrate.Text = row.Cells[1].Text;
            txteddescription.Text = row.Cells[2].Text;
            txtedrating.Text = row.Cells[3].Text;
        }
    }
}