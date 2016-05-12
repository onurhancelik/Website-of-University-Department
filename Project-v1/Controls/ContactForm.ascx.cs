using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;

public partial class Controls_ContactForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!string.IsNullOrEmpty(businessTextBox.Text) || !string.IsNullOrEmpty(mobileTextBox.Text))
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void sendButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string fileName = Server.MapPath("~/App_Data/ContactForm.txt");
            string mailBody = File.ReadAllText(fileName);

            mailBody = mailBody.Replace("##Name##", nameTextBox.Text);
            mailBody = mailBody.Replace("##Email##", emailTextBox.Text);
            mailBody = mailBody.Replace("##BusinessPhone##", businessTextBox.Text);
            mailBody = mailBody.Replace("##MobilePhone##", mobileTextBox.Text);
            mailBody = mailBody.Replace("##Subject##", subjectTextBox.Text);
            mailBody = mailBody.Replace("##Description##", descriptionTextBox.Text);

            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "Web sitenizden bir istek var";
            myMessage.Body = mailBody;
            myMessage.From = new MailAddress("bilmuh.tez@gmail.com", "Sender Name");
            myMessage.To.Add(new MailAddress("bilmuh.tez@gmail.com", "Receiver Name"));

            SmtpClient mySmtpClient =new SmtpClient();
            mySmtpClient.Host="smtp.gmail.com";
            mySmtpClient.EnableSsl =true;
            mySmtpClient.Port=587;
            mySmtpClient.Send(myMessage);
            Message.Visible=true;
            FormTable.Visible=false;
            System.Threading.Thread.Sleep(5000);
        }
    }
}