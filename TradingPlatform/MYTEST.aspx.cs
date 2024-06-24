using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TradingPlatform
{
    public partial class MYTEST : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mext.Text = "Hello World";
          
        }
        protected void ASPxGridView1_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {

        }

        [WebMethod]
        public static string ProcessRequest(string comboValue)
        {
            string val = comboValue;
            //some logic to find a value in the database based on a selected combo value 
            return "newvalue" + val;
        }
    }
}