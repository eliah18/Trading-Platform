<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="CounterPriceUpload.aspx.cs" Inherits="TradingPlatform.CounterPriceUpload" %>
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
	   
				 

					   <div>
			<h3>Price Sheet Upload:</h3>
			<br />
			<asp:FileUpload ID="FileUpload1" runat="server" />
			</div>
	 <br />
			<br />
	<div>
			<asp:Button ID="btnSave" runat="server" OnClick="btnsave_click" Text="Save" cssclass="btn btn-primary" style="width:85px;" />
			<br />
			<br />
			<asp:Label ID="lblmessage" runat="server" />
		</div>
				  
			 
		
		<asp:ScriptManager runat="server" ID="CounterpartyBankDetailsCreate1" EnablePageMethods="true" /> 
	


	<asp:UpdatePanel ID="UpdatePanel2" runat="server" class="vh-100">
	  <ContentTemplate>
		  <dx:ASPxGridView runat="server" ID="GridView" ClientInstanceName="gridView"
			  CssClass="grid-view" Width="100%"
			  AutoGenerateColumns="False"
			  DataSourceID="SqlDataSource1" KeyFieldName="CounterPriceID">
			  <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
			  <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" />

			  <SettingsSearchPanel CustomEditorID="SearchButtonEdit" />
			  <Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
			  <SettingsPager PageSize="15" EnableAdaptivity="true">
				  <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
			  </SettingsPager>
			  <Columns>
				  <dx:GridViewDataTextColumn FieldName="CounterPriceID" VisibleIndex="0" ReadOnly="True">
					  <EditFormSettings Visible="False"></EditFormSettings>
				  </dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="ShortName" VisibleIndex="1"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="BidPrice" VisibleIndex="2"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="OfferPrice" VisibleIndex="3"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="4"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataDateColumn FieldName="PriceDate" VisibleIndex="5"></dx:GridViewDataDateColumn>


			  </Columns>
		  </dx:ASPxGridView>



		  <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetCounterPrices" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
	  </ContentTemplate>
	</asp:UpdatePanel>
		  
</asp:Content>
