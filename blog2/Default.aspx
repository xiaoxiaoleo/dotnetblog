<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="blog2._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        MYSQL的字符集转换过程

1. MySQL Server收到请求时将请求数据从character_set_client转换为character_set_connection；

2. 进行内部操作前将请求数据从character_set_connection转换为内部操作字符集，其确定方法如下：

• 使用每个数据字段的CHARACTER SET设定值；

• 若上述值不存在，则使用对应数据表的DEFAULT CHARACTER SET设定值(MySQL扩展，非SQL标准)；

• 若上述值不存在，则使用对应数据库的DEFAULT CHARACTER SET设定值；

• 若上述值不存在，则使用character_set_server设定值。

将操作结果从内部操作字符集转换为character_set_results。
    </h2
  
</asp:Content>
