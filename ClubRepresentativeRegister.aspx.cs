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
    public partial class ClubRepresentativeRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (CLUBNAME.Text != "" && Username.Text != "" && password.Text != "" && Name.Text != "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand CHECKCLUBEXIST = new SqlCommand();
                CHECKCLUBEXIST = new SqlCommand("CHECKCLUBEXIST", conn);
                CHECKCLUBEXIST.CommandType = CommandType.StoredProcedure;
                CHECKCLUBEXIST.Parameters.Add("@CLUBNAME", SqlDbType.VarChar).Value = CLUBNAME.Text;
                SqlParameter EXIST = CHECKCLUBEXIST.Parameters.Add("@EXIST", SqlDbType.Int);
                EXIST.Direction = ParameterDirection.Output;
                conn.Open();
                CHECKCLUBEXIST.ExecuteNonQuery();
                conn.Close();

                if ((int)EXIST.Value == 1)
                {
                    SqlCommand addclubrepr = new SqlCommand();
                    addclubrepr = new SqlCommand("addRepresentative", conn);
                    addclubrepr.CommandType = CommandType.StoredProcedure;
                    if (Username.Text != null)
                    {
                        addclubrepr.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = Username.Text;
                        addclubrepr.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = password.Text;
                        addclubrepr.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name.Text;
                        addclubrepr.Parameters.Add("@CLUB_NAME", SqlDbType.VarChar).Value = CLUBNAME.Text;

                        conn.Open();
                        addclubrepr.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
        }
    }
}