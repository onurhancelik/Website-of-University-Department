using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;

public partial class Teachers_CurrentThesis : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            int sup_id = (from acd in myEntities.Academics
                          where acd.Username == User.Identity.Name
                          select acd).First().Acd_id;

            var allThesis = from thesis in myEntities.Upload_Thesis
                            where thesis.Supervisor_id == sup_id
                            select new { thesis.Thesis_id,
                                         Std_name = thesis.Student.Name,
                                         thesis.Year,
                                         Supervisor = thesis.Academic.Name,
                                         thesis.Title,
                                         thesis.Content,
                                         thesis.Document,
                                         thesis.Approval};
            GridView1.DataSource = allThesis;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnk = new LinkButton();
            lnk.Text = e.Row.Cells[0].Text;

            lnk.CommandName = "ShowDetails";
            lnk.Command += LinkButton_Command;
            lnk.CssClass = "GridViewNoCell";
            e.Row.Cells[0].Controls.Add(lnk);
        }
    }
    protected void LinkButton_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "ShowDetails")
        {
            LinkButton btndetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;

            int thsNo = Int32.Parse(btndetails.Text);
            bool isApproval;
            using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
            {
                var selectedThesis = from thesis in myEntities.Upload_Thesis
                                     where thesis.Thesis_id == thsNo
                                     select new{ thesis.Thesis_id,
                                         Std_name = thesis.Student.Name,
                                         thesis.Year,
                                         Supervisor = thesis.Academic.Name,
                                         thesis.Title,
                                         thesis.Content,
                                         thesis.Document,
                                         thesis.Approval};
                isApproval = selectedThesis.First().Approval;
                DetailsView1.DataSource = selectedThesis;
                DetailsView1.DataBind();
            }
            if (isApproval)
            {
                approvalButton.Text = "Onaylandı";
                approvalButton.Enabled = false;
            }
            else
            {
                approvalButton.Text = "Onayla";
                approvalButton.Enabled = true;
            }
            this.ModalPopupExtender1.Show();
        }
    }

    protected void downloadButton_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "DownloadFile")
        {
            LinkButton btndetails = sender as LinkButton;
            string filePath = "~/Documents/" + btndetails.Text;
            if (filePath != String.Empty)
            {
                Response.ContentType = "doc/docx/pdf";
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + btndetails.Text + "\"");
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
                ModalPopupExtender1.Show();
            }
        }
    }

    protected void cancelButton_Click(object sender, EventArgs e)
    {
        this.ModalPopupExtender1.Hide();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string filePath = "~/Documents/" + DetailsView1.Rows[6].Cells[1].Text;
        if (filePath != String.Empty)
        {
            Response.ContentType = "doc/docx";
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + DetailsView1.Rows[6].Cells[1].Text + "\"");
            Response.TransmitFile(Server.MapPath(filePath));
            Response.End();
        }
    }
    protected void approvalButton_Click(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            int thesisId = Int32.Parse(DetailsView1.Rows[0].Cells[1].Text);

            Upload_Thesis upThesis = (from ths in myEntities.Upload_Thesis
                                   where ths.Thesis_id == thesisId
                                   select ths).First();

            upThesis.Approval=true;
            
            Past_Thesis newPast = new Past_Thesis();
            newPast.Std_name = upThesis.Student.Name;
            newPast.Supervisor = upThesis.Academic.Name;
            newPast.Title = upThesis.Title;
            newPast.Content = upThesis.Content;
            newPast.Document = upThesis.Document;
            newPast.Year = upThesis.Year;

            myEntities.AddToPast_Thesis(newPast);
            myEntities.SaveChanges();

            Response.Redirect("~/Teachers/CurrentThesis.aspx");
        }
    }
}