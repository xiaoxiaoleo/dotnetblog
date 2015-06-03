<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ArticleListing.ascx.cs" Inherits="MB.TheBlog.UI.Controls.ArticleListing" %>
<%@ Register Src="RatingDisplay.ascx" TagName="RatingDisplay" TagPrefix="mb" %>

<asp:Literal runat="server" ID="lblCategoryPicker"><small><b> category:</b></small></asp:Literal>
<asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="objAllCategories"
   DataTextField="Title" DataValueField="ID" AppendDataBoundItems="true" 
    OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
   <asp:ListItem Value="0">All categories</asp:ListItem>   
</asp:DropDownList> 
<asp:ObjectDataSource ID="objAllCategories" runat="server" SelectMethod="GetCategories"
   TypeName="MB.TheBlog.BLL.Articles.Category"></asp:ObjectDataSource>
<asp:Literal runat="server" ID="lblSeparator">&nbsp;&nbsp;&nbsp;</asp:Literal>
<asp:Literal runat="server" ID="lblPageSizePicker"><small><b> per page:</b></small></asp:Literal>
<asp:DropDownList ID="ddlArticlesPerPage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlArticlesPerPage_SelectedIndexChanged">
   <asp:ListItem Value="5">5</asp:ListItem>
   <asp:ListItem Value="10" Selected="True">10</asp:ListItem>
   <asp:ListItem Value="25">25</asp:ListItem>
   <asp:ListItem Value="50">50</asp:ListItem>   
   <asp:ListItem Value="100">100</asp:ListItem>
</asp:DropDownList>
<p></p>
<asp:GridView SkinID="Articles" ID="gvwArticles" runat="server"  AllowPaging="True" AutoGenerateColumns="False"
   DataKeyNames="ID" DataSourceID="objArticles" PageSize="10" ShowHeader="False"
   EmptyDataText="<b>There is no article selecd category</b>" OnRowDataBound="gvwArticles_RowDataBound" OnRowCommand="gvwArticles_RowCommand">
   <Columns>
      <asp:TemplateField HeaderText="Article List (including those not yet published)">
         <HeaderStyle />
         <ItemTemplate>
<div  class="container col-md-10 col-md-offset-1" >
 
               <div class="title-article">
               <asp:HyperLink runat="server" ID="lnkTitle" CssClass="title-article" Text='<%# Eval("Title") %>'
                  NavigateUrl='<%# "~/ShowArticle.aspx?ID=" + Eval("ID") %>'/> 
               <asp:Image runat="server" ID="imgKey" ImageUrl="~/Images/key.gif" AlternateText="Requires login"
                  Visible='<%# (bool)Eval("OnlyForMembers") && !Page.User.Identity.IsAuthenticated %>' />
               </div>               
           
  
               <asp:Panel runat="server" ID="panEditArticle" Visible='<%# UserCanEdit %>'>
              
               <asp:LinkButton class="btn btn-primary btn-xs" Text="Edit" runat="server" ID="lnkEdit" 
                  PostBackUrl='<%# "~/Admin/AddEditArticle.aspx?ID=" + Eval("ID") %>'  />
               &nbsp;&nbsp;
               <asp:Button  class="btn btn btn-danger btn-xs" Text="Del" runat="server" ID="btnDelete"   
                  CommandName="Delete" AlternateText="Delete article"
                  OnClientClick="if (confirm('Are you sure you want to delete this article?') == false) return false;" />
               </asp:Panel>
  
             
            <b>Auther: </b> <asp:Literal runat="server" ID="lblAddedBy" Text='<%# Eval("AddedBy") %>' />, 
            on <asp:Literal runat="server" ID="lblAddedDate" Text='<%# Eval("AddedDate", "{0:d}") %>' />, 
            in category "<asp:Literal runat="server" ID="lblCategory" Text='<%# Eval("CategoryTitle") %>' />"
            <br />
             <b>Views: </b>
            <asp:Literal runat="server" ID="lblViews" Text='<%#  Eval("ViewCount") + " times" %>' />      
            
            <div class="articleabstract">
             <b>Abstract: </b>
            <asp:Literal runat="server" ID="lblAbstract" Text='<%# Eval("Abstract") %>' />
            </div>
            </div>
         </ItemTemplate>         
      </asp:TemplateField>
   </Columns>   
   <EmptyDataTemplate><b>No articles to show</b></EmptyDataTemplate>   
</asp:GridView>
<asp:ObjectDataSource ID="objArticles" runat="server" DeleteMethod="DeleteArticle"
   SelectMethod="GetArticles" SelectCountMethod="GetArticleCount" EnablePaging="True" TypeName="MB.TheBlog.BLL.Articles.Article">
   <DeleteParameters>
      <asp:Parameter Name="id" Type="Int32" />
   </DeleteParameters>
   <SelectParameters>
      <asp:Parameter DefaultValue="true" Name="publishedOnly" Type="Boolean" />
      <asp:ControlParameter ControlID="ddlCategories" Name="categoryID" PropertyName="SelectedValue" Type="Int32" />
   </SelectParameters>
</asp:ObjectDataSource>