﻿<%@ Page Language="C#" AutoEventWireup="true" ContentType="text/xml" MaintainScrollPositionOnPostback="false" EnableTheming="false" CodeFile="GetArticlesRss.aspx.cs" Inherits="MB.TheBlog.UI.GetArticlesRss" %>
<head runat="server" visible="false"></head>

<asp:Repeater id="rptRss" runat="server">
   <HeaderTemplate>
      <rss version="2.0">
         <channel>
            <title><![CDATA[TheBlog: <%# RssTitle %>]]></title>
            <link><%# FullBaseUrl %></link>
            <description>TheBlog: A blog</description>
            <copyright>Copyright 2005 by Marco Bellinaso</copyright>
   </HeaderTemplate>
   <ItemTemplate>
      <item>
         <title><![CDATA[<%# Eval("Title") %>]]></title>
         <author><![CDATA[<%# Eval("AddedBy") %>]]></author>
         <description><![CDATA[<%# Eval("Abstract") %>]]></description>
         <link><![CDATA[<%# FullBaseUrl + "ShowArticle.aspx?ID=" + Eval("ID") %>]]></link>
         <pubDate><%# string.Format("{0:R}", Eval("AddedDate")) %></pubDate>
      </item>
   </ItemTemplate>
   <FooterTemplate>
         </channel>
      </rss>  
   </FooterTemplate>
</asp:Repeater>