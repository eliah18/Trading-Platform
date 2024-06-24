using System;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;
using DevExpress.XtraCharts.Native;
using TradingPlatform.Model;
using System.Configuration;
using DevExpress.XtraScheduler.Outlook.Native;
using System.Web;

namespace TradingPlatform {
    public partial class SignInModule : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString);
        protected void SignInButton_Click(object sender, EventArgs e) {
            FormLayout.FindItemOrGroupByName("GeneralError").Visible = false;
            conn.Open();

            SqlCommand cmd = new SqlCommand("select name,surname, username,role_id,SchoolID,active from [SystemUsers] where username='" + UserNameTextBox.Text + "' and password = '"+ PasswordButtonEdit.Text + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet("ds");
            da.Fill(ds);

            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string NAME = dr["name"].ToString();
                    string Surname = dr["surname"].ToString();
                    HttpContext.Current.Session["User"] = dr["username"].ToString();
                    string role = dr["role_id"].ToString();
                    string SchoolID = dr["SchoolID"].ToString();
                    string active = dr["active"].ToString();
                    Response.Redirect("~/Deal.aspx");
                }
            }
            else {
                GeneralErrorDiv.InnerText = "Invalid login attempt.";
                FormLayout.FindItemOrGroupByName("GeneralError").Visible = true;

            }
            conn.Close();

           
            
        }
    }
}