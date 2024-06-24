using DevExpress.CodeParser;
using DevExpress.Web;
using DevExpress.XtraCharts.Native;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TradingPlatform
{
    public partial class Users : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            School.Visible = false;

            if (IsPostBack)
            {

                if (Role.Text == "Head" || Role.Text == "Representative") { School.Visible = true; }

                else { School.Visible = false; }



            }

        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
     
      

        protected void AddUser_Click(object sender, EventArgs e)
        {

          
            

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand("sp_SystemUser", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", FirstName.Value);
                    command.Parameters.AddWithValue("@Surname", Surname.Value);
                    command.Parameters.AddWithValue("@Username", Username.Value);
                    command.Parameters.AddWithValue("@Password", Password.Value);
                    command.Parameters.AddWithValue("@RoleID", Role.Value);
                    command.Parameters.AddWithValue("@Email", Email.Value);
                    command.Parameters.AddWithValue("@SchoolID", School.Value);



                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("~/Users.aspx");



                }
            }
            catch (Exception ex)
            {

                MsgBox("Error: " + ex.Message, this.Page, this);
            }
        }
           
    }
}