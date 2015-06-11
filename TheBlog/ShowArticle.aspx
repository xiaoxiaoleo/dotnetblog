<%@ Page Language="C#" MasterPageFile="~/Template.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="ShowArticle.aspx.cs" Inherits="MB.TheBlog.UI.ShowArticle" Title="TheBlog - Article: {0}" %>
<%@ Register Src="Controls/RatingDisplay.ascx" TagName="RatingDisplay" TagPrefix="mb" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <article class="article container well">
           <asp:Label runat="server" ID="lblTitle" CssClass="title-article" />
      <br><br>
      <b>Author: </b> <asp:Literal runat="server" ID="lblAddedBy" />,
       Category "<asp:Literal runat="server" ID="lblCategory" />"
      <br />
       <b>Views: </b><asp:Literal runat="server" ID="lblViews" Text=" {0} times" />      
      <div class="articleabstract">
       <b>Dig: </b> <asp:Literal runat="server" ID="lblAbstract" />
      </div>
	 <hr noshade color="#000000">
   <asp:Literal runat="server" ID="lblBody" />
   <p></p>
   <hr style="width: 100%; height: 1px;" />
  
</article>
   <p></p>
   <asp:Panel runat="server" ID="panComments">
   <h3 id="comments-title" class="comments-header alert alert-info"><i class="fa fa-comments"></i> User Comments</h3>
   <asp:DataList ID="dlstComments" runat="server" DataSourceID="objComments" DataKeyField="ID" OnSelectedIndexChanged="dlstComments_SelectedIndexChanged" OnItemCommand="dlstComments_ItemCommand">
      <ItemTemplate>
         <div class="comments-wrap">
         <table  class="table">
        
         <b>
            <asp:HyperLink ID="lnkAddedBy" runat="server" Text='<%# Eval("AddedBy") %>'
               NavigateUrl='<%# "mailto:" + Eval("AddedByEmail") %>' />
              <asp:Literal ID="lblAddedDate" runat="server" Text='<%# Eval("AddedDate", "{0:f}") %>' />            
         </b>
         </td>
         <td style="text-align: right;">
            <asp:Panel runat="server" ID="panAdmin" Visible='<%# UserCanEdit %>'>
          <asp:Button  class="btn btn-primary btn-xs"   Text="Edit" runat="server" ID="btnSelect" CommandName="Select"
               CausesValidation="false" AlternateText="Edit comment"    />
            &nbsp;&nbsp;
            <asp:Button  class="btn btn-danger btn-xs" Text="Del"  runat="server" ID="btnDelete" CommandName="Delete" CommandArgument='<%# Eval("ID") %>'
               CausesValidation="false" AlternateText="Delete comment"  
               OnClientClick="if (confirm('Are you sure you want to delete this comment?') == false) return false;" />
            </asp:Panel>
         </td></tr>
         </table>
         <asp:Literal ID="lblBody" runat="server" Text='<%# Eval("EncodedBody") %>' />         
         </div>
      </ItemTemplate>
   </asp:DataList><asp:ObjectDataSource ID="objComments" runat="server" SelectMethod="GetComments"
      TypeName="MB.TheBlog.BLL.Articles.Comment" 
           onselecting="objComments_Selecting">
      <SelectParameters>
         <asp:QueryStringParameter DefaultValue="0" Name="articleID" QueryStringField="ID" Type="Int32" />
      </SelectParameters>
   </asp:ObjectDataSource>
   <p></p>
