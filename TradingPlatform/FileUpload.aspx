<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="TradingPlatform.FileUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftPanelContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightPanelContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageToolbar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="PageContent" runat="server">


        <div>
            <h3>File Upload:</h3>
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
     <br />
            <br />
    <div>
            <asp:Button ID="btnSave" runat="server" OnClick="btnsave_click" Text="Save" class="btn btn-primary" style="width:85px;" />
            <br />
            <br />
            <asp:Label ID="lblmessage" runat="server" />
        </div>
 
</asp:Content>
