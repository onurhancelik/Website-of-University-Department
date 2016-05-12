using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;
using System.IO;

public partial class Students_MyThesis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            setSupervisorDrop();
            setFormViewMode();
            formViewBind();
            setSupervisorDrop();
            setStatus();
        }
    }

    protected void formViewBind()
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            int std_id = (from std in myEntities.Students
                          where std.Username == User.Identity.Name
                          select std).First().Std_id;

            var thesis = from upThesis in myEntities.Upload_Thesis
                          where upThesis.Std_id == std_id
                          select new { upThesis.Title,
                                       upThesis.Content,
                                       upThesis.Document,
                                       Supervisor = upThesis.Academic.Name,
                                       upThesis.Approval
                          };
            FormView1.DataSource = thesis;
            FormView1.DataBind();
        }
    }

    protected void setFormViewMode()
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            var userThesis= (from std in myEntities.Students
                            where std.Username == User.Identity.Name
                            select std).First().Upload_Thesis;

            if (userThesis.Count() != 0)
            {
                FormView1.ChangeMode(FormViewMode.Edit);
            }
        }
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            DropDownList supDrop = (DropDownList)FormView1.FindControl("supervisorDropDown");
            Upload_Thesis thesis = new Upload_Thesis();
            int Std_id = (from std in myEntities.Students
                              where std.Username == User.Identity.Name
                              select std).First().Std_id;
            thesis.Std_id = Std_id;
            thesis.Title = ((TextBox)FormView1.FindControl("TitleTextBox")).Text;
            thesis.Content = ((TextBox)FormView1.FindControl("ContentTextBox")).Text;

            FileUpload fu = (FileUpload)FormView1.FindControl("documentFileUpload");
            string virtualFolder = "~/Documents/";
            string physicalFolder = Server.MapPath(virtualFolder);
            fu.SaveAs(System.IO.Path.Combine(physicalFolder, fu.FileName));
            
            thesis.Document = fu.FileName;

            int Sup_id = (from acd in myEntities.Academics
                          where acd.Name == supDrop.SelectedValue
                          select acd).First().Acd_id;
            thesis.Supervisor_id = Sup_id;
            thesis.Year = System.DateTime.Now.Year;

            myEntities.AddToUpload_Thesis(thesis);
            myEntities.SaveChanges();

        }
    }

    protected void setSupervisorDrop()
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            var acds = from acd in myEntities.Academics
                       select acd;

            DropDownList supDrop = (DropDownList)FormView1.FindControl("supervisorDropDown");
            if (supDrop != null)
            {
                foreach (Academic acd in acds)
                {
                    supDrop.Items.Add(acd.Name);
                }
            }
        }
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            int Std_id = (from std in myEntities.Students
                         where std.Username == User.Identity.Name
                         select std).First().Std_id;

            var uploadedThesis = from upt in myEntities.Upload_Thesis
                                 where upt.Std_id == Std_id
                                 select upt;

            string newTitle = ((TextBox)FormView1.FindControl("title2TextBox")).Text;
            string newContent = ((TextBox)FormView1.FindControl("Content2TextBox")).Text;

            uploadedThesis.First().Content = newContent;
            uploadedThesis.First().Title = newTitle;

            FileUpload newFile = (FileUpload)FormView1.FindControl("doc2FileUpload");
            if (newFile.HasFile)
            {
                /*Delete from server old document*/
                string oldFileName = ((LinkButton)FormView1.FindControl("docLinkButton")).Text;
                string completePath = Server.MapPath("~/Documents/" + oldFileName);
                if (File.Exists(completePath))
                {
                    File.Delete(completePath);
                }

                /*Upload to server new document*/
                string virtualFolder = "~/Documents/";
                string physicalFolder = Server.MapPath(virtualFolder);
                newFile.SaveAs(System.IO.Path.Combine(physicalFolder, newFile.FileName));

                /*Update database record for document name*/
                uploadedThesis.First().Document = newFile.FileName;
            }

            myEntities.SaveChanges();
            formViewBind(); 
        }
    }
    protected void docLinkButton_Click(object sender, EventArgs e)
    {
        string fileName = ((LinkButton)FormView1.FindControl("docLinkButton")).Text;
        string filePath = "~/Documents/" + fileName;
        if (filePath != String.Empty)
        {
            Response.ContentType = "doc/docx/pdf";
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
            Response.TransmitFile(Server.MapPath(filePath));
            Response.End();
        }   
    }
    protected void setStatus()
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            var userThesis = (from std in myEntities.Students
                              where std.Username == User.Identity.Name
                              select std).First().Upload_Thesis;

            if (userThesis.Count() != 0)
            {
                var onay = (from upt in myEntities.Upload_Thesis
                            where upt.Student.Username == User.Identity.Name
                            select upt);
                if (onay != null)
                {
                    if (onay.First().Approval)
                    {
                        Label status = FormView1.FindControl("statusText") as Label;
                        if (status != null)
                            status.Text = "Onaylandı";
                        status.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
        }
    }
}