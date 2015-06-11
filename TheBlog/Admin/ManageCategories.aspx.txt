<%@ Page Language="C#" MasterPageFile="~/Template.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ManageCategories.aspx.cs" Inherits="MB.TheBlog.UI.Admin.ManageCategories" Title="TheBlog - Manage Categories" %>
<%@ Register Src="../Controls/FileUploader.ascx" TagName="FileUploader" TagPrefix="mb" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">   
   <p></p>
<asp:GridView CssClass="table table-striped table-bordered table-condensed"  ID="gvwCategories" runat="server" AutoGenerateColumns="False" DataSourceID="objAllCategories" Width="100%" DataKeyNames="ID" OnRowDeleted="gvwCategories_RowDeleted" OnRowCreated="gvwCategories_RowCreated" OnSelectedIndexChanged="gvwCategories_SelectedIndexChanged" ShowHeader="false">
      <Columns>
         <asp:TemplateField>
            <ItemTemplate>
               <div class="sectionsubtitle">
               <asp:Literal runat="server" ID="lblCatTitle" Text='<%# Eval("Title") %>' />
               </div>
               <br />
               <asp:Literal runat="server" ID="lblDescription" Text='<%# Eval("Description") %>' />
            </ItemTemplate>
         </asp:TemplateField>
         <asp:HyperLinkField Text="<img border='0' src='../Images/ArrowR.gif' alt='View articles' />"
            DataNavigateUrlFormatString="ManageArticles.aspx?CatID={0}" DataNavigateUrlFields="ID">
            <ItemStyle HorizontalAlign="Center" Width="20px" />
         </asp:HyperLinkField>
         <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/Edit.PNG" SelectText="Edit category" ShowSelectButton="True">
            <ItemStyle HorizontalAlign="Center" Width="20px" />
         </asp:CommandField>
         <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/Delete.PNG" DeleteText="Delete category" ShowDeleteButton="True">
            <ItemStyle HorizontalAlign="Center" Width="20px" />
         </asp:CommandField>
      </Columns>
      <EmptyDataTemplate><b>No categories to show</b></EmptyDataTemplate>   
   </asp:GridView>
   <asp:ObjectDataSource ID="objAllCategories" runat="server" SelectMethod="GetCategories"
      TypeName="MB.TheBlog.BLL.Articles.Category" DeleteMethod="DeleteCategory">
   </asp:ObjectDataSource>
   <p></p>
   <asp:DetailsView ID="dvwCategory" runat="server" AutoGenerateRows="False" DataSourceID="objCurrCategory" Height="50px" Width="50%" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" HeaderText="Category Details" OnItemInserted="dvwCategory_ItemInserted" OnItemUpdated="dvwCategory_ItemUpdated" DataKeyNames="ID" OnItemCreated="dvwCategory_ItemCreated" DefaultMode="Insert" OnItemCommand="dvwCategory_ItemCommand">
      <FieldHeaderStyle Width="100px" />
      <Fields>
         <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" InsertVisible="False" />
         <asp:BoundField DataField="AddedDate" HeaderText="AddedDate" InsertVisible="False"
            ReadOnly="True" SortExpression="AddedDate" />
         <asp:BoundField DataField="AddedBy" HeaderText="AddedBy" InsertVisible="False" ReadOnly="True"
            SortExpression="AddedBy" />
         <asp:TemplateField HeaderText="Title" SortExpression="Title">
            <ItemTemplate>
               <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox  CssClass="form-control"   ID="txtTitle" runat="server" Text='<%# Bind("Title") %>' MaxLength="256" Width="100%"></asp:TextBox>
               <asp:RequiredFieldValidator ID="valRequireTitle" runat="server" ControlToValidate="txtTitle" SetFocusOnError="true"
                  Text="The Title field is required." ToolTip="The Title field is required." Display="Dynamic"></asp:RequiredFieldValidator>
            </EditItemTemplate>
         </asp:TemplateField>

         <asp:TemplateField HeaderText="Description" SortExpression="Description" ConvertEmptyStringToNull="False">
            <ItemTemplate>
               <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' Width="100%"></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox  CssClass="form-control"   ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' Rows="5" TextMode="MultiLine" MaxLength="4000" Width="100%"></asp:TextBox>
            </EditItemTemplate>
         </asp:TemplateField>
      </Fields>
   </asp:DetailsView>
   <asp:ObjectDataSource ID="objCurrCategory" runat="server" InsertMethod="InsertCategory" SelectMethod="GetCategoryByID" TypeName="MB.TheBlog.BLL.Articles.Category" UpdateMethod="UpdateCategory">
      <SelectParameters>
         <asp:ControlParameter ControlID="gvwCategories" Name="categoryID" PropertyName="SelectedValue"
            Type="Int32" />
      </SelectParameters>
   </asp:ObjectDataSource>
   <p></p>
   <mb:FileUploader ID="FileUploader1" runat="server" />
</asp:Content>

