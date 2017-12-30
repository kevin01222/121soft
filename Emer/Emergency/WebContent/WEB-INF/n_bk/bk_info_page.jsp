<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>突发事件报料网</title>
<!-- Bootstrap Styles-->
<link href="${basePath}css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="${basePath}css/font-awesome.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="${basePath}css/custom-styles.css" rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<%@include file="../../common/back_daohang.jsp"%>
		<div id="page-wrapper">
			<div id="page-inner">
<!-- ------------------------start----------------------------------- -->
<div class="panel panel-danger col-xs-12" style=" background-color:#F8F8FF;">
  		<div class="panel-heading">
			<h1 class="panel-title" style="font-size:2.0em;">报料展示</h1>
		</div>
		<div class="panel-body">
			<table class="table table-striped" style="font-size:1.5em;">
			    <tr>
			    	<td>报料编号：${info.id }</td>
			    	<td>简述：${info.description }</td>
			    </tr>
			    <tr>
			    	<td>标题：${info.title }</td>
			    	<td>发布人：${info.user.username }</td>
			    </tr>
			    <tr>
			    	<td>事发时间：${info.time }</td>
			  		<td>事发地点：${info.place }</td>
			  	</tr>
			  	<tr>
			  		<td>信息分类：${info.type }</td>
			    	<td>审核状态：${info.state }</td>
			    </tr>
			</table>
			<div class="panel" style="border:1px solid gray;">
				<div class="panel-heading" style="border-bottom:1px solid gray;">
					<h1 class="panel-title" style="font-size:2.0em;">报料内容：</h1>
				</div>
				<div class="panel-body" id="info_content">
				${info.content }
				</div>
			</div>
			<div class="row">
				<div class="col-md-2"><font size="5">报料视频</font></div>
				<div class="col-md-8" >
					<div id="video" class="embed-responsive embed-responsive-16by9">
				        <video src="${basePath}${info.video }" class="embed-responsive-item" controls="controls"></video>
					</div>
				</div>
			</div>
			<fieldset>
    			<legend ><font size="5">报料音频</font></legend>
    			<div style="margin-top:20px; box-shadow:0 0 10px rgba(0, 204, 204, .5);">
					<audio src="${basePath}${info.audio }" class="embed-responsive-item"  controls="controls"></audio>
				</div>
    		</fieldset>		
   		</div>
   	
 
    <div class="panel panel-warning">
    	<div class="panel-heading"><h3 class="panel-title">用户留言</h3></div>
    	<div class="panel-body">
		<ul class="media-list">
			<c:forEach items="${apprises }" var="apprise">
				  <li class="media">
				    <div class="media-left">
				      <a href="#">
				        <img class="media-object" src="${basePath }img/user2.jpg" alt="...">
				      </a>
				    </div>
				    <div class="media-body">
		    			<blockquote class="bg-danger">
				      		<h5 class="media-heading">${apprise.time }</h5>
		  					<p>${apprise.appriseInfo }</p>
		  					<footer>来自用户：<cite title="Source Title">${apprise.user.username }</cite></footer>
						</blockquote>
				    </div>
				  </li>
			</c:forEach>
		</ul>
		</div>
    </div>
</div>

<!-- ------------------------end----------------------------------- -->
				<footer>
					<p>
						薛凯文 &copy; 2017.03.10<a target="_blank"
							href="http://120.27.123.23/myresume.html">关于我们</a>
					</p>
				</footer>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="${basePath }js/jquery/jquery1.11.1.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${basePath }js/bootstrap/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${basePath }js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${basePath }js/custom-scripts.js"></script>
	<script type="text/javascript">
	$('#info_content img').addClass('img-responsive');
	</script>
</body>
</html>