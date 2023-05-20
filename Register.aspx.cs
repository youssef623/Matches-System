using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseMilestone3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FanRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("FanRegister.aspx");
        }
        
        protected void SportsAssociationManagerRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("SportsAssociationManagerRegister.aspx");
        }

        protected void ClubRepresentativeRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClubRepresentativeRegister.aspx");
        }

        protected void StadiumManagerRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("StadiumManagerRegister.aspx");
        }
    }
}