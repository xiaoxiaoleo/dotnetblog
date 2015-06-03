<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FileUploader.ascx.cs" Inherits="MB.TheBlog.UI.Controls.FileUploader" %>
Upload a file:
<asp:FileUpload ID="filUpload" runat="server" />&nbsp;
<asp:Button  class="btn btn-primary" ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" CausesValidation="false" /><br />
<asp:Label ID="lblFeedbackOK" SkinID="FeedbackOK" runat="server"></asp:Label>
<asp:Label ID="lblFeedbackKO" SkinID="FeedbackKO" runat="server"></asp:Label>
