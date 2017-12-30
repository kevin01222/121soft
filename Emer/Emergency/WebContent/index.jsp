<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link href="${basePath }css/bootstrap.css" rel="stylesheet" />
	<style>
		body {
			padding-top: 50px;
		}
	</style>
</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><i class="glyphicon glyphicon-home" aria-hidden="true"></i>突发事件报料网</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

					<ul class="nav navbar-nav navbar-right">
						<c:if test="${empty sessionScope.user.username}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">请登录！<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${basePath }front/user_login.jsp">登录</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="${basePath }front/user_login.jsp" >注册</a></li>
							</ul>
						</li>
						</c:if>
						<c:if test="${!empty sessionScope.user.username}">
						
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">消息<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">我的报料</a></li>
								<li><a href="#">我的留言</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">别人的留言</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.username }<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">查看个人信息</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="${basePath }user/logoutUser">注销</a></li>
							</ul>
						</li>
						</c:if>
						<li><a href="${basePath }front/admin_login.jsp">管理员登录</a></li>
					</ul>
					
					<form class="navbar-form navbar-right" id="searchform">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="通过标题或类型搜索.." name="str">
						</div>
						<input type="button" onclick="search()" class="btn btn-default" value="搜索" />
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>

		<div class="jumbotron">
			<div class="container">
				<h1>欢迎报料!</h1>
				<p>Welcome to the incident site for service emergency source and comments, welcome to patronize!</p>
		<p><a class="btn btn-primary btn-lg" href="${basePath }front/user/baoliao.jsp" role="button">我要报料</a></p>
				<div class="row">
				<div class="col-md-4 col-sm-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            基本概念
                        </div>
                        <div class="panel-body">
                             <p>指突然发生，造成或可能造成严重社会危害，需要采取应急处置措施予以应对的自然灾害、事故灾难、公共卫生事件和社会安全事件。</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                           影响类型
                        </div>
                        <div class="panel-body">
                            <p>按照可控性、严重程度和影响范围，突发公共事件原则上划分为自然灾害、事故灾难、公共卫生事件、社会安全事件等四类。</p>
                        </div>
                    </div>
                </div>
            
                <div class="col-md-4 col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            危害级别
                        </div>
                        <div class="panel-body">
                            <p>按照社会会危害程度、影响范围等因素，自然灾害、事故灾难、公共卫生事件分为特别重大、重大、较大和一般四级。</p>
                        </div>
                    </div>
                </div>
            </div>
				<div class="row" id="content-item">
					
				</div>
			<!-- 16:9 aspect ratio -->
			<div class="embed-responsive embed-responsive-16by9">
				<video class="embed-responsive-item" src="${basePath }upload/video/a.mp4" controls="controls"></video>
			</div>
			</div>
		</div>
		<script type="text/javascript" src="${basePath }js/jquery/jquery1.11.1.min.js"></script>
		<script type="text/javascript" src="${basePath }js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
						$.post('${basePath }info/findAllInfosFront',function(data,i){
							$.each(data,function(i,item){
								//获取报料中的图片
								var content=data[i].content;
								var index1=content.indexOf("${basePath}ueditor/jsp/upload/image/");
						 		var img_str=null;
							 	if(index1>-1){
							 		var index2=content.indexOf(" title");
							 		img_str=content.substring(index1,index2-1);
							 	}
								var itemhtml="<div class='col-sm-6 col-md-4 col-xs-12'><div class='thumbnail'><img src="+(img_str==null?'${basePath }img/default1.jpg':img_str)+"> <div class='caption'><h3>"+data[i].id+":"+data[i].title+"</h3><p>事发地点："+data[i].place+"<br>事发时间："+data[i].time+"<br>事件类型："+data[i].type+"<br>发布人："+data[i].user.username+"</p><p><a href='${basePath}info/findByIdInfoFront_?infoId="+data[i].id+"' class='btn btn-primary' role='button' target='_self'>查看</a></p></div></div></div>";
								$("#content-item").append(itemhtml);
								if(i%3==2){
									$("#content-item").append("<div class=\"clearfix visible-md-none\"></div>");
								}
							});
						},"json");
			});
			function search(){
				$("#content-item").empty();
				var senddata=$("#searchform").serialize();
				$.post('${bastPath }info/findBySearchInfosFront',senddata,function(data,i){
					$.each(data,function(i,item){
						//获取报料中的图片
						var content=data[i].content;
						var index1=content.indexOf("${basePath}ueditor/jsp/upload/image/");
				 		var img_str=null;
					 	if(index1>-1){
					 		var index2=content.indexOf(" title");
					 		img_str=content.substring(index1,index2-1);
					 	}
						var itemhtml="<div class='col-sm-6 col-md-4 col-xs-12'><div class='thumbnail'><img src="+(img_str==null?'${basePath }img/default1.jpg':img_str)+"> <div class='caption'><h3>"+data[i].id+":"+data[i].title+"</h3><p>事发地点："+data[i].place+"<br>事发时间："+data[i].time+"<br>事件类型："+data[i].type+"<br>发布人："+data[i].user.username+"</p><p><a href='${basePath}info/findByIdInfoFront_?infoId="+data[i].id+"' class='btn btn-primary' role='button' target='_self'>查看</a></p></div></div></div>";
						$("#content-item").append(itemhtml);
						if(i%3==2){
							$("#content-item").append("<div class=\"clearfix visible-md-none\"></div>");
						}
					});
				},"json");
			}
		</script>
	</body>
</html>