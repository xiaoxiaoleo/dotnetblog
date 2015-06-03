using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security;
using MB.TheBlog;
using MB.TheBlog.BLL.Articles;

namespace MB.TheBlog.UI
{
   public partial class ShowArticle : BasePage
   {
      private bool _userCanEdit = false;
      protected bool UserCanEdit
      {
         get { return _userCanEdit; }
         set { _userCanEdit = value; }
      }

      int _articleID = 0;

      protected void Page_Init(object sender, EventArgs e)
      {
         UserCanEdit = (this.User.Identity.IsAuthenticated &&
            (this.User.IsInRole("Administrators")  ));
      }

      protected void Page_Load(object sender, EventArgs e)
      {
         if (string.IsNullOrEmpty(this.Request.QueryString["ID"]))
            throw new ApplicationException("Missing parameter on the querystring.");
         else
            _articleID = int.Parse(this.Request.QueryString["ID"]);

         if (!this.IsPostBack)
         {
            // 载入文章
            // 如果文章不存在
            Article article = Article.GetArticleByID(_articleID);
            if (article == null)
               throw new ApplicationException("No article was found for the specified ID.");

            // 如果文章存在，判断阅读者的角色
            if (!article.Published)
            {
               if (!this.UserCanEdit)
               {
                  throw new SecurityException(@"What are you trying to do??? 
                  You're not allowed to do view this article!");
               }
            }

            // if the article has the OnlyForMembers = true, and the current user is anonymous,
            // redirect to the login page
            if (article.OnlyForMembers && !this.User.Identity.IsAuthenticated)
               this.RequestLogin();

            article.IncrementViewCount();

            // if we get here, display all article's data on the page
            this.Title = string.Format(this.Title, article.Title);
            lblTitle.Text = article.Title;
            lblAddedBy.Text = article.AddedBy;
            lblCategory.Text = article.CategoryTitle;
            //lblRating.Text = string.Format(lblRating.Text, article.Votes);
            //ratDisplay.Value = article.AverageRating;
            //ratDisplay.Visible = (article.Votes > 0);
            lblViews.Text = string.Format(lblViews.Text, article.ViewCount);
            lblAbstract.Text = article.Abstract;
            lblBody.Text = article.Body;
            panComments.Visible = article.CommentsEnabled;
            //panEditArticle.Visible = this.UserCanEdit;
            //lnkEditArticle.NavigateUrl = string.Format(lnkEditArticle.NavigateUrl, _articleID);

           /* hide the rating box controls if the current user has already voted for this article
            int userRating = GetUserRating();
            if (userRating > 0)
               ShowUserRating(userRating); */
         }
      }

     /* protected void btnRate_Click(object sender, EventArgs e)
      {
          check whether the user has already rated this article
         int userRating = GetUserRating();
         if (userRating > 0)
         {
            ShowUserRating(userRating);
         }
         else
         {
            // rate the article, then create a cookie to remember this user's rating
            userRating = ddlRatings.SelectedIndex + 1;
            Article.RateArticle(_articleID, userRating);
            ShowUserRating(userRating);

            HttpCookie cookie = new HttpCookie(
               "Rating_Article" + _articleID.ToString(), userRating.ToString());
            cookie.Expires = DateTime.Now.AddDays(Globals.Settings.Articles.RatingLockInterval);
            this.Response.Cookies.Add(cookie);
         }
      }

      protected void ShowUserRating(int rating)
      {
         lblUserRating.Text = string.Format(lblUserRating.Text, rating);
         ddlRatings.Visible = false;
         btnRate.Visible = false;
         lblUserRating.Visible = true;
      }

      protected int GetUserRating()
      {
         int rating = 0;
         HttpCookie cookie = this.Request.Cookies["Rating_Article" + _articleID.ToString()];
         if (cookie != null)
            rating = int.Parse(cookie.Value);
         return rating;
      }
*/
      protected void dlstComments_SelectedIndexChanged(object sender, EventArgs e)
      {
         dvwComment.ChangeMode(DetailsViewMode.Edit);
      }

      protected void dvwComment_ItemCommand(object sender, DetailsViewCommandEventArgs e)
      {
         if (e.CommandName == "Cancel")
         {
            dlstComments.SelectedIndex = -1;
            dlstComments.DataBind();
         }
      }

      protected void dvwComment_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
      {
         dlstComments.SelectedIndex = -1;
         dlstComments.DataBind();
      }

      protected void dvwComment_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
      {
         dlstComments.SelectedIndex = -1;
         dlstComments.DataBind();
      }



      protected void btnDelete_Click(object sender, ImageClickEventArgs e)
      {
         Article.DeleteArticle(_articleID);
         this.Response.Redirect("BrowseArticles.aspx", false);
      }

      protected void dlstComments_ItemCommand(object source, DataListCommandEventArgs e)
      {
         if (e.CommandName == "Delete")
         {
            int commentID = int.Parse(e.CommandArgument.ToString());
            Comment.DeleteComment(commentID);
            dvwComment.ChangeMode(DetailsViewMode.Insert);
            dlstComments.SelectedIndex = -1;
            dlstComments.DataBind();
         }
      }

      protected void dvwComment_ItemCreated(object sender, EventArgs e)
      {
         // when in Insert Mode, pre-fill the username and e-mail fields with the
         // current user's information, if she is authenticated
         if (dvwComment.CurrentMode == DetailsViewMode.Insert &&
            this.User.Identity.IsAuthenticated)
         {
            MembershipUser user = Membership.GetUser();
            (dvwComment.FindControl("txtAddedBy") as TextBox).Text = user.UserName;
            (dvwComment.FindControl("txtAddedByEmail") as TextBox).Text = user.Email;
         }
      }
      protected void dvwComment_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
      {

      }
      protected void objCurrComment_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
      {

      }
      protected void objComments_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
      {

      }
}
}
