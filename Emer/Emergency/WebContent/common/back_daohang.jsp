<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default top-navbar " role="navigation">
	<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">切换导航</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="${basePath }n_bk/bk_index">突发事件报料网</a>
	</div>
	<ul class="nav navbar-nav navbar-right">
		<%String adminname=(String)session.getAttribute("admin"); 
			if(adminname==null||adminname.equals("")){ %>

		<li><a href="${basePath }front/admin_login.jsp"><i class="fa fa-user fa-fw"></i>登录</a></li>
		<li class="divider"></li>
		<li><a href="${basePath }front/admin_registry.jsp"><i class="fa fa-user fa-fw"></i>注册</a></li>
		<% }else{%>
		<li><a href="#"><i class="fa fa-user fa-fw"></i>${sessionScope.admin }</a></li>
		<li class="divider"></li>
		<li><a href="${basePath }admin/logoutAdmin"><i
				class="fa fa-sign-out fa-fw"></i>注销</a></li>
		<%}%>

	</ul>
      </div>
</nav>
<!--/. NAV TOP  -->
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li><a href="${basePath }n_bk/bk_admin_main"><i class="glyphicon glyphicon-tower" aria-hidden="true"></i>管理员信息管理</a></li>
			<li><a href="${basePath }n_bk/bk_user_main"><i class="glyphicon glyphicon-user" aria-hidden="true"></i>会员信息管理</a></li>
			<li><a href="${basePath }info/n_bk/findAllInfos_"><i class="fa fa-pencil-square-o"></i>用户报料管理</a></li>
			<li><a href="${basePath }apprise/n_bk/findAllApprises_"><i class="fa fa-envelope-o"></i>用户留言管理</a></li>
		<%-- 	<li><a href="${basePath }n_bk/bk_chart_main"><i class="fa fa-bar-chart-o"></i>报表</a></li> --%>
		</ul>
	</div>
</nav>
<!-- /. NAV SIDE  -->
