using DevExpress.Web.Internal;
using DevExpress.XtraCharts.Native;
using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace TradingPlatform
{
    public partial class FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["GSEQConnectionString"].ConnectionString);
        protected void btnsave_click(object sender, EventArgs e)
        {
            StringBuilder sb= new StringBuilder();

         
            
            lblmessage.Text= FileUpload1.FileName;
            if (FileUpload1.HasFile)
            {

                lblmessage.Text = FileUpload1.FileName;
                int count = 1;
                string excelconnectionString = "";

                string fileName2 = Path.GetFileName(FileUpload1.PostedFile.FileName);


                string fileLocation = Server.MapPath("~/uploads/uploads_" + DateTime.Now.ToString("ddMMyyyymmsss") + fileName2);
                FileUpload1.SaveAs(fileLocation);
                string fileExtension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                if (fileExtension == ".xls")
                    excelconnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 8.0;HDR=No;IMEX=1\"";
                else if (fileExtension == ".xlsx")
                    excelconnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 12.0;HDR=No;IMEX=1\"";
                else
                {
                    lblmessage.Text = "Inavalid File"; 
                    return;
                }
                // Create OleDB Connection and OleDb Command
                DataTable dtExcel = new DataTable();
                OleDbConnection con = new OleDbConnection(excelconnectionString);
                string query = "Select * from [Sheet1$]  ";
                OleDbDataAdapter data = new OleDbDataAdapter(query, con);
                data.Fill(dtExcel);
                for (int i = 1; i < dtExcel.Rows.Count; i++)
                {
                    {
                        try
                        {

                            conn.Close();
                            conn.Open();
                            SqlCommand cmd = new SqlCommand("insert into tblCounterPrices([Short Name],[Bid Price],[Offer Price],Price,PriceDate,DateCreated) values('" + dtExcel.Rows[i][1] + "', '" + dtExcel.Rows[i][2] + "','" + dtExcel.Rows[i][3] + "','" + dtExcel.Rows[i][4] + "','" + dtExcel.Rows[i][0] + "',getdate())", conn);
                            if ((conn.State == ConnectionState.Open))
                            {
                                count = count + cmd.ExecuteNonQuery();
                            }
                        }
                        catch (Exception ex)
                        {

                            throw ex;
                        }

                    }

                }
                if (count == dtExcel.Rows.Count)
                {
                    lblmessage.Text = "Upload Success";

                }
                else
                {
                    lblmessage.Text = "Not Done"; 

                }
            }
            else
            {

                lblmessage.Text = "Please Browser and Select File";
            }



        }
    }
}