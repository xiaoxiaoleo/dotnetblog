<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="MB.TheBlog.UI.Contact" Title="TheBlog - Contact Us" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
   <div class="sectiontitle">Contact Us</div>
   <p></p>
   <p style="text-align: justify;">
   
   For reporting errors on the site, or for general help with the site's source code, than fill the form below:
   <p></p>
   <table  class="table"   >
      <tr>
         <td style="width: 80px;" class="fieldname"><asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" Text="Your name:" /></td>
         <td style="width: 400px;"><asp:TextBox  CssClass="form-control"   runat="server" ID="txtName" Width="100%" /></td>
         <td>
               <asp:RequiredFieldValidator runat="server" Display="dynamic" ID="valRequireName" SetFocusOnError="true"
                  ControlToValidate="txtName" ErrorMessage="Your name is required">*</asp:RequiredFieldValidator>
         </td>            
      </tr>
      <tr>
         <td class="fieldname"><asp:Label runat="server" ID="lblEmail" AssociatedControlID="txtEmail" Text="Your e-mail:" /></td>
         <td><asp:TextBox  CssClass="form-control"   runat="server" ID="txtEmail" Width="100%" /></td>
         <td>
               <asp:RequiredFieldValidator runat="server" Display="dynamic" ID="valRequireEmail" SetFocusOnError="true"
                  ControlToValidate="txtEmail" ErrorMessage="Your e-mail address is required">*</asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator runat="server" Display="dynamic" ID="valEmailPattern"  SetFocusOnError="true"
                  ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="The e-mail address you specified is not well-formed">*</asp:RegularExpressionValidator>
         </td>            
      </tr>
      <tr>
         <td class="fieldname"><asp:Label runat="server" ID="lblSubject" AssociatedControlID="txtSubject" Text="Subject:" /></td>
         <td><asp:TextBox  CssClass="form-control"   runat="server" ID="txtSubject" Width="100%" /></td>
         <td>
               <asp:RequiredFieldValidator runat="server" Display="dynamic" ID="valRequireSubject" SetFocusOnError="true"
                  ControlToValidate="txtSubject" ErrorMessage="The subject is required">*</asp:RequiredFieldValidator>
         </td>            
      </tr>
      <tr>
         <td class="fieldname"><asp:Label runat="server" ID="lblBody" AssociatedControlID="txtBody" Text="Body:" /></td>
         <td><asp:TextBox  CssClass="form-control"   runat="server" ID="txtBody" Width="100%" TextMode="MultiLine" Rows="8" /></td>
         <td>
               <asp:RequiredFieldValidator runat="server" Display="dynamic" ID="valRequireBody" SetFocusOnError="true"
                  ControlToValidate="txtBody" ErrorMessage="The body is required">*</asp:RequiredFieldValidator>
         </td>            
      </tr>
      <tr>
         <td colspan="3" style="text-align: right;">
               <asp:Label runat="server" ID="lblFeedbackOK" Text="Your message has been successfully sent." SkinID="FeedbackOK" Visible="false" />
               <asp:Label runat="server" ID="lblFeedbackKO" Text="Sorry, there was a problem sending your message." SkinID="FeedbackKO" Visible="false" />
               <asp:Button  class="btn btn-primary" runat="server" ID="txtSubmit" Text="Send" OnClick="txtSubmit_Click" />
               <asp:ValidationSummary runat="server" ID="valSummary" ShowSummary="false" ShowMessageBox="true" />
         </td>            
      </tr>
   </table>
</asp:Content>
