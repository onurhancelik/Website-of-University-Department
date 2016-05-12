using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _ThesisExtendView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string filePath = "~/Documents/" + "ukts14.doc";
        if (filePath != String.Empty)
        {
            Response.ContentType = "doc/docx";
            Response.AddHeader("Content-Disposition", "attachment;filename=\"" + "akts14.doc" + "\"");
            Response.TransmitFile(Server.MapPath(filePath));
            Response.End();
        }   
    }
}