using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;

public partial class About_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (txtPhone.Text.Length >= 10)
            args.IsValid = true;
        else
            args.IsValid = false;
    }


    protected void btnValidate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblValidation.Visible = true;
        }
    }
    
}