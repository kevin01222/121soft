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
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">尊敬的管理员${sessionScope.admin}：欢迎来到突发事件管理后台！</h1>
					</div>
				</div>
				<!-- /. ROW  -->
				<!-- ------------------------start----------------------------------- -->
					<div id="carousel-example-generic" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img  src="${basePath}img/image3.jpg" class=" img-responsive img-rounded" alt="...">
							</div>
							<div class="item">
								<img  src="${basePath}img/image2.jpg" class=" img-responsive img-rounded" alt="...">
							</div>
							<div class="item">
								<img  src="${basePath}img/image1.jpg" class=" img-responsive img-rounded" alt="...">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="icon-next"></span>
						</a>
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
	<script src="${basePath}js/jquery/jquery1.11.1.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${basePath}js/bootstrap/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${basePath}js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${basePath}js/custom-scripts.js"></script>
</body>
</html>
