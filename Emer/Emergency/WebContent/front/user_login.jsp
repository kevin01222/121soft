<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${basePath }css/bootstrap.min.css">
</head>
<body>
<body>
	<div class="container">
	            <div class="row" style="margin-top: 50px">
                 	<div class="col-md-5 col-md-offset-4 col-sm-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                           	欢迎来到突发事件报料网
	                        </div>
	                        <div class="panel-body">
	                            <ul class="nav nav-tabs">
	                                <li class="active"><a href="#login" data-toggle="tab">登录</a>
	                                </li>
	                                <li class=""><a href="#registry" data-toggle="tab">注册</a>
	                                </li>
	                            </ul>
	
	                            <div class="tab-content">
	                                <div class="tab-pane fade active in" id="login">
	                                   
		                                    <form role="form" id="login-form">
												<div class="form-group">
													<label for="name">姓名:</label> <input type="text"
														class="form-control" id="name" name="username"
														onblur="findByName()">
												</div>
												<div class="form-group">
													<label for="pwd">密码:</label> <input type="password"
														class="form-control" id="pwd" name="password">
												</div>
												<button type="button" class="btn btn-primary form-control"
													onclick="login()">登录</button>
											</form>
											<!-- 登录失败alert -->
											<div class="alert alert-danger"
												style="display: none; margin-top: 5px" id="login-fail">
												<a href="#" class="close" onclick="$('#login-fail').hide()"
													aria-label="close">&times;</a> <strong>密码错误。</strong> 请重新输入！
											</div>
											<!-- 用户不存在alert -->
											<div class="alert alert-danger"
												style="display: none; margin-top: 5px" id="username-fail">
												<a href="#" class="close" onclick="$('#username-fail').hide()"
													aria-label="close">&times;</a> <strong>用户名不存在!</strong>
												
											</div>
	                                </div>
	                                <div class="tab-pane fade" id="registry">
	                               
	                                    	<form role="form" id="registry-form">
											<div class="form-group">
												<label for="username">用户名:</label> <input type="text"
													class="form-control" id="username" name="username"
													onblur="findByName_reg()">
												
											</div>
											<div class="form-group">
												<label for="password">密码:</label> <input type="password"
													class="form-control" id="password" name="password"><span id="password_span"></span>
											</div>
						
											<div class="form-group">
												<label for="email">邮件地址:</label> <input type="email"
													class="form-control" id="email" name="email">
											</div>
											<div class="form-group">
												<label for="phone">联系电话:</label> <input type="tel"
													class="form-control" id="phone" name="phone">
											</div>
											
											<!-- <div class="form-group">
												<label for="level">选择头像:</label> <input type="file"
													class="form-control" id="level" name="level" value="1">
											</div> -->
											<button type="button" class="btn btn-primary form-control"
												onclick="registry()">注册</button>
										</form>
										<!-- 用户名已存在alert -->
										<div id="username_span" style="display:none;margin-top: 5px"><a href="#" class="close" onclick="$('#username_span').hide()"
												aria-label="close">&times;</a></div>
										<!-- 注册失败alert -->
										<div class="alert alert-danger"
											style="display: none; margin-top: 5px" id="registry-fail">
											<a href="#" class="close" onclick="$('#registry-fail').hide()"
												aria-label="close">&times;</a> <strong>fail!</strong> 请输入正确的注册信息！
										</div>
	                                </div>
	                                
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	</div>

	<script type="text/javascript" src="${basePath }js/jquery/jquery1.11.1.min.js"></script>
	<script type="text/javascript" src="${basePath }js/bootstrap/bootstrap.min.js"></script>
	<script>
		function login(d) {
			
			 d = $('#login-form').serialize();
			$.post("${basePath }user/loginUser", d, function(data, status, xhr) {
				if (data == "error") {
					$('#login-fail').show();
					setTimeout("$('#login-fail').hide();", 3000);
				} else {
					//如果是由评论和发布报料时未登录拦截的则跳转到之前的操作页
						var uri="${sessionScope.uriSession }";
					if( uri!="" ){
						window.open(uri, "_self");//页面跳转
					}else{
					//如果是正常登陆，则跳到首页
						window.open("${basePath }index.jsp", "_self");//页面跳转
					}
				}
			});
		};
		function findByName() {
			var username=$("#name").val();
			if(username==null||username==''){
				return false;
			}
			var d = "username=" +username;
			$.post("${basePath }user/findByNameUser", d, function(data, status, xhr) {
				if (data == "error") {
					$('#username-fail').show();
					setTimeout("$('#username-fail').hide();", 2000);
				}
			});
		};
		function findByName_reg() {
			var username=$("#username").val();
			if(username==null||username==''){
				return false;
			}
		 	var d = "username=" + username ;
			$.post("${basePath }user/findByNameUser", d, function(data, status, xhr) {
				if (data == "error") {
					$('#username_span').attr("class","alert alert-success").text('恭喜，该用户名没被注册过！').show();
					setTimeout("$('#username_span').hide();", 2000);
				}else{
					$('#username_span').attr("class","alert alert-danger").text('抱歉，该用户名已被注册！').show();
					//setTimeout("$('#username_span').hide();", 2000);//如果不换个用户名就一直提示
				}
			});
		}
		function registry(){
			var form1=document.getElementById("registry-form");
			if(form1.username.value==""){alert("用户名不能为空！");}		
			else if(form1.password.value==""){alert("密码不能为空！");}		
			else if(form1.email.value==""){alert("邮件地址不能为空！");}		
			else if(form1.phone.value==""){alert("联系电话不能为空！");}		
			else{
				var d=$("#registry-form").serialize();
				$.post("${basePath }user/registryUser",d,function(data,status,xhr){
					if (data == "error") {
						$('#registry-fail').show();
						setTimeout("$('#registry-fail').hide();", 3000);
					} else {
						alert("注册成功，将进入网站首页！");
						
						window.open("${basePath}index.jsp", "_self");//页面跳转
					}
				});
			}
		}
	</script>
</body>
</html>