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
<title>我要留言</title>
<!-- Bootstrap Styles-->
<link href="${basePath}css/bootstrap.css" rel="stylesheet" />
</head>
<body style="font-family:Microsoft YaHei;">
<div class="container">

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
	    	<div class="panel-heading">
	    		<h1 class="panel-title" style="font-size:2.0em;">用户留言</h1>
	    	</div>
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
				  					<span style="word-break:break-all;">${apprise.appriseInfo }</span>
				  					<footer>来自用户：<cite title="Source Title">${apprise.user.username }</cite></footer>
								</blockquote>
						    </div>
						  </li>
					</c:forEach>
					
				</ul>
			</div>
			<div class="panel-foot">
				<c:if test="${!empty sessionScope.user }">
				<form  id="form1" name="form1">
					<fieldset style="padding:10px; margin:10px;" >
					<!--  style="box-shadow:0 0 10px rgba(0, 204, 204, .5); padding:10px; margin:10px;">
						<span style="font-size:1.5em;">留言区:</span> -->
						<legend ><font size="5">输入您的留言</font></legend>
						<textarea name="appriseInfo" rows=10; style="width:100%"></textarea>
						<input class="btn btn-success" type="button" onclick="form1submit()" value="发表" />
						&nbsp;&nbsp;
						<input class="btn btn-danger" type="reset"  onclick="return confirm('您确定重置吗？')" />
						&nbsp;&nbsp;
						<a class="btn btn-warning" onclick="return confirm('您确定返回首页吗？')" href="${basePath }index.jsp">返回</a>
						
					</fieldset>
						<input type="hidden" name="user.userId" value="${sessionScope.user.userId }"/>
						<input type="hidden" name="info.id" value="${info.id }"/>
				</form>
				</c:if>
				<c:if test="${empty sessionScope.user}">
					<h3>登录后方可留言！</h3><a href="${basePath }front/user/liuyan.jsp_infoId=${info.id }">登录</a>
				</c:if>
			</div>
		</div>
    </div>
</div>
	<!-- jQuery Js -->
	<script src="${basePath }js/jquery/jquery1.11.1.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${basePath }js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#info_content img').addClass('img-responsive');
	})
	function form1submit(){
		if(document.form1.appriseInfo.value==""){
			alert("留言不许为空！");
			return false;
		}else if(document.form1.appriseInfo.value.length>200){
			alert("请输入小于200个字符！");
			return false;
		}
		var senddata=$('#form1').serialize();
		var url="${basePath }apprise/saveApprise";
		$.post(url,senddata,function(backdata){
			if(backdata=="success"){
				if(window.confirm("留言成功，是否返回主页查看其它报料？")){
					 window.open('${basePath}index.jsp','_self');
				 }else{
					 window.location.reload();
				 }
			 }else{
				 alert("留言失败！请检查！");
			 }
		})
	}
	</script>
</body>
</html>