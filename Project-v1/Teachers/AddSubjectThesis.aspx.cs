using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;

public partial class Teachers_AddSubjectThesis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["Year"] = Int32.Parse(System.DateTime.Now.Year.ToString());

        int acdID;

        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            acdID = Int32.Parse((from acd in myEntities.Academics
                                     where acd.Username == User.Identity.Name
                                     select acd.Acd_id).First().ToString());
        }

        e.Values["Acd_id"] = acdID;
    }
}