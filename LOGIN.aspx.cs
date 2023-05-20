using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseMilestone3
{
    public partial class LOGIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void SIGNIN_Click1(object sender, EventArgs e)
        {
            if (USERNAME.Text != "" && PASSWORD.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                string username = USERNAME.ToString();
                string password = PASSWORD.ToString();
                SqlCommand loginproc = new SqlCommand("USERLOGIN", conn);
                loginproc.CommandType = CommandType.StoredProcedure;
                loginproc.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = USERNAME.Text;
                loginproc.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = PASSWORD.Text;

                SqlParameter success = loginproc.Parameters.Add("@SUCESS", SqlDbType.Int);
                SqlParameter view = loginproc.Parameters.Add("@VIEW", SqlDbType.Int);
                view.Direction = ParameterDirection.Output;
                success.Direction = ParameterDirection.Output;

                conn.Open();
                loginproc.ExecuteNonQuery();
                conn.Close();


                if ((int)success.Value == 1)
                {
                    Session["user"] = USERNAME.Text;
                    switch (((int)view.Value))
                    {
                        case 1: Response.Redirect("SYSTEMADMIN.aspx"); break;
                        case 2: Response.Redirect("SportsAssociationManager.aspx"); break;
                        case 3: Response.Redirect("ClubRepresentive.aspx"); break;
                        case 4: Response.Redirect("Manager.aspx"); break;
                        case 5: Response.Redirect("Fans.aspx"); break;
                        default: Response.Redirect("login.aspx"); break;
                    }
                }
            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}