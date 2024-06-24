<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="TradingPlatform.Users" %>
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
				  <dx:LayoutGroup Caption="New User" ColCount="12" SettingsItemCaptions-Location="Top">

					  <Items>


						
						  <dx:LayoutItem Caption="First Name:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="FirstName" Width="100%"  >
										   <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="First Name is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>

								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="Surname:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="Surname" Width="100%"  >
									  <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Surname is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>

						  <dx:LayoutItem Caption="Username:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="Username" Width="100%" AutoPostBack="true" >
										   <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Username is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>

								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="Password:" ColSpan="6">
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxTextBox runat="server" ID="Password" Width="100%" Password="true" >
										   <ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Password is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>

								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>

						  
							<dx:LayoutItem Caption="Role:" ColSpan="6" >

							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>


									  <dx:ASPxComboBox runat="server" ID="Role" IncrementalFilteringMode="StartsWith"
										  TextField="Role" ValueField="RoleID" Width="100%"
										  EnableSynchronization="False"
										  AutoPostBack="true" DataSourceID="RolesDataSource">
									  </dx:ASPxComboBox>


									  <asp:SqlDataSource runat="server" ID="RolesDataSource" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetRoles" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
						  <dx:LayoutItem Caption="Email" ColSpan="6" >
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="Email" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
												<RequiredField IsRequired="true" ErrorText="Email is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>
						  <dx:LayoutItem Caption="Select School:" ColSpan="6" >
							  <ParentContainerStyle Paddings-PaddingRight="12"></ParentContainerStyle>
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxComboBox runat="server" ID="School" IncrementalFilteringMode="StartsWith"
										 TextField="SchoolName" ValueField="SchoolID" Width="100%"
										  EnableSynchronization="False"
										  AutoPostBack="true" DataSourceID="SqlDataSource1">
									  </dx:ASPxComboBox>




									  <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetSchoolName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
								  </dx:LayoutItemNestedControlContainer>
							  </LayoutItemNestedControlCollection>
						  </dx:LayoutItem>
							

						   

						  <dx:LayoutItem ColSpan="7" Caption="" HorizontalAlign="Right" Paddings-PaddingTop="12">
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxButton ID="AddUser" runat="server" Width="200" Text="Create" OnClick="AddUser_Click"></dx:ASPxButton>
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
		  <dx:ASPxGridView  ID="GridView" ClientInstanceName="gridView"
			  CssClass="grid-view"
			  Width="100%"
			  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="UserID">
			 
			   <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
			  <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" />

			  <SettingsSearchPanel CustomEditorID="SearchButtonEdit" />
			  <Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
			  <SettingsPager PageSize="15" EnableAdaptivity="true">
				  <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
			  </SettingsPager>

			  <Columns>
				  <dx:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" VisibleIndex="0">
					  <EditFormSettings Visible="False"></EditFormSettings>
				  </dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="name" VisibleIndex="1"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="surname" VisibleIndex="2"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Role" VisibleIndex="4"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Active" ReadOnly="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
			  </Columns>
		  </dx:ASPxGridView>
		  <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetSystemUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
	  </ContentTemplate>
	</asp:UpdatePanel>
		  
</asp:Content>
