<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="TradingPlatform.Transactions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
		<link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/Deals.css") %>' />
	<script type="text/javascript" src='<%# ResolveUrl("~/Content/Deals.js") %>'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
	  <h3 class="section-caption contents-caption">Contents</h3>

	<dx:ASPxTreeView runat="server" ID="TableOfContentsTreeView" ClientInstanceName="tableOfContentsTreeView"
		EnableNodeTextWrapping="true" AllowSelectNode="true" Width="100%" SyncSelectionMode="None" DataSourceID="NodesDataSource">
		<Styles>
			<Elbow CssClass="tree-view-elbow" />
			<Node CssClass="tree-view-node" HoverStyle-CssClass="hovered" />
		</Styles>
		<ClientSideEvents NodeClick="function (s, e) { HideLeftPanelIfRequired(); }" />
	</dx:ASPxTreeView>

	<asp:XmlDataSource ID="NodesDataSource" runat="server" DataFile="~/App_Data/OverviewContents.xml" XPath="//Nodes/*" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightPanelContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">
	  <asp:ScriptManager runat="server" ID="CounterpartyBankDetailsCreate1" />
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" class="vh-100">
		<ContentTemplate>
			<div style="padding-top: 10px; padding-left: 40px">
				<h1 style="color: #1b1c4a">My Transactions</h1>
				<h4 style="color: dimgrey">DETAILS</h4>
				<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
					<Items>
						<dx:LayoutGroup ColCount="2" ColumnCount="2" ColSpan="1" Caption="" GroupBoxDecoration="None">
							<Items>
								<dx:LayoutItem Caption="Start Date" ColSpan="1">
									<LayoutItemNestedControlCollection>
										<dx:LayoutItemNestedControlContainer runat="server">
											<dx:ASPxDateEdit runat="server" ID="dteStartDate" ClientInstanceName="dteStartDate" Name="dteStartDate" AutoPostBack="true"></dx:ASPxDateEdit>
										</dx:LayoutItemNestedControlContainer>
									</LayoutItemNestedControlCollection>
								</dx:LayoutItem>
								<dx:LayoutItem Caption="End Date" ColSpan="1">
									<LayoutItemNestedControlCollection>
										<dx:LayoutItemNestedControlContainer runat="server">
											<dx:ASPxDateEdit runat="server" Control="dteEndDate" ID="dteEndDate" ClientInstanceName="dteEndDate" Name="dteEndDate" AutoPostBack="true"></dx:ASPxDateEdit>
										</dx:LayoutItemNestedControlContainer>
									</LayoutItemNestedControlCollection>
								</dx:LayoutItem>
							</Items>
						</dx:LayoutGroup>
					</Items>
				</dx:ASPxFormLayout>
				<br />
				<dx:ASPxGridView ID="GridView" ClientInstanceName="gridView"
			  CssClass="grid-view" Width="100%"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
					 <Toolbars>
            <dx:GridViewToolbar>
                <SettingsAdaptivity Enabled="true" EnableCollapseRootItemsToIcons="true" />
                <Items>
                    <dx:GridViewToolbarItem Command="ExportToPdf" />
                    <dx:GridViewToolbarItem Command="ExportToXls" />
                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                    <dx:GridViewToolbarItem Command="ExportToDocx" />
                    <dx:GridViewToolbarItem Command="ExportToRtf" />
                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
					  <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
			    <Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
			  <SettingsPager PageSize="15" EnableAdaptivity="true">
				  <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
			  </SettingsPager>
					<Columns>
						<dx:GridViewDataDateColumn FieldName="Value Date" ReadOnly="True" VisibleIndex="0"></dx:GridViewDataDateColumn>
						<dx:GridViewDataTextColumn FieldName="CounterName" VisibleIndex="1"></dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="DealType" VisibleIndex="2"></dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="Debit Amount" ReadOnly="True" VisibleIndex="3"></dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="Credit Amount" ReadOnly="True" VisibleIndex="4"></dx:GridViewDataTextColumn>
						<dx:GridViewDataTextColumn FieldName="Running Balance" ReadOnly="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
					</Columns>
					 <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
				</dx:ASPxGridView>
				<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_Gettransactionview" SelectCommandType="StoredProcedure">
					<SelectParameters>
						<asp:ControlParameter ControlID="ctl00$PageContent$ASPxFormLayout1$dteStartDate" PropertyName="Value" Name="startDate" Type="DateTime"></asp:ControlParameter>
						<asp:ControlParameter ControlID="ctl00$PageContent$ASPxFormLayout1$dteEndDate" PropertyName="Value" Name="endDate" Type="DateTime"></asp:ControlParameter>
					</SelectParameters>
				</asp:SqlDataSource>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
