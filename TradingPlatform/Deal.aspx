<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="Deal.aspx.cs" Inherits="TradingPlatform.Deal" %>
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
	 <asp:ScriptManager runat="server" ID="CounterpartyBankDetailsCreate1" EnablePageMethods="true" />
		
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" class="vh-100">
	  <ContentTemplate>
		  <dx:ASPxFormLayout ID="ASPxFormLayout" ClientInstanceName="formLayout" runat="server" >
			  <Items>
				  <dx:LayoutGroup Caption="New Deal" ColCount="12" SettingsItemCaptions-Location="Top">

					  <Items>


						  <dx:LayoutItem Caption="DealType:" ColSpan="6">

							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>


									  <dx:ASPxComboBox runat="server" ID="DealType" IncrementalFilteringMode="StartsWith"
										  TextField="DealType" ValueField="DealTypeID" Width="100%"
										  EnableSynchronization="False"
										  AutoPostBack="true"
										  DataSourceID="DealTypeDataSource">
									  </dx:ASPxComboBox>
									  <asp:SqlDataSource runat="server" ID="DealTypeDataSource" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetDealTypeDropdown" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
									 
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="CounterName:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxComboBox runat="server" ID="CounterName" IncrementalFilteringMode="StartsWith"
										  TextField="ShortName" ValueField="CounterID" Width="100%"
										  EnableSynchronization="False"
										  AutoPostBack="true"
										  DataSourceID="CounterNameDataSource">
									  </dx:ASPxComboBox>


									  <asp:SqlDataSource runat="server" ID="CounterNameDataSource" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetCounterDropdown" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="Value Date:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="ValueDate" Width="100%" ReadOnly="True" >
										   <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Value Date is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>

								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="Price:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="Price" Width="100%" ReadOnly="True" >
									  <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Price is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>

						  <dx:LayoutItem Caption="Quantity:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="Quantity" Width="100%" AutoPostBack="true" >
										   <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Quantity is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>

								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="DealTotal:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="DealTotal" Width="100%" ReadOnly="True" >
										   <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Deal Total is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>

								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>

						  

						    



						  <dx:LayoutItem Caption="" HorizontalAlign="Right" Paddings-PaddingTop="12">
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxButton ID="AddDeal" runat="server" Width="200" Text="Create" OnClick="AddDeal_Click"></dx:ASPxButton>
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
					  </Items>
				  </dx:LayoutGroup>
			  </Items>
		  </dx:ASPxFormLayout>
		 
	  </ContentTemplate>
	</asp:UpdatePanel>


	<asp:UpdatePanel ID="UpdatePanel2" runat="server" class="vh-100">
	  <ContentTemplate>
		  <dx:ASPxGridView ID="GridView" ClientInstanceName="gridView"
			  CssClass="grid-view" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="DealDataSource" KeyFieldName="DealID">
			  <SettingsSearchPanel CustomEditorID="SearchButtonEdit" />
			   <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
			    <Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
			  <SettingsPager PageSize="15" EnableAdaptivity="true">
				  <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
			  </SettingsPager>
			  
			  <Columns>
				  <dx:GridViewDataTextColumn FieldName="DealID" ReadOnly="True" VisibleIndex="0">
					  <EditFormSettings Visible="False"></EditFormSettings>
				  </dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="SchoolName" VisibleIndex="1"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataDateColumn FieldName="ValueDate" VisibleIndex="2"></dx:GridViewDataDateColumn>
				  <dx:GridViewDataTextColumn FieldName="DealType" VisibleIndex="3"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="CounterName" VisibleIndex="4"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="5"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="6"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="DealTotal" ReadOnly="True" VisibleIndex="7"></dx:GridViewDataTextColumn>
			  </Columns>
			
		  </dx:ASPxGridView>

		  <asp:SqlDataSource runat="server" ID="DealDataSource" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_DealsView" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
	  </ContentTemplate>
	</asp:UpdatePanel>
		  
</asp:Content>
