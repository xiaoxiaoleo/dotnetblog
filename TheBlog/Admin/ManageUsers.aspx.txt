<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="MB.TheBlog.UI.Admin.ManageUsers" Title="TheBlog - Account management" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">

   <b>- Total users: <asp:Literal runat="server" ID="lblTotUsers" /><br />
   - Users online now: <asp:Literal runat="server" ID="lblOnlineUsers" /></b>
  <br>
  <br>
  
   <p></p>
   <asp:GridView CssClass="table table-striped table-bordered table-condensed"  ID="gvwUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserName"
      OnRowCreated="gvwUsers_RowCreated" OnRowDeleting="gvwUsers_RowDeleting" 
        AllowSorting="True">
      <Columns>
         <asp:BoundField HeaderText="UserName" DataField="UserName" />
         <asp:HyperLinkField HeaderText="E-mail" DataTextField="Email" DataNavigateUrlFormatString="mailto:{0}" DataNavigateUrlFields="Email" />
         <asp:BoundField HeaderText="Created" DataField="CreationDate" DataFormatString="{0:MM/dd/yy h:mm tt}" />
         <asp:BoundField HeaderText="Last activity" DataField="LastActivityDate" DataFormatString="{0:MM/dd/yy h:mm tt}" />
         <asp:HyperLinkField Text="<img src='../images/Edit.PNG' border='0' />" DataNavigateUrlFormatString="EditUser.aspx?UserName={0}" DataNavigateUrlFields="UserName" />
         <asp:ButtonField CommandName="Delete" ButtonType="Image" ImageUrl="~/images/Delete.PNG" />
      </Columns>
      <EmptyDataTemplate><b>No users found for the specified criteria</b></EmptyDataTemplate>
   </asp:GridView>
</asp:Content>

