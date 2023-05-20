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
    public partial class ClubRepresentive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("login.aspx");
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand CLUB_REP_CLUB_INFO = new SqlCommand();

            CLUB_REP_CLUB_INFO = new SqlCommand("CLUB_REP_CLUB_INFO", conn);
            CLUB_REP_CLUB_INFO.CommandType = CommandType.StoredProcedure;
            CLUB_REP_CLUB_INFO.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = Session["user"];
            
            conn.Open();
            SqlDataReader rdr = CLUB_REP_CLUB_INFO.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string clubname = rdr.GetString(rdr.GetOrdinal("NAME"));
                Session["club_name"] = clubname;
                string location = rdr.GetString(rdr.GetOrdinal("LOCATION"));
                Label club_info = new Label();
                club_info.Text = "<strong>  CLub name : </strong>:: " + clubname + "<br> <strong>location : </strong>" + location + "<br> <br>";
                form1.Controls.Add(club_info);
            }
            conn.Close();
        }

        protected void upcomingMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpcomingMatchesClubRepresentive.aspx");
        }

        protected void availablestadiums_Click(object sender, EventArgs e)
        {
            if (dateViewAvailablestadiums.Text != "")
            {
                Session["datetime"] = dateViewAvailablestadiums.Text;
                Response.Redirect("availablestadiums.aspx");
            }
        }

        protected void sendRequest_Click(object sender, EventArgs e)
        {
            if(stadiumname.Text != "" && date.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addHostRequest = new SqlCommand();

                addHostRequest = new SqlCommand("addHostRequest", conn);
                addHostRequest.CommandType = CommandType.StoredProcedure;
                addHostRequest.Parameters.Add("@CLUBNAME", SqlDbType.VarChar).Value = Session["club_name"];
                addHostRequest.Parameters.Add("@STADIUM_NAME", SqlDbType.VarChar).Value = stadiumname.Text;
                addHostRequest.Parameters.Add("@DATETIME", SqlDbType.DateTime).Value = date.Text;
                conn.Open();
                addHostRequest.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}