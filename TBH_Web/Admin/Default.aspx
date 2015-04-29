<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" MasterPageFile="~/Template.master" Inherits="MB.TheBeerHouse.UI.Admin._Default" Title="The Beer House - Administration" %>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="MainContent">

<div class="sectiontitle">Administration</div>
<p></p>

<asp:Panel runat="server" ID="panAdmin">
<div class="sectionsubtitle">Actions for Administrators</div>
<ul style="list-style-type: square">
   <li><a href="ManageUsers.aspx">Manage Users</a>: search for users by username or e-mail address, read and modify thier profile, roles, and approved status.</li>
</ul>
</asp:Panel>

<asp:Panel runat="server" ID="panEditor">
<div class="sectionsubtitle">Actions for Editors</div>
<ul style="list-style-type: square">
   <li><a href="ManageArticles.aspx">Manage Articles</a>: add/edit/remove categories, articles and comments,
   review & approve articles posted by contributors.</li>
   <li><a href="SendNewsletter.aspx">Send Newsletter</a>: create and send a newsletter to the current subscribers, in plain-text and HTML format.</li>
</ul>
</asp:Panel>



<asp:Panel runat="server" ID="panContributor">
<div class="sectionsubtitle">Actions for Contributors</div>
<ul style="list-style-type: square">
   <li><a href="AddEditArticle.aspx">Post New Article</a>: post a new article into an existent category. 
   If you're a contributor, your article will have to be approved by an administrator or an editor
   before being published.</li>
</ul>
</asp:Panel>

</asp:Content>