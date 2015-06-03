<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="SendNewsletter.aspx.cs" Inherits="MB.TheBlog.UI.Admin.SendNewsletter" Title="TheBlog - Send Newsletter" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="sectiontitle">
      <asp:Literal runat="server" ID="lblSendNewsletter" Text="Create & Send Newsletter" />
   </div>
   <p></p>   
   <asp:Panel runat="server" ID="panSend">
   <p></p>
   <small><b><asp:Literal runat="server" ID="lblTitle" Text="Subject:" /></b></small><br />
   <asp:TextBox  CssClass="form-control"   ID="txtSubject" runat="server" Width="99%" MaxLength="256"></asp:TextBox>
   <asp:RequiredFieldValidator ID="valRequireSubject" runat="server" ControlToValidate="txtSubject" SetFocusOnError="true"
      Text="The Subject field is required." ToolTip="The Subject field is required." Display="Dynamic" ValidationGroup="Newsletter"></asp:RequiredFieldValidator>
   <p></p>
   <small><b><asp:Literal runat="server" ID="lblPlainTextBody" Text="Plain-text Body:" /></b></small><br />
   <asp:TextBox  CssClass="form-control"   ID="txtPlainTextBody" runat="server" Width="99%" TextMode="MultiLine" Rows="14"></asp:TextBox>
   <asp:RequiredFieldValidator ID="valRequirePlainTextBody" runat="server" ControlToValidate="txtPlainTextBody" SetFocusOnError="true"
      Text="The plain-text body is required." ToolTip="The plain-text body is required." Display="Dynamic" ValidationGroup="Newsletter"></asp:RequiredFieldValidator>
   <p></p>
   <small><b><asp:Literal runat="server" ID="lblHtmlBody" Text="HTML Body:" /></b></small><br />
   <fckeditorv2:fckeditor id="txtHtmlBody" runat="server" 
      ToolbarSet="TheBlog" Height="400px" Width="99%" />
   <p></p>
   <asp:Button  class="btn btn-primary" ID="btnSend" runat="server" Text="Send" ValidationGroup="Newsletter"
      OnClientClick="if (confirm('Are you sure you want to send the newsletter?') == false) return false;" OnClick="btnSend_Click" />
   </asp:Panel>
   <asp:Panel ID="panWait" runat="server" Visible="false">      
      <asp:Label runat="server" id="lblWait" SkinID="FeedbackKO">
      <p>Another newsletter is currently being sent. Please wait until it completes
      before compiling and sending a new one.</p>
      <p>You can check the current newsletter's completion status from <a href="SendingNewsletter.aspx">this page</a>.</p>
      </asp:Label>
   </asp:Panel>
</asp:Content>

