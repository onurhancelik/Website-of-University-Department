using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class _PasswordRecovery : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
    {
        SmtpClient mySmtpClient = new SmtpClient();
        mySmtpClient.Host = "smtp.gmail.com";
        mySmtpClient.EnableSsl = true;
        mySmtpClient.Port = 587;
        mySmtpClient.Send(e.Message);
        e.Cancel = true;
    }   
}