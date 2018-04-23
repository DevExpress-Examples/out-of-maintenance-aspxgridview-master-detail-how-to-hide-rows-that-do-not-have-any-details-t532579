<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView - Master-detail - How to hide rows that do not have any details from the master grid</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxCheckBox ID="cb" runat="server" Text="Show only rows that have detail data" AutoPostBack="true">
        </dx:ASPxCheckBox>
        <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="masterDataSource"
            Width="100%" AutoGenerateColumns="False" KeyFieldName="ProductID">
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detailGrid" runat="server" DataSourceID="detailDataSource" KeyFieldName="OrderID"
                        Width="100%" OnBeforePerformDataSelect="detailGrid_DataSelect" AutoGenerateColumns="False">
                        <Settings ShowFooter="True" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="OrderID" ReadOnly="True" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="1" ReadOnly="True">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Discount" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
            <SettingsDetail ShowDetailRow="true" />

            <Columns>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="0">
                    <SettingsHeaderFilter>
                        <DateRangePickerSettings EditFormatString="" />
                    </SettingsHeaderFilter>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="9">
                </dx:GridViewDataCheckColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:AccessDataSource ID="masterDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] &lt; ?)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="ProductID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <%--    <asp:AccessDataSource ID="detailDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Products] Where CategoryID = ?">
            <SelectParameters>
                <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>--%>
        <asp:AccessDataSource ID="detailDataSource" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Order Details] Where ProductID = ?">
            <SelectParameters>
                <asp:SessionParameter Name="ProductID" SessionField="ProductID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>