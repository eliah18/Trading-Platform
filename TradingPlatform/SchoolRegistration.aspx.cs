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
    public partial class SchoolReg : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
      
          
            if (IsPostBack)
            {
              

                
            }

        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
       

        protected void AddSchool_Click(object sender, EventArgs e)
        {

          
            string school = "Allan WIlson";

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand("sp_CreateSchool", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@SchoolName", SchoolName.Value);
                    command.Parameters.AddWithValue("@SchlHead", SchlHeadMaster.Value);
                    command.Parameters.AddWithValue("@SchlRep", SchlRep.Value);
                    command.Parameters.AddWithValue("@IntialCash", CashBalance.Value);
                    command.Parameters.AddWithValue("@Country", txtCountry.Value);
                    command.Parameters.AddWithValue("@Province", txtProvince.Value);
                    command.Parameters.AddWithValue("@City", txtCity.Value);
                    command.Parameters.AddWithValue("@Email", EmailTextBox.Value);
                    command.Parameters.AddWithValue("@ContactNo", txtSchlContact.Value);
                    command.Parameters.AddWithValue("@PhyAddress", PhysicalAddress.Value);



                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("~/SchoolRegistration.aspx");



                }
            }
            catch (Exception ex)
            {

                MsgBox("Error: " + ex.Message, this.Page, this);
            }
        }
           
    }
}