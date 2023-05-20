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
    public partial class viewAvailabletickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("login.aspx");
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand availabletickets = new SqlCommand();

            availabletickets = new SqlCommand("availabletickets", conn);
            availabletickets.CommandType = CommandType.StoredProcedure;
            availabletickets.Parameters.Add("@DATETIME", SqlDbType.VarChar).Value = Session["datetimeviewavailableticket"];

            

            conn.Open();
            SqlDataReader rdr = availabletickets.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string hostName = rdr.GetString(rdr.GetOrdinal("Host club"));
                string guestName = rdr.GetString(rdr.GetOrdinal("Guest CLub"));
                string stadiumName = rdr.GetString(rdr.GetOrdinal("stadium name"));
                string stadiumLocation = rdr.GetString(rdr.GetOrdinal("stadium location"));
                Label Match = new Label();
                Match.Text = "<strong> <mark> Match </mark></strong>:: <br>  Host Name : " + hostName + "<br> Guest Name : " + guestName + "<br> stadium Name : " + stadiumName + "<br> stadium Location : " + stadiumLocation + "<br> <br>";
                form1.Controls.Add(Match);
            }
            conn.Close();

        }
    }
}