<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="TradingPlatform.test" %>



<asp:Content runat="server" ContentPlaceHolderID="Head">
	<link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/Deals.css") %>' />
	<script type="text/javascript" src='<%# ResolveUrl("~/Content/Deals.js") %>'></script>
		<script>
			
			
			var curentEditingIndex;
			var comboValue = null;
			var myEmpty = "select text";
			function OnBatchEditStartEditing(s, e) {
				curentEditingIndex = e.visibleIndex;
			}

			function OnLostFocus(s, e) {
				if (s.GetValue() == null) {
					myPrice.SetText(myEmpty);
					
					
				}
				else {

					comboValue = s.GetText();
					PageMethods.ProcessRequest(comboValue, e,MyMethod_Result);
				}
			   
			   
			}  
			function MyMethod_Result(ResultString) {
				
				myPrice.SetText(ResultString);
				
					
			   
			}
			var curentEditingIndex;
			function onBatchEditStartEditing(s, e) {
				curentEditingIndex = e.visibleIndex;
			}
			function onGridViewSelectionChanged(s, e) {
				var qnty = myQuantity.GetValue();
				var price = myPrice.GetValue();
				var total=price * qnty;
				myDealTotal.SetText(total);
			}
		</script>
	
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageToolbar">
	<dx:ASPxMenu runat="server" ID="PageToolbar" ClientInstanceName="pageToolbar"
		ItemAutoWidth="false" ApplyItemStyleToTemplates="true" ItemWrap="false"
		AllowSelectItem="false" SeparatorWidth="0"
		Width="100%" CssClass="page-toolbar">
		<ClientSideEvents ItemClick="onPageToolbarItemClick" />
		<SettingsAdaptivity Enabled="true" EnableAutoHideRootItems="true"
			EnableCollapseRootItemsToIcons="true" CollapseRootItemsToIconsAtWindowInnerWidth="600" />
		<ItemStyle CssClass="item" VerticalAlign="Middle" />
		<ItemImage Width="16px" Height="16px" />
		<Items>
			<dx:MenuItem Enabled="false">
				<Template>
					<h1>Grid View</h1>
				</Template>
			</dx:MenuItem>
			<dx:MenuItem Name="New" Text="New" Alignment="Right" AdaptivePriority="2">
				<Image Url="Content/Images/add.svg" />
			</dx:MenuItem>
			<dx:MenuItem Name="Edit" Text="Edit" Alignment="Right" AdaptivePriority="2">
				<Image Url="Content/Images/edit.svg" />
			</dx:MenuItem>
			<dx:MenuItem Name="Delete" Text="Delete" Alignment="Right" AdaptivePriority="2">
				<Image Url="Content/Images/delete.svg" />
			</dx:MenuItem>
			<dx:MenuItem Name="Export" Text="Export" Alignment="Right" AdaptivePriority="2">
				<Image Url="Content/Images/export.svg" />
			</dx:MenuItem>
			<dx:MenuItem Name="ToggleFilterPanel" Text="" GroupName="Filter" Alignment="Right" AdaptivePriority="1">
				<Image Url="Content/Images/search.svg" UrlChecked="Content/Images/search-selected.svg" />
			</dx:MenuItem>
		</Items>
	</dx:ASPxMenu>
	<dx:ASPxPanel runat="server" ID="FilterPanel" ClientInstanceName="filterPanel"
		Collapsible="true" CssClass="filter-panel">
		<SettingsCollapsing ExpandEffect="Slide" AnimationType="Slide" ExpandButton-Visible="false" />
		<PanelCollection>
			<dx:PanelContent>
				<dx:ASPxButtonEdit runat="server" ID="SearchButtonEdit" ClientInstanceName="searchButtonEdit" ClearButton-DisplayMode="Always" Caption="Search" Width="100%" />
			</dx:PanelContent>
		</PanelCollection>
		<ClientSideEvents Expanded="onFilterPanelExpanded" Collapsed="adjustPageControls" />
	</dx:ASPxPanel>
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="PageContent" runat="server">
	<asp:ScriptManager runat="server" ID="CounterpartyBankDetailsCreate1" EnablePageMethods="true" />
	
	<dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView" EnablePagingGestures="False"
		CssClass="grid-view" Width="100%"
		DataSourceID="SqlDataSource3"
		OnCustomCallback="GridView_CustomCallback"
		OnInitNewRow="GridView_InitNewRow" AutoGenerateColumns="False" KeyFieldName="ID">


		<SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
		<SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" />

		<SettingsSearchPanel CustomEditorID="SearchButtonEdit" />
		<Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
		<SettingsPager PageSize="15" EnableAdaptivity="true">
			<PageSizeItemSettings Visible="true"></PageSizeItemSettings>
		</SettingsPager>
		<SettingsExport EnableClientSideExportAPI="true" ExportSelectedRowsOnly="true" />
		<SettingsPopup>
			<EditForm>
				<SettingsAdaptivity MaxWidth="800" Mode="Always" VerticalAlign="WindowCenter" />
			</EditForm>
		</SettingsPopup>
		<EditFormLayoutProperties UseDefaultPaddings="false">
			<Styles LayoutItem-Paddings-PaddingBottom="8" />
			<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600">
			</SettingsAdaptivity>

		</EditFormLayoutProperties>
		<Columns>
			<dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
				<EditFormSettings Visible="false"></EditFormSettings>
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="SchoolName" VisibleIndex="1" ReadOnly="True"></dx:GridViewDataTextColumn>
			<dx:GridViewDataDateColumn FieldName="ValueDate" VisibleIndex="2" ReadOnly="True"></dx:GridViewDataDateColumn>
				<dx:GridViewDataComboBoxColumn FieldName="DealType" Visible="True" Caption="DealType" >
				<PropertiesComboBox ValueField="DealTypeID" TextField="DealType" ValueType="System.Int64"  DataSourceID="DealTypesDataSource">
					<ItemImage Width="32" Height="32" />
					<ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
				   
				</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>
			 <dx:GridViewDataComboBoxColumn FieldName="CounterName" Visible="True" Caption="CounterName">
				<PropertiesComboBox ValueField="CounterID" TextField="CounterName" ValueType="System.Int64"  DataSourceID="CountersDataSource">
					<ItemImage Width="32" Height="32" />
					<ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"></ValidationSettings>
					 <ClientSideEvents LostFocus="OnLostFocus"  />
					</PropertiesComboBox>
			</dx:GridViewDataComboBoxColumn>

