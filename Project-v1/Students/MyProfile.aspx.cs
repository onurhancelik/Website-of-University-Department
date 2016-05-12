using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;

public partial class Students_MyProfile : BasePage
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
            var stdProfile = from std in myEntities.Students
                             where std.Username == User.Identity.Name
                             select new { std.Username, std.Name, std.Std_no, std.Email, std.Phone };

            ListView1.DataSource = stdProfile;
            ListView1.DataBind();
        }
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            string newPhone=null;
            var stdProfile = from std in myEntities.Students
                             where std.Username == User.Identity.Name
                             select std;

            foreach (ListViewDataItem item in ListView1.Items)
            {
                TextBox tb = (TextBox)item.FindControl("phoneTextBox");

                newPhone = tb.Text;
            }
    
            foreach (Student st in stdProfile)
            {
                st.Phone = newPhone;
            }
      
            myEntities.SaveChanges();
        }
    }
    protected void ContinuePushButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Students/MyProfile.aspx");
    }
}