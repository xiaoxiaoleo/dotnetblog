<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserProfile.ascx.cs" Inherits="MB.TheBlog.UI.Controls.UserProfile" %>
<div class="sectionsubtitle">Site preferences</div>
<p></p>

<table  class="table"   class="table" cellpadding="2">
   <tr>
      <td style="width: 110px;" class="form-control"><asp:Label runat="server" ID="lblNewsletter" AssociatedControlID="ddlSubscriptions" Text="Newsletter:" /></td>
      <td style="width: 400px;">
         <asp:DropDownList runat="server" ID="ddlSubscriptions">
            <asp:ListItem Text="No subscription" Value="None" Selected="true" />
            <asp:ListItem Text="Subscribe to plain-text version" Value="PlainText" />
            <asp:ListItem Text="Subscribe to HTML version" Value="Html" />
         </asp:DropDownList>
      </td>
   </tr>
   <tr>
      <td class="form-control"><asp:Label runat="server" ID="lblLanguage" AssociatedControlID="ddlLanguages" Text="Language:" /></td>
      <td>
         <asp:DropDownList runat="server" ID="ddlLanguages">
            <asp:ListItem Text="English" Value="en-US" Selected="true" />
            <asp:ListItem Text="Italian" Value="it-IT" />
         </asp:DropDownList>
      </td>
   </tr>
</table>
<p></p>
<div class="sectionsubtitle">Personal details</div>
<p></p>
<table  class="table"   class="table" cellpadding="2">
   <tr>
      <td style="width: 110px;" class="form-control"><asp:Label runat="server" ID="lblFirstName" AssociatedControlID="txtFirstName" Text="First name:" /></td>
      <td style="width: 400px;"><asp:TextBox  CssClass="form-control"   ID="txtFirstName" runat="server" Width="99%"></asp:TextBox></td>
   </tr>
   <tr>
      <td class="form-control"><asp:Label runat="server" ID="lblLastName" AssociatedControlID="txtLastName" Text="Last name:" /></td>
      <td><asp:TextBox  CssClass="form-control"   ID="txtLastName" runat="server" Width="99%"></asp:TextBox></td>
   </tr>
   <tr>
      <td class="form-control"><asp:Label runat="server" ID="lblGender" AssociatedControlID="ddlGenders" Text="Gender:" /></td>
      <td>
         <asp:DropDownList runat="server" ID="ddlGenders">
            <asp:ListItem Text="Please select one..." Value="" Selected="True" />
            <asp:ListItem Text="Male" Value="M" />
            <asp:ListItem Text="Female" Value="F" />
         </asp:DropDownList>
      </td>
   </tr>
   <tr>
      <td class="form-control"><asp:Label runat="server" ID="lblBirthDate" AssociatedControlID="txtBirthDate" Text="Birth date:" /></td>
      <td>
         <asp:TextBox  CssClass="form-control"   ID="txtBirthDate" runat="server" Width="99%"></asp:TextBox>
         <asp:CompareValidator runat="server" ID="valBirthDateType" ControlToValidate="txtBirthDate"
            SetFocusOnError="true" Display="Dynamic" Operator="DataTypeCheck" Type="Date"
            ErrorMessage="The format of the birth date is not valid." ToolTip="The format of the birth date is not valid."
            ValidationGroup="EditProfile"><br />The format of the birth date is not valid.</asp:CompareValidator>
      </td>
   </tr>
   
   <tr>
      <td class="form-control"><asp:Label runat="server" ID="lblWebsite" AssociatedControlID="txtWebsite" Text="Website:" /></td>
      <td><asp:TextBox  CssClass="form-control"   ID="txtWebsite" runat="server" Width="99%"></asp:TextBox></td>
   </tr>
</table>
<p></p>
<div class="sectionsubtitle">Address</div>
<p></p>
<table  class="table"  cellpadding="2">
   <tr>
      <td style="width: 110px;" class="form-control"><asp:Label runat="server" ID="lblStreet" AssociatedControlID="txtStreet" Text="Street:" /></td>
      <td style="width: 400px;"><asp:TextBox  CssClass="form-control"   runat="server" ID="txtStreet" Width="99%" /></td>
   </tr>
    <tr>
      <td style="width: 110px;" class="form-control"><asp:Label runat="server" ID="lblPhone" AssociatedControlID="txtPhone" Text="Phone:" /></td>
      <td style="width: 400px;"><asp:TextBox  CssClass="form-control"   runat="server" ID="txtPhone" Width="99%" /></td>
   </tr>
</table>
 
