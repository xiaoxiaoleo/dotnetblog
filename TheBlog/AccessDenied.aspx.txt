<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessDenied.aspx.cs" Inherits="MB.TheBlog.UI.AccessDenied" Title="TheBlog - Access Denied" MasterPageFile="~/Template.master" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
 

<asp:Label runat="server" ID="lblLoginRequired" Font-Bold="true">
Please login first.
</asp:Label>
<asp:Label runat="server" ID="lblInsufficientPermissions" Font-Bold="true">
Access Deined.
</asp:Label>
<asp:Label runat="server" ID="lblInvalidCredentials" Font-Bold="true">
Wrong username or password!
or  <a href="PasswordRecovery.aspx">click here</a> to recover password.
</asp:Label>
</asp:Content>

