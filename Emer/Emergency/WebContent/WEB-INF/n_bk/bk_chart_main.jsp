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
<!-- ------------------------start----------------------------------- -->
<form class="form-inline" action="${basePath}info/n_bk/findByConnectionInfos_">


	<div class="form-group form-group-sm">
		<label class="sr-only" for="place">通过地点统计</label>
		<input type="text" class="form-control" placeholder="通过事发地点查询" name="place" id="place">
	</div>
	<div class="form-group form-group-sm">
		<label class="sr-only" for="type">通过事件类型统计</label>
		<!-- <input type="text" class="form-control" placeholder="通过事件类型查询" name="type" id="type"> -->
		<select class="form-control" name="type">
		  <option disabled>请选择事件类型..</option>
		  <option value="">全部类型</option>
		  <option>社会安全事件</option>
		  <option>公共卫生事件</option>
		  <option>自然灾害</option>
		  <option>事故灾难</option>
		</select>
	</div>
	<button type="submit" class="btn btn-default btn-sm">Search</button>
</form>
<div id="main" style="width:400px;height:300px;"></div>
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
<script>
	
</script>
</html>