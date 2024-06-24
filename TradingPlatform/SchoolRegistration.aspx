<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="SchoolRegistration.aspx.cs" Inherits="TradingPlatform.SchoolReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
		<link rel="stylesheet" type="text/css" href='<%# ResolveUrl("~/Content/Deals.css") %>' />
	<script type="text/javascript" src='<%# ResolveUrl("~/Content/Deals.js") %>'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
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
				  <dx:LayoutGroup Caption="School Registration" ColCount="12" SettingsItemCaptions-Location="Top">

					  <Items>


							<dx:LayoutItem Caption="School name" ColumnSpan="6" >
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

							<dx:LayoutItem Caption="School Head" ColumnSpan="6" >
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

							<dx:LayoutItem Caption="School Rep" ColumnSpan="6" >
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

							<dx:LayoutItem Caption="Initial Cash" ColumnSpan="6" >
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxSpinEdit ID="CashBalance" runat="server" DisplayFormatString="C"  Width="100%" >
										
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
												<RequiredField IsRequired="true" ErrorText="Initial cash is required" />
											</ValidationSettings>
										</dx:ASPxSpinEdit>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

							 <dx:LayoutItem Caption="Country" ColumnSpan="6" >
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

							   <dx:LayoutItem Caption="Province" ColumnSpan="6" >
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


							 <dx:LayoutItem Caption="City" ColumnSpan="6" >
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


						  


							<dx:LayoutItem Caption="School Email" ColumnSpan="6" >
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

							<dx:LayoutItem Caption="School Contact No." ColumnSpan="6" >
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxTextBox ID="txtSchlContact" runat="server" Width="100%">
											<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
											 
											</ValidationSettings>
										</dx:ASPxTextBox>
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>

						  <dx:LayoutItem Caption="Physical Address" ColumnSpan="6" >
								<LayoutItemNestedControlCollection>
									<dx:LayoutItemNestedControlContainer>
										<dx:ASPxMemo ID="PhysicalAddress" runat="server"  Width="100%" Height="71px">
									  
										<ValidationSettings Display="Dynamic" SetFocusOnError="true" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
											 
											</ValidationSettings>	
										</dx:ASPxMemo>
										
									</dx:LayoutItemNestedControlContainer>
								</LayoutItemNestedControlCollection>
							</dx:LayoutItem>
						   
						  <dx:LayoutItem Caption="" HorizontalAlign="Right" Paddings-PaddingTop="12" ColumnSpan="6">
							  <LayoutItemNestedControlCollection>
								  <dx:LayoutItemNestedControlContainer>
									  <dx:ASPxButton ID="btnAdd" runat="server" Width="200" Text="Create" OnClick="AddSchool_Click"></dx:ASPxButton>
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
			  CssClass="grid-view"
			  Width="100%"
			  runat="server"
			  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="SchoolID">
			   <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" AllowEllipsisInText="true" AllowDragDrop="false" />
			  <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2" />

			  <SettingsSearchPanel CustomEditorID="SearchButtonEdit" />
			  <Settings VerticalScrollBarMode="Hidden" HorizontalScrollBarMode="Auto" ShowHeaderFilterButton="true" />
			  <SettingsPager PageSize="15" EnableAdaptivity="true">
				  <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
			  </SettingsPager>
			  <Columns>
				  <dx:GridViewDataTextColumn FieldName="SchoolID" ReadOnly="True" VisibleIndex="0">
					  <EditFormSettings Visible="False"></EditFormSettings>
				  </dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="SchoolName" VisibleIndex="1"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="PhysicalAddress" VisibleIndex="2"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="City" VisibleIndex="3"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Province" VisibleIndex="4"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Country" VisibleIndex="5"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="SchoolEmail" VisibleIndex="6"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="ContactNumber" VisibleIndex="7"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="SchoolHeadmaster" VisibleIndex="8"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="Representative" VisibleIndex="9"></dx:GridViewDataTextColumn>
				  <dx:GridViewDataTextColumn FieldName="CashBalance" VisibleIndex="10"></dx:GridViewDataTextColumn>
			  </Columns>
		  </dx:ASPxGridView>


		  <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:VETDBConnectionString %>' SelectCommand="sp_GetSchools" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
		


		
	  </ContentTemplate>
	</asp:UpdatePanel>
		  
</asp:Content>
