using System;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace MB.TheBlog
{
   public static class Globals
   {
      public readonly static TheBlogSection Settings = (TheBlogSection)WebConfigurationManager.GetSection("theBlog");
      public static string ThemesSelectorID = "";

      static Globals()
      {
       
      }      
   }
}