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
    public partial class FanRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (Username.Text != "" && password.Text != "" && Name.Text!= "" && nationalidnumber.Text != "" && birthdate.Text != "" && address.Text != "" && phonenumber.Text!= "")
            {
                string connStr = WebConfigurationManager.ConnectionStrings["Milestone3"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand addclubproc = new SqlCommand();

                addclubproc = new SqlCommand("addFan", conn);
                addclubproc.CommandType = CommandType.StoredProcedure;
                if (Username.Text != null)
                {
                    addclubproc.Parameters.Add("@USERNAME", SqlDbType.VarChar).Value = Username.Text;
                    addclubproc.Parameters.Add("@PASSWORD", SqlDbType.VarChar).Value = password.Text;
                    addclubproc.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name.Text;
                    addclubproc.Parameters.Add("@NATIONAL_ID_NUMBER", SqlDbType.VarChar).Value = nationalidnumber.Text;
                    addclubproc.Parameters.Add("@BIRTHDATE", SqlDbType.VarChar).Value = birthdate.Text;
                    addclubproc.Parameters.Add("@ADDRESS", SqlDbType.VarChar).Value = address.Text;
                    addclubproc.Parameters.Add("@PHONE_NUMBER", SqlDbType.VarChar).Value = phonenumber.Text;

                    conn.Open();
                    addclubproc.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }
    }
}