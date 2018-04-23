using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default: System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (cb.Checked)
            masterDataSource.SelectCommand = "SELECT * FROM [Products] AS t1 WHERE EXISTS (SELECT [OrderID] FROM [Order Details] AS t2 WHERE (t2.ProductID = t1.ProductID))";
        else
            masterDataSource.SelectCommand = "SELECT * FROM [Products]";
        grid.DataBind();

    }
    protected void detailGrid_DataSelect(object sender, EventArgs e) {
        Session["ProductID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }

}