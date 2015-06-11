<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" MasterPageFile="~/Template.master" Inherits="MB.TheBlog.UI.Admin._Default" Title="TheBlog - Administration" %>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="MainContent">

 
<asp:Panel runat="server" ID="panAdmin">
<div class="container">

<div class="comment-body"><h2>Users:</h2></div>
<ul style="list-style-type: square">
   <li><a href="ManageUsers.aspx"><h4>Manage Users</h4></a></li>
 
</ul>

<div class="comment-body"><h2>Articles:</h2></div>
<ul style="list-style-type: square">
   <li><a href="ManageArticles.aspx"><h4>Manage Articles</h4></a></li>
   <li><a href="ManageCategories.aspx"><h4>Manage Categories</h4></a></li>
   <li><a href="ManageComments.aspx"><h4>Manage Comments</h4></a></li>
</ul>

<div class="comment-body"><h2>Newsletter:</h2></div>
<ul style="list-style-type: square">
   <li><a href="../ArchivedNewsletters.aspx"><h4>Manage Newsletter</h4></a></li>
</ul>
    </asp:Panel>
</div>


 

</asp:Content>