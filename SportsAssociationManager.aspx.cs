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
    public partial class SportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("login.aspx");
        }

        protected void addNewMatch_Click(object sender, EventArgs e)
        {
            if (hostClubNameAddNewMatch.Text != "" && guestClubNameAddNewMatch.Text != "" && startTimeAddNewMatch.Text != "" && endTimeAddNewMatch.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addclubproc = new SqlCommand();

                addclubproc = new SqlCommand("addNewMatch", conn);
                addclubproc.CommandType = CommandType.StoredProcedure;
                addclubproc.Parameters.Add("@HOST_CLUB_NAME", SqlDbType.VarChar).Value = hostClubNameAddNewMatch.Text;
                addclubproc.Parameters.Add("@SECOND_CLUB_NAME", SqlDbType.VarChar).Value = guestClubNameAddNewMatch.Text;
                addclubproc.Parameters.Add("@STARTING_TIME", SqlDbType.DateTime).Value = startTimeAddNewMatch.Text;
                addclubproc.Parameters.Add("@ENDING_TIME", SqlDbType.DateTime).Value = endTimeAddNewMatch.Text;


                conn.Open();
                addclubproc.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void deleteMatch_Click(object sender, EventArgs e)
        {
            if (hostClubNameDeleteMatch.Text != "" && guestClubNameDeleteMatch.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addclubproc = new SqlCommand();

                addclubproc = new SqlCommand("deleteMatch", conn);
                addclubproc.CommandType = CommandType.StoredProcedure;
                addclubproc.Parameters.Add("@HOST_CLUB_NAME", SqlDbType.VarChar).Value = hostClubNameDeleteMatch.Text;
                addclubproc.Parameters.Add("@SECOND_CLUB_NAME", SqlDbType.VarChar).Value = guestClubNameDeleteMatch.Text;
                //deletematch check it needs start and end time also

                conn.Open();
                addclubproc.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void viewAllUpcomingMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewAllUpcomingMatches.aspx");
        }
        
        protected void viewAlreadyPlayedMatches_Click1(object sender, EventArgs e)
        {
            Response.Redirect("viewAlreadyPlayedMatches.aspx");
        }
    }
}