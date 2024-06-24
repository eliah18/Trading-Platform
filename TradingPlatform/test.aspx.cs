using DevExpress.Web;
using System.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TradingPlatform.Model;
using System.Web.Services;
using System.Diagnostics;

namespace TradingPlatform
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void GridView_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "DealTotal")
            {
                decimal price = (decimal)e.GetListSourceFieldValue("Price");
                int quantity = Convert.ToInt32(e.GetListSourceFieldValue("Quantity"));
                e.Value = price * quantity;
            }
        }

        [WebMethod]
        public static string ProcessRequest(string comboValue, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GSEQConnectionString"].ConnectionString);
            string val = "";
          
            conn.Open();

            SqlCommand cmd = new SqlCommand("select [Offer Price] as OfferPrice from tblCounterPrices where [Short Name]='"+ comboValue + "'", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet("ds");
            da.Fill(ds);

            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    val = dr["OfferPrice"].ToString();
                }
            }
            conn.Close();

            //some logic to find a value in the database based on a selected combo value 
            e.NewValues["Price"] = val;
            
            return val;
        }
        protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["SchoolName"] = "Allan WIlson";
            e.NewValues["ValueDate"] = DateTime.Now;
        }

        protected void GridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters == "delete")
            {
                List<long> selectedIds = GridView.GetSelectedFieldValues("Id").ConvertAll(id => (long)id);
                DataProvider.DeleteIssues(selectedIds);
                GridView.DataBind();
            }

        }
     



        }
}