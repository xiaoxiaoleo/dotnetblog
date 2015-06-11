<%@ Page Language="C#" MasterPageFile="~/Template.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ArchivedNewsletters.aspx.cs" Inherits="MB.TheBlog.UI.ArchivedNewsletters" Title="TheBlog - Archived Newsletters" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">   
  <li><a href="SendNewsletter.aspx"><h3>Send Newsletter</h3></a></li>
  <div class="sectiontitle"> Newsletters History:</div>
   <asp:GridView CssClass="table table-striped table-bordered table-condensed"  ID="gvwNewsletters" runat="server" AutoGenerateColumns="False" DataSourceID="objNewsletters" Width="100%" DataKeyNames="ID" OnRowCreated="gvwNewsletters_RowCreated" ShowHeader="false">
      <Columns>
         <asp:TemplateField>
            <ItemTemplate>
               <img src="images/arrowr2.gif" alt="" style="vertical-align: middle; border-width: 0px;" />
               <asp:HyperLink runat="server" ID="lnkNewsletter" Text='<%# Eval("Subject") %>'
                  NavigateUrl='<%# "ShowNewsletter.aspx?ID=" + Eval("ID") %>' /> 
               <small>(sent on <%# Eval("AddedDate", "{0:d}") %>)</small>
            </ItemTemplate>
         </asp:TemplateField>
         <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Delete.PNG" DeleteText="Delete newsletter" ShowDeleteButton="True">
            <ItemStyle HorizontalAlign="Center" Width="20px" />
         </asp:CommandField>
      </Columns>
      <EmptyDataTemplate><b>No newsletters to show</b></EmptyDataTemplate>   
   </asp:GridView>
   <asp:ObjectDataSource ID="objNewsletters" runat="server" SelectMethod="GetNewsletters"
      TypeName="MB.TheBlog.BLL.Newsletters.Newsletter" DeleteMethod="DeleteNewsletter">
      <DeleteParameters>
         <asp:Parameter Name="id" Type="Int32" />
      </DeleteParameters>
      <SelectParameters>
         <asp:Parameter Name="toDate" Type="DateTime" />
      </SelectParameters>
   </asp:ObjectDataSource>
</asp:Content>

