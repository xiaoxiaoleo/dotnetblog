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
using System.Web.Profile;
using MB.TheBlog;

namespace MB.TheBlog.UI.Admin
{
   public partial class ManageUsers : BasePage
   {
      private MembershipUserCollection allUsers = Membership.GetAllUsers();

      protected void Page_Load(object sender, EventArgs e)
      {
         if (!this.IsPostBack)
         {
            lblTotUsers.Text = allUsers.Count.ToString();
            lblOnlineUsers.Text = Membership.GetNumberOfUsersOnline().ToString();
         }
         gvwUsers.DataSource = Membership.GetAllUsers();
         gvwUsers.DataBind();
      }


      protected void gvwUsers_RowCreated(object sender, GridViewRowEventArgs e)
      {
         if (e.Row.RowType == DataControlRowType.DataRow)
         {
            ImageButton btn = e.Row.Cells[5].Controls[0] as ImageButton;
            btn.OnClientClick = "if (confirm('Are you sure you want to delete this user account?') == false) return false;";
         }
      }

      protected void gvwUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
      {
         string userName = gvwUsers.DataKeys[e.RowIndex].Value.ToString();
         ProfileManager.DeleteProfile(userName);
         Membership.DeleteUser(userName);
         lblTotUsers.Text = allUsers.Count.ToString();
      }

     
   }
}