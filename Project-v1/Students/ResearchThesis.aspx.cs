using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;

public partial class Students_ResearchThesis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            var allTopics = from research in myEntities.Research_Thesis
                            orderby research.Academic.Name
                            select new { research.Subject, research.Content, Academic = research.Academic.Name };
            Repeater1.DataSource = allTopics;
            Repeater1.DataBind();
        }
    }
}