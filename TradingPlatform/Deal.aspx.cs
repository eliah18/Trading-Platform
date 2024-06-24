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
    public partial class Deal : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ValueDate.Value = DateTime.Now; 
          
            if (IsPostBack)
            {

               
                if (DealType.Value != null && CounterName.Value != null) 
                {
                    
                    GetPrice(DealType.Text, CounterName.Text);
                }
                if (Quantity.Value != null) 
                {
                    string qnty = Quantity.Text;
                    string price = Price.Text;
                    CalcDealTotal(qnty, price,DealType.Text.ToString());
                }

                
            }

        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        public void GetPrice(string Deal,string Counter)
        {
            if (Deal == "Sell")
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("select BidPrice   from CounterPrices where [ShortName]='" + Counter + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet("ds");
                da.Fill(ds);

                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Price.Value = dr["BidPrice"].ToString();
                    }
                }
                conn.Close();
            }

            else
            {

                conn.Open();

                SqlCommand cmd = new SqlCommand("select OfferPrice  from CounterPrices where [ShortName]='" + Counter + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet("ds");
                da.Fill(ds);

                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        Price.Value = dr["OfferPrice"].ToString();
                    }
                }
                conn.Close();
            }
          
        }
        public void CalcDealTotal(string qntity,string myprice,string Deal) {
            double Qntity = Convert.ToDouble(qntity);
            double myPrice = Convert.ToDouble(myprice);
            if (Deal == "Sell") {

                

                DealTotal.Value =  Qntity * (myPrice - (myPrice * 0.02)); 
            }

            else if (Deal == "Purchase") { DealTotal.Value = Qntity * (myPrice + (myPrice * 0.02)); }
           
       
        }

        protected void AddDeal_Click(object sender, EventArgs e)
        {

          
            int school = 1;

            try
            {
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["VETDBConnectionString"].ConnectionString))
                {
                    SqlCommand command = new SqlCommand("sp_CreateDeal", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@SchoolID", school);
                    command.Parameters.AddWithValue("@CounterID", CounterName.Value);
                    command.Parameters.AddWithValue("@DealType", DealType.Value);
                    command.Parameters.AddWithValue("@Quantity", Quantity.Value);
                    command.Parameters.AddWithValue("@Price", Price.Value);
                    command.Parameters.AddWithValue("@DealTotal", DealTotal.Value);


                    conn.Open();
                    command.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("~/Deal.aspx");



                }
            }
            catch (Exception ex)
            {

                MsgBox("Error: " + ex.Message, this.Page, this);
            }
        }
           
    }
}