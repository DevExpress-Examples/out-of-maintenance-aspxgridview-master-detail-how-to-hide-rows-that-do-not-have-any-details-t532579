Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If cb.Checked Then
            masterDataSource.SelectCommand = "SELECT * FROM [Products] AS t1 WHERE EXISTS (SELECT [OrderID] FROM [Order Details] AS t2 WHERE (t2.ProductID = t1.ProductID))"
        Else
            masterDataSource.SelectCommand = "SELECT * FROM [Products]"
        End If
        grid.DataBind()

    End Sub
    Protected Sub detailGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("ProductID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

End Class