using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;

public partial class Teachers_UploadPastThesis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadYearDropDown();
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        string teacherName;
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            teacherName = (from acd in myEntities.Academics
                     where acd.Username == User.Identity.Name
                     select (acd.Name)).First().ToString();
        }
        e.Values["Supervisor"] = teacherName;
        
        FileUpload fu = (FileUpload)FormView1.FindControl("DocumentFileUpload");
        string virtualFolder = "~/Documents/";
        string physicalFolder = Server.MapPath(virtualFolder);
        fu.SaveAs(System.IO.Path.Combine(physicalFolder, fu.FileName));
        e.Values["Document"] = fu.FileName;

        DropDownList yearDrowDown = (DropDownList)FormView1.FindControl("yearDropDownList");
        int year = Int32.Parse(yearDrowDown.SelectedValue);
        e.Values["Year"] = year;
    }
    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Response.Redirect("~/Teachers/UploadPastThesis.aspx");
    }

    protected void loadYearDropDown()
    {
        DropDownList yearDrowDown = (DropDownList)FormView1.FindControl("yearDropDownList");
        for (int i = 1982; i <= System.DateTime.Now.Year; i++)
        {
            yearDrowDown.Items.Add(i.ToString());
        }
    }
}