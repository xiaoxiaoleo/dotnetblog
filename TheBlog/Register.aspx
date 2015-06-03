<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
   CodeFile="Register.aspx.cs" Inherits="MB.TheBlog.UI.Register" Title="TheBlog - Register" %>
<%@ Register Src="Controls/UserProfile.ascx" TagName="UserProfile" TagPrefix="mb" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:CreateUserWizard runat="server" ID="CreateUserWizard1" AutoGeneratePassword="False" 
      ContinueDestinationPageUrl="~/Default.aspx" FinishDestinationPageUrl="~/Default.aspx" OnFinishButtonClick="CreateUserWizard1_FinishButtonClick" OnCreatedUser="CreateUserWizard1_CreatedUser">
      <WizardSteps>
         <asp:CreateUserWizardStep runat="server">
            <ContentTemplate>
            <div class="container">
                  <div class="form-group"><asp:Label runat="server" ID="lblUserName" AssociatedControlID="UserName" Text="Username:" /> 
                   <asp:TextBox   runat="server" ID="UserName" Width="100%" CssClass="form-control" /> 
                     <asp:RequiredFieldValidator ID="valRequireUserName" runat="server" ControlToValidate="UserName" SetFocusOnError="true" Display="Dynamic"
                        ErrorMessage="Username is required." ToolTip="Username is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                   
               </div> 
                    <div class="form-group"><asp:Label runat="server" ID="lblPassword" AssociatedControlID="Password" Text="Password:" /> 
                   <asp:TextBox    runat="server" ID="Password" TextMode="Password" Width="100%" 
                            CssClass="form-control" /> 
                   
                     <asp:RequiredFieldValidator ID="valRequirePassword" runat="server" ControlToValidate="Password" SetFocusOnError="true" Display="Dynamic"
                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="valPasswordLength" runat="server" ControlToValidate="Password" SetFocusOnError="true" Display="Dynamic"
                        ValidationExpression="\w{5,}" ErrorMessage="Password must be at least 5 characters long." ToolTip="Password must be at least 5 characters long."
                        ValidationGroup="CreateUserWizard1">*</asp:RegularExpressionValidator>
                               
               </div> 
                  <div class="form-group"> <asp:Label runat="server" ID="lblConfirmPassword" AssociatedControlID="ConfirmPassword" Text="Confirm password:" /> 
                   <asp:TextBox      runat="server" ID="ConfirmPassword" TextMode="Password" Width="100%" 
                          CssClass="form-control" /> 
                   
                     <asp:RequiredFieldValidator ID="valRequireConfirmPassword" runat="server" ControlToValidate="ConfirmPassword" SetFocusOnError="true" Display="Dynamic"
                        ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="valComparePasswords" runat="server" ControlToCompare="Password" SetFocusOnError="true"
                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                        ValidationGroup="CreateUserWizard1">*</asp:CompareValidator>
                               
               </div> 
                  <div class="form-group"> <asp:Label runat="server" ID="lblEmail" AssociatedControlID="Email" Text="E-mail:" /> 
                   <asp:TextBox  CssClass="form-control"   runat="server" ID="Email" Width="100%" Text='<%# Email %>' 
                           /> 
                   
                     <asp:RequiredFieldValidator ID="valRequireEmail" runat="server" ControlToValidate="Email" SetFocusOnError="true" Display="Dynamic"
                        ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator runat="server" ID="valEmailPattern"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="CreateUserWizard1"
                        ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="The e-mail address you specified is not well-formed.">*</asp:RegularExpressionValidator>
                               
               </div> 
                  <div class="form-group"> <asp:Label runat="server" ID="lblQuestion" AssociatedControlID="Question" Text="Security question:" /> 
                   <asp:TextBox    runat="server" ID="Question" Width="100%" CssClass="form-control" /> 
                   
                     <asp:RequiredFieldValidator ID="valRequireQuestion" runat="server" ControlToValidate="Question" SetFocusOnError="true" Display="Dynamic"
                        ErrorMessage="Security question is required." ToolTip="Security question is required."
                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               
              </div> 
                  <div class="form-group"> <asp:Label runat="server" ID="lblAnswer" AssociatedControlID="Answer" Text="Security answer:" /> 
                   <asp:TextBox     runat="server" ID="Answer" Width="100%" CssClass="form-control" /> 
                   
                     <asp:RequiredFieldValidator ID="valRequireAnswer" runat="server" ControlToValidate="Answer" SetFocusOnError="true" Display="Dynamic"
                        ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                               
   
                  <td colspan="3" style="text-align: right;">
                     <asp:Label ID="ErrorMessage" SkinID="FeedbackKO" runat="server" EnableViewState="False"></asp:Label>
                   
                
                 </div>
            <asp:ValidationSummary ValidationGroup="CreateUserWizard1" ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </ContentTemplate>
		
         </asp:CreateUserWizardStep>
         <asp:WizardStep runat="server" Title="Set preferences">
            <div class="sectiontitle">Set-up your profile</div>
            <mb:UserProfile ID="UserProfile1" runat="server" />
         </asp:WizardStep>
         <asp:CompleteWizardStep runat="server"></asp:CompleteWizardStep>
      </WizardSteps>
   
   </asp:CreateUserWizard>   
</asp:Content>      
