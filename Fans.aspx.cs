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
    public partial class Fans : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] == null)
            {
                Response.Redirect("LOGIN.aspx");
            }
            string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand getNationalid = new SqlCommand("getNationalid", conn);
            getNationalid.CommandType = CommandType.StoredProcedure;
            getNationalid.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = Session["user"];

            SqlParameter nationalid = getNationalid.Parameters.Add("@NATIONAL_ID", SqlDbType.VarChar,20);
            nationalid.Direction = ParameterDirection.Output;

            conn.Open();
            getNationalid.ExecuteNonQuery();
            conn.Close();
            Session["nationalId"] = nationalid.Value.ToString();
        }

        protected void purchaseTicket_Click(object sender, EventArgs e)
        {
            if (Session["nationalId"] != null && hostName.Text != "" && competingClubName.Text != "" && datetimePurchaseTicket.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand purchaseTicket = new SqlCommand("purchaseTicket", conn);
                purchaseTicket.CommandType = CommandType.StoredProcedure;
                purchaseTicket.Parameters.Add("@NATIONAL_ID", SqlDbType.VarChar).Value = Session["nationalId"];
                purchaseTicket.Parameters.Add("@HOST_CLUB_NAME", SqlDbType.VarChar).Value = hostName.Text;
                purchaseTicket.Parameters.Add("@COMPETING_CLUB_NAME", SqlDbType.VarChar).Value = competingClubName.Text;
                purchaseTicket.Parameters.Add("@DATETIME", SqlDbType.DateTime).Value = datetimePurchaseTicket.Text;

                conn.Open();
                purchaseTicket.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void viewAvailabletickets_Click1(object sender, EventArgs e)
        {
            if (date.Text != "")
            {
                Session["datetimeviewavailableticket"] = date.Text;
                Response.Redirect("viewAvailabletickets.aspx");
            }
        }
    }
}