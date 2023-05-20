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
    public partial class Manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Session["club_name"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand stadiumInfo = new SqlCommand();
            stadiumInfo = new SqlCommand("stadiumInfo", conn);
            stadiumInfo.CommandType = CommandType.StoredProcedure;
            stadiumInfo.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = Session["user"];
            conn.Open();
            SqlDataReader rdr = stadiumInfo.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string stadium_name = rdr.GetString(rdr.GetOrdinal("NAME"));
                Session["club_name"] = stadium_name;
                string location = rdr.GetString(rdr.GetOrdinal("LOCATION"));
                Int32 capacity = rdr.GetInt32(rdr.GetOrdinal("CAPACITY"));
                //Boolean status = rdr.IsDBNull(rdr.GetOrdinal("status")) ? null : rdr.GetBoolean(rdr.GetOrdinal("status"));
                
                Label stadium_info = new Label();
                stadium_info.Text = "<strong>  Stadium name : </strong>:: " + stadium_name + "<br> <strong>location : </strong>" + location + "<br> <strong>capacity : </strong>" + capacity  + "<br> <br>";
                form1.Controls.Add(stadium_info);
            }
            conn.Close();
        }

        protected void AcceptRequestButton_Click(object sender, EventArgs e)
        {
            if (HostNameAccept.Text!= "" && GuestNameAccept.Text != "" && DateTimeAccept.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand acceptRequest = new SqlCommand();

                acceptRequest = new SqlCommand("acceptRequest", conn);
                acceptRequest.CommandType = CommandType.StoredProcedure;
                acceptRequest.Parameters.Add("@STADIUM_MANAGER_USERNAME", SqlDbType.VarChar).Value = Session["user"];
                acceptRequest.Parameters.Add("@HOST_NAME", SqlDbType.VarChar).Value = HostNameAccept.Text;
                acceptRequest.Parameters.Add("@COMPETING_CLUB_NAME", SqlDbType.VarChar).Value = GuestNameAccept.Text;
                acceptRequest.Parameters.Add("@DATETIME", SqlDbType.DateTime).Value = DateTimeAccept.Text;


                conn.Open();
                acceptRequest.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void RejectRequestButton_Click(object sender, EventArgs e)
        {
            if (HostNameReject.Text != "" && GuestNameReject.Text != "" && DateTimeReject.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand rejectRequest = new SqlCommand();

                rejectRequest = new SqlCommand("rejectRequest", conn);
                rejectRequest.CommandType = CommandType.StoredProcedure;
                rejectRequest.Parameters.Add("@STADIUM_MANAGER_USERNAME", SqlDbType.VarChar).Value = Session["user"];
                rejectRequest.Parameters.Add("@HOST_NAME", SqlDbType.VarChar).Value = HostNameReject.Text;
                rejectRequest.Parameters.Add("@COMPETING_CLUB_NAME", SqlDbType.VarChar).Value = GuestNameReject.Text;
                rejectRequest.Parameters.Add("@DATETIME", SqlDbType.DateTime).Value = DateTimeReject.Text;


                conn.Open();
                rejectRequest.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void viewAllRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewAllRequests.aspx");
        }
    }
}