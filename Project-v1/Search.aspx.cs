using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BitirmeTeziDatabaseModel;
using System.Data;
using System.Net;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loadYearDropDown();
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            var allThesis = from thesis in myEntities.Past_Thesis
                            select new { thesis.Thesis_id, thesis.Std_name, thesis.Year, thesis.Title, thesis.Content };
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
            keyTextBox.Text = btndetails.Text;
            using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
            {
                var selectedThesis = from thesis in myEntities.Past_Thesis
                                     where thesis.Thesis_id == thsNo
                                     select thesis;
                
                DetailsView1.DataSource = selectedThesis;
                DetailsView1.DataBind();
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
        keyTextBox.Text = "";
        yearDropDown.SelectedIndex = 0;
        typeDropDownList.SelectedIndex = 0;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string filePath = "~/Documents/" + DetailsView1.Rows[6].Cells[1].Text;
        if (filePath != String.Empty)
        {
            Response.ContentType = "doc/docx/pdf";
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + DetailsView1.Rows[6].Cells[1].Text + "\"");
            Response.TransmitFile(Server.MapPath(filePath));
            Response.End();
        }   
    }
    protected void searchButton_Click(object sender, EventArgs e)
    {
        int selected = typeDropDownList.SelectedIndex;
        switch (selected)
        {
            case 0:
                string titleKey = keyTextBox.Text;
                using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
                {
                    var thesisWithKey = from thesis in myEntities.Past_Thesis
                                        where thesis.Title.Contains(titleKey)
                                        select new { thesis.Thesis_id, thesis.Std_name, thesis.Year, thesis.Title, thesis.Content };
                    GridView1.DataSource = thesisWithKey;
                    GridView1.DataBind();
                }
                break;

            case 1:
                string acdKey = keyTextBox.Text;
                using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
                {
                    var thesisWithKey = from thesis in myEntities.Past_Thesis
                                        where thesis.Supervisor.Contains(acdKey)   
                                        select new { thesis.Thesis_id, thesis.Std_name, thesis.Year, thesis.Title, thesis.Content };
                    GridView1.DataSource = thesisWithKey;
                    GridView1.DataBind();
                }
                break;
        }
    }

    protected void loadYearDropDown()
    {
        for (int i = 1982; i <= System.DateTime.Now.Year; i++)
        {
            yearDropDown.Items.Add(i.ToString());
        }
    }
    protected void clearButton_Click(object sender, EventArgs e)
    {
        keyTextBox.Text = "";
        yearDropDown.SelectedIndex = 0;
        typeDropDownList.SelectedIndex = 0;
    }
    protected void yearDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
        {
            int yearSearch = Int32.Parse(yearDropDown.SelectedValue);
            var thesisWithYear = from thesis in myEntities.Past_Thesis
                                where thesis.Year==yearSearch
                                select new { thesis.Thesis_id, thesis.Std_name, thesis.Year, thesis.Title, thesis.Content };
            GridView1.DataSource = thesisWithYear;
            GridView1.DataBind();
        }
    }
}