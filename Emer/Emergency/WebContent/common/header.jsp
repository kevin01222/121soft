<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%
    pageContext.setAttribute("basePath", request.getContextPath()+"/") ;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
 <script type="text/javascript" src="${basePath}js/jquery/jquery1.11.1.min.js"></script>
 <link href="${basePath}css/skin1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/emergency/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/emergency/css/bootstrap-table.min.css">
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top"  role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="adminWin.html" >突发事件爆料网管理员后台</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li >
            <li><a href="info_main.html">爆料新闻管理</a></li>
            <li><a href="apprise_main.html">用户评论管理</a></li>
            <li><a href="user_main.html">用户管理</a></li>
            <li><a href="admin_main.html">管理员信息</a></li>                  
        </ul>
    </div>
    </div>
</nav>
</body>
</html>