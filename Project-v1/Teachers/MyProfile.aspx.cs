using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;

public partial class Teachers_MyProfile : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            listViewBind();
        }        
    }

    public void listViewBind()
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            var acdProfile = from acd in myEntities.Academics
                             where acd.Username == User.Identity.Name
                             select new { acd.Username, acd.Name, acd.Email, acd.Phone, acd.Interests, acd.Education };

            ListView1.DataSource = acdProfile;
            ListView1.DataBind();
        }
    }

    protected void ContinuePushButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Teachers/MyProfile.aspx");
    }

    protected void saveButton_Click(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            string newPhone = null;
            string newArea = null;
            string newEdu = null;

            var acdProfile = from acd in myEntities.Academics
                             where acd.Username == User.Identity.Name
                             select acd;

            foreach (ListViewDataItem item in ListView1.Items)
            {
                newPhone = ((TextBox)item.FindControl("phoneTextBox")).Text;
                newEdu = ((TextBox)item.FindControl("educationTextBox")).Text;
                newArea = ((TextBox)item.FindControl("interestTexBox")).Text;
             
            }
            acdProfile.First().Phone = newPhone;
            acdProfile.First().Education = newEdu;
            acdProfile.First().Interests = newArea;

            myEntities.SaveChanges();
        }
    }
}