<h3 id="reply-title" class="comment-reply-title"><i class="fa fa-pencil"></i> Post your Comments </h3>
   <asp:DetailsView id="dvwComment" runat="server" AutoGenerateInsertButton="True" AutoGenerateEditButton="true" AutoGenerateRows="False" DataSourceID="objCurrComment" DefaultMode="Insert" OnItemInserted="dvwComment_ItemInserted" OnItemCommand="dvwComment_ItemCommand" DataKeyNames="ID" OnItemUpdated="dvwComment_ItemUpdated" OnItemCreated="dvwComment_ItemCreated">
      <FieldHeaderStyle Width="70%" />      
      <Fields>
         <asp:BoundField DataField="ID" HeaderText="ID:" ReadOnly="True" InsertVisible="False" />         
         <asp:BoundField DataField="AddedDate"   HeaderText="AddedDate:" InsertVisible="False" ReadOnly="True"/>
         <asp:BoundField DataField="AddedByIP" HeaderText="UserIP:" ReadOnly="True" InsertVisible="False" />
         <asp:TemplateField HeaderText="Name:">
            <ItemTemplate>
               <asp:Label ID="lblAddedBy" runat="server" Text='<%# Eval("AddedBy") %>' />
            </ItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox  CssClass="form-control"   ID="txtAddedBy" runat="server" Text='<%# Bind("AddedBy") %>' MaxLength="256" Width="100%"></asp:TextBox>
               <asp:RequiredFieldValidator ID="valRequireAddedBy" runat="server" ControlToValidate="txtAddedBy" SetFocusOnError="true"
                  Text="Your name is required." ToolTip="Your name is required." Display="Dynamic"></asp:RequiredFieldValidator>            
            </InsertItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="E-mail:">
            <ItemTemplate>
               <asp:HyperLink ID="lnkAddedByEmail" runat="server" Text='<%# Eval("AddedByEmail") %>'
                  NavigateUrl='<%# "mailto:" + Eval("AddedByEmail") %>' />
            </ItemTemplate>
            <InsertItemTemplate>
               <asp:TextBox  CssClass="form-control"   ID="txtAddedByEmail" runat="server" Text='<%# Bind("AddedByEmail") %>' MaxLength="256" Width="100%"></asp:TextBox>
               <asp:RequiredFieldValidator ID="valRequireAddedByEmail" runat="server" ControlToValidate="txtAddedByEmail" SetFocusOnError="true"
                  Text="Your e-mail is required." ToolTip="Your e-name is required." Display="Dynamic"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator runat="server" ID="valEmailPattern"  Display="Dynamic" SetFocusOnError="true"
                  ControlToValidate="txtAddedByEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                  Text="The e-mail is not well-formed." ToolTip="The e-mail is not well-formed." />
            </InsertItemTemplate>
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Comment:" >
            <ItemTemplate>
               <asp:Label ID="lblBody" runat="server" Text='<%# Eval("Body") %>' />
            </ItemTemplate>
            <EditItemTemplate>
               <asp:TextBox  CssClass="form-control"   ID="txtBody" runat="server" Text='<%# Bind("Body") %>' TextMode="MultiLine" Rows="5" Width="100%"></asp:TextBox>
               <asp:RequiredFieldValidator ID="valRequireBody" runat="server" ControlToValidate="txtBody" SetFocusOnError="true"
                  Text="The comment text is required." ToolTip="The comment text is required." Display="Dynamic"></asp:RequiredFieldValidator>
            </EditItemTemplate>
         </asp:TemplateField>
      </Fields>
   </asp:DetailsView>   
   <asp:ObjectDataSource  ID="objCurrComment" runat="server" InsertMethod="InsertComment"
      SelectMethod="GetCommentByID" TypeName="MB.TheBlog.BLL.Articles.Comment"
      UpdateMethod="UpdateComment" onselecting="objCurrComment_Selecting">
      <UpdateParameters>
         <asp:Parameter Name="id" Type="Int32" />
         <asp:Parameter Name="body" Type="String" />
      </UpdateParameters>
      <SelectParameters>
         <asp:ControlParameter ControlID="dlstComments" Name="commentID" PropertyName="SelectedValue"
            Type="Int32" />
      </SelectParameters>
      <InsertParameters>
         <asp:Parameter Name="addedBy" Type="String" />
         <asp:Parameter Name="addedByEmail" Type="String" />
         <asp:QueryStringParameter Name="articleID" QueryStringField="ID" Type="Int32" />
         <asp:Parameter Name="body" Type="String" />
      </InsertParameters>
   </asp:ObjectDataSource>
   </asp:Panel>  
</asp:Content>