<dx:GridViewDataTextColumn FieldName="Price"   VisibleIndex="4" >
				 <PropertiesTextEdit ClientInstanceName="myPrice" EnableClientSideAPI="true" />  
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="6">
			</dx:GridViewDataTextColumn>
			<dx:GridViewDataTextColumn FieldName="DealTotal" ReadOnly="True" VisibleIndex="7">
			</dx:GridViewDataTextColumn>
		</Columns>

		<Styles>
			<Cell Wrap="false" />
			<PagerBottomPanel CssClass="pager" />
			<FocusedRow CssClass="focused" />
		</Styles>
		<ClientSideEvents Init="onGridViewInit" SelectionChanged="onGridViewSelectionChanged" />
	</dx:ASPxGridView>

	<asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:GSEQConnectionString2 %>' InsertCommand="spPurchaseDealCreate" InsertCommandType="StoredProcedure" SelectCommand="spDealsView" SelectCommandType="StoredProcedure">
		<InsertParameters>
			<asp:Parameter Name="SchoolName" Type="String"></asp:Parameter>
			<asp:Parameter Name="CounterName" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="DealType" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="Quantity" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
		</InsertParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:GSEQConnectionString2 %>' SelectCommand="spDealsView" SelectCommandType="StoredProcedure" InsertCommand="spPurchaseDealCreate" InsertCommandType="StoredProcedure">
		<InsertParameters>
			<asp:Parameter Name="SchoolName" Type="String"></asp:Parameter>
			<asp:Parameter Name="Counter" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="DealType"></asp:Parameter>
			<asp:Parameter Name="Quantity"></asp:Parameter>
			<asp:Parameter Name="Price"></asp:Parameter>
		</InsertParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:GSEQConnectionString2 %>' SelectCommand="spDealsView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
	<asp:ObjectDataSource ID="GridViewDataSource" runat="server" DataObjectTypeName=" TradingPlatform.Model.Issue"
		TypeName=" TradingPlatform.Model.DataProvider"
		SelectMethod="GetIssues" InsertMethod="AddNewIssue" UpdateMethod="UpdateIssue"></asp:ObjectDataSource>

	<asp:ObjectDataSource ID="ContactsDataSource" runat="server" DataObjectTypeName=" TradingPlatform.Model.Contact"
		TypeName=" TradingPlatform.Model.DataProvider"
		SelectMethod="GetContacts"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="DealTypesDataSource" runat="server"
		TypeName=" TradingPlatform.Model.DataProvider"
		SelectMethod="GetDealTypes" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
	<asp:ObjectDataSource ID="CountersDataSource" runat="server"
		TypeName=" TradingPlatform.Model.DataProvider"
		SelectMethod="GetCountersDropDown" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="LeftPanelContent">
	<h3 class="leftpanel-section section-caption">School Details</h3>
	<dx:ASPxNavBar runat="server" ID="FiltersNavBar" ClientInstanceName="filtersNavBar"
		AllowSelectItem="true" ShowGroupHeaders="false"
		Width="100%" CssClass="filters-navbar">
		<ItemStyle CssClass="item" />
		<Groups>
			<dx:NavBarGroup>
				<Items>
					<dx:NavBarItem Text="All" Selected="true" Name="All" />
					<dx:NavBarItem Text="Econet" Name="Econet" />
					<dx:NavBarItem Text="Delta" Name="Delta" />
					<dx:NavBarItem Text="Sell" Name="Sell" />
					<dx:NavBarItem Text="Purchase" Name="Purchase" />
				</Items>
			</dx:NavBarGroup>
		</Groups>
		<ClientSideEvents ItemClick="onFiltersNavBarItemClick" />
	</dx:ASPxNavBar>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="RightPanelContent">
	
</asp:Content>
