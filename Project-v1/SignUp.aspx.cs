using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Web.Security;
using BitirmeTeziDatabaseModel;

public partial class _SignUp : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Panel ogrPanel = (Panel)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ogrPanel");
        Panel akaPanel = (Panel)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("akaPanel");
        ogrPanel.Visible = false;
        akaPanel.Visible = false;
        SetFormRole();
    }
    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetFormRole();
    }
    protected void CreateUserWizard1_SendingMail(object sender, MailMessageEventArgs e)
    {
        SmtpClient mySmtpClient = new SmtpClient();
        mySmtpClient.Host = "smtp.gmail.com";
        mySmtpClient.EnableSsl = true;
        mySmtpClient.Port = 587;
        mySmtpClient.Send(e.Message);
        e.Cancel = true;
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        RadioButtonList rbl = (RadioButtonList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonList1");
        String user = CreateUserWizard1.UserName;
        if (rbl.SelectedIndex == 0)
        {
            Roles.AddUserToRole(user, "Students");

            using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
            {
                Student newStd = new Student();
                newStd.Username = CreateUserWizard1.UserName;
                newStd.Name = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("NameTextBox")).Text;
                newStd.Phone = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TelTextBox")).Text;
                newStd.Std_no = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("NoTextBox")).Text;
                newStd.Email = CreateUserWizard1.Email;
                myEntities.AddToStudents(newStd);
                myEntities.SaveChanges();
            }
        }
        else
        {
            Roles.AddUserToRole(user, "Teachers");

            using (BitirmeTeziDatabaseEntities myEntities = new BitirmeTeziDatabaseEntities())
            {
                  Academic newAcd = new Academic();
                newAcd.Username = CreateUserWizard1.UserName;
                newAcd.Name = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("NameTextBox")).Text;
                newAcd.Phone = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("TelTextBox")).Text;
                newAcd.Education = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("EduTextBox")).Text;
                newAcd.Email = CreateUserWizard1.Email;
                newAcd.Interests = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("IntTextBox")).Text;
                myEntities.AddToAcademics(newAcd);
                myEntities.SaveChanges();
            }    
        }
    }

    protected void SetFormRole()
    {
        RadioButtonList rbl = (RadioButtonList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RadioButtonList1");
        if (rbl.SelectedIndex == 0)
        {
            Panel ogrPanel = (Panel)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ogrPanel");
            Panel akaPanel = (Panel)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("akaPanel");
            ogrPanel.Visible = true;
            akaPanel.Visible = false;
        }
        else
        {
            Panel ogrPanel = (Panel)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ogrPanel");
            Panel akaPanel = (Panel)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("akaPanel");
            ogrPanel.Visible = false;
            akaPanel.Visible = true;
        }
    }
}