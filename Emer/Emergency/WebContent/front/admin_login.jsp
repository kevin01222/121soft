<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>管理员登录</title>
<link rel="stylesheet" href="${basePath }css/bootstrap.css">
</head>
<body>
	<div class="container login">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2 text">
				<h1>
					<strong>管理员登录</strong>Login Form
				</h1>
				<div class="description">
					<p>
						请进到管理员的职责，为突发事件的报料进行严格审核，对 用户的留言进行严格把关！
					</p>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 50px">
			<div class="col-sm-6 col-sm-offset-3 form-box">
				<form role="form" id="login-form"
					action="${basePath }admin/loginAdmin" method="post">
					<div class="form-group has-feedback">
						<label for="name">姓名:</label> <input type="text"
							class="form-control" id="name" name="username"> <span
							class="form-control-feedback" aria-hidden="true"></span>
					</div>
					<div class="form-group has-feedback">
						<label for="pwd">密码:</label> <input type="password"
							class="form-control" id="pwd" name="password"> <span
							class="form-control-feedback" aria-hidden="true"></span>
					</div>
					<button id="submit_btn" class="btn btn-primary form-control">登录</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${basePath }js/jquery/jquery1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${basePath }js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
		$('form input:eq(0)').blur(
						function() {
							var d = "username=" + $("#name").val();
							$.post("${basePath }admin/findByNameAdmin",d,
											function(data, status, xhr){
												if (data == "error") {
													//alert("error");
													$('form div:eq(0)')
															.attr("class",
																	"form-group has-error has-feedback");
													$(
															'form div:eq(0) span:eq(0)')
															.attr("class",
																	"glyphicon glyphicon-remove form-control-feedback");
												} else {
													//alert("success");
													$('form div:eq(0)')
															.attr("class",
																	"form-group has-success has-feedback");
													$('form div:eq(0) span')
															.attr("class",
																	"glyphicon glyphicon-ok form-control-feedback");
												}
											});
						});
		$('form input:eq(1)').blur(
						function login(){
							var d = $('#login-form').serialize();
							$.post("${basePath }admin/admin_login",d,
											function(data, status, xhr) {
												if (data == "error") {
													//alert("error");
													$('form div:eq(1)')
															.attr("class",
																	"form-group has-error has-feedback");
													$('form div:eq(1) span:eq(0)')
															.attr("class",
																	"glyphicon glyphicon-remove form-control-feedback");
													$('#submit_btn').attr("class","btn btn-primary form-control disabled");
												} else {
													//alert("success");
													$('form div:eq(1)')
															.attr("class",
																	"form-group has-success has-feedback");
													$('form div:eq(1) span:eq(0)')
															.attr("class",
																	"glyphicon glyphicon-ok form-control-feedback");
													$('#submit_btn').attr("class","btn btn-primary form-control");
												}
											});
						});
	</script>
</body>
</html>