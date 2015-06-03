<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="ManageArticles.aspx.cs" Inherits="MB.TheBlog.UI.Admin.ManageArticles" Title="TheBlog - Manage Articles" %>
<%@ Register Src="../Controls/ArticleListing.ascx" TagName="ArticleListing" TagPrefix="mb" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="sectiontitle">Manage Articles</div>
   <p></p>
   <ul style="list-style-type: square">
      <li><asp:HyperLink runat="server" ID="lnkAddNewArticle" NavigateUrl="AddEditArticle.aspx"> <h3>Add New Article<h3></asp:HyperLink></li>
   </ul>
   <p></p>
   <mb:ArticleListing id="ArticleListing1" runat="server" PublishedOnly="False" />
</asp:Content>

