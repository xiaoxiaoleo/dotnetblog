using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace MB.TheBlog.DAL
{
   public static class SiteProvider
   {
      public static ArticlesProvider Articles
      {
         get { return ArticlesProvider.Instance; }
      }


      public static NewslettersProvider Newsletters
      {
         get { return NewslettersProvider.Instance; }
      }


   }
}
