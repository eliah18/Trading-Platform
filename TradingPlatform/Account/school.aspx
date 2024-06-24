<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Root.master" CodeBehind="school.aspx.cs" Inherits="TradingPlatform.SchoolRegisterModule" Title="Register" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
	<link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/SignInRegister.css") %>' />
	<script type="text/javascript" src='<%# ResolveUrl("~/Content/SignInRegister.js") %>'></script>
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
	<div class="formLayout-verticalAlign">
		<div class="formLayout-container">
			<dx:ASPxTabControl ID="SignInRegisterTabControl" runat="server" Width="100%" TabAlign="Justify" Paddings-Padding="0">
				<Tabs>
					
					<dx:Tab Text="Register School" NavigateUrl="#"></dx:Tab>
				</Tabs>
			</dx:ASPxTabControl>

			<dx:ASPxFormLayout runat="server" ID="FormLayout" ClientInstanceName="formLayout" CssClass="formLayout" UseDefaultPaddings="false" Font-Size="Small">
				<SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
				<SettingsItemCaptions Location="Top" />
				<Styles LayoutGroup-Cell-Paddings-Padding="0" LayoutItem-Paddings-PaddingBottom="8" />
				<Items>
					<dx:LayoutGroup ShowCaption="False" GroupBoxDecoration="None" Paddings-Padding="16">
						<Items>
							<dx:LayoutItem Caption="School name" >
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="SchoolName" runat="server" >
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="School name is required" />
											</ValidationSettings>
											<ClientSideEvents Init="function(s, e){ s.Focus(); }" />
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							<dx:LayoutItem Caption="School Head" >
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="SchlHeadMaster" runat="server" >
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="School Head name is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							<dx:LayoutItem Caption="School Rep">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="SchlRep" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="School Representative is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							<dx:LayoutItem Caption="Initial Cash">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="CashBalance" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Initial cash is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							 <dx:LayoutItem Caption="Country">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="txtCountry" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Country is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							   <dx:LayoutItem Caption="Province">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="txtProvince" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Province is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>


							 <dx:LayoutItem Caption="City">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="txtCity" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="City is required" />
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>


						  


							<dx:LayoutItem Caption="School Email">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="EmailTextBox" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />

											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							<dx:LayoutItem Caption="School Contact No.">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="txtSchlContact" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
											 
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							<dx:LayoutItem Caption="School Contact No.">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										  <asp:FileUpload ID="FileUpload1" class="col-sm-8 text-left control-label col-form-label"    runat="server" />
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

						</Items>
					</dx:LayoutGroup>
					<dx:LayoutGroup GroupBoxDecoration="HeadingLine" ShowCaption="False">
						<Paddings PaddingTop="13" PaddingBottom="13" />
						<GroupBoxStyle CssClass="formLayout-groupBox" />
						<Items>
							<dx:LayoutItem ShowCaption="False" HorizontalAlign="Center" Paddings-Padding="0">
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxButton ID="RegisterButton" runat="server" Width="200" Text=" Register " OnClick="RegisterButton_Click"></dx:ASPxButton>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>
						</Items>
					</dx:LayoutGroup>
				</Items>
			</dx:ASPxFormLayout>
		</div>
	</div>

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