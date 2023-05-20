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
    public partial class availablestadiums : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["datetime"] == null)
            {
                Response.Redirect("ClubRepresentive.aspx");
            }
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand availablestadiumsproc = new SqlCommand();

            availablestadiumsproc = new SqlCommand("availablestadiumsproc", conn);
            availablestadiumsproc.CommandType = CommandType.StoredProcedure;
            availablestadiumsproc.Parameters.Add("@datetime", SqlDbType.DateTime).Value = Session["datetime"];

            

            conn.Open();
            SqlDataReader rdr = availablestadiumsproc.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string stadiumName = rdr.GetString(rdr.GetOrdinal("name"));
                string location = rdr.GetString(rdr.GetOrdinal("location"));
                int capacity = rdr.GetInt32(rdr.GetOrdinal("capacity"));
                Label Match = new Label();
                Match.Text = "<strong> <mark> stadium name </mark></strong>:: " + stadiumName + "<br> location : " + location + "<br> capacity : " + capacity + "<br> <br>";
                form1.Controls.Add(Match);
            }
            conn.Close();
        }
    }
}