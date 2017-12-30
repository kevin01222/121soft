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
	<div class="col-md-12">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3 class="panel-title">会员表</h3>
			</div>
			<div id="listContent" class="panel-body table-responsive">
				<table id='table1'></table>
				<!-- 工具条bar -->
				<div id="toolbar" class="btn-group">
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#add-Modal">
						<i class="glyphicon glyphicon-plus"></i>新增
					</button>
					<button type="button" class="btn btn-default" data-toggle="modal"
						onclick="checkAlterCount()" id="btn-alter">
						<i class="glyphicon glyphicon-pencil"></i>修改
					</button>
					<button type="button" class="btn btn-default" data-toggle="modal"
						onclick="checkDeleteCount()" id="btn-delete">
						<i class="glyphicon glyphicon-trash"></i>删除
					</button>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!-- 添加modal 模态框-->
	<div id="add-Modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">添加用户</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<form role="form" id="add-form">
								<div class="form-group">
									<label for="">用户名:</label> <input type="text"
										class="form-control" id="add-username" name="username">
								</div>
								<div class="form-group">
									<label for="">用户密码:</label> <input type="text"
										class="form-control" id="add-password" name="password">
								</div>
								<div class="form-group">
									<label for="">联系电话:</label> <input type="text"
										class="form-control" id="add-phone" name="phone">
								</div>
								<div class="form-group">
									<label for="">电子邮箱:</label> <input type="text"
										class="form-control" id="add-email" name="email">
								</div>
								<div class="form-group">
									<label for="">用户级别:</label> <input type="text"
										class="form-control" id="add-level" name="level">
								</div>

								<button type="button" class="btn btn-primary" onclick="add()"
									data-toggle="modal" data-target="#add-Modal">添加</button>
							</form>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 删除modal -->
	<div id="delete-Modal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">删除用户</h4>
				</div>
				<div class="modal-body">
					<p>确定要删除这些吗？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" onclick="del()"
						data-toggle="modal" data-target="#delete-Modal">删除</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 修改modal -->
	<div id="alter-Modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">修改用户</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<form role="form" id="alter-form">
								<div class="form-group">
									<label for="">用户编号:</label> <input class="form-control"
										id="alter-userid" name="userId" readOnly="readOnly">
								</div>
								<div class="form-group">
									<label for="">用户名:</label> <input type="text"
										class="form-control" id="alter-username" name="username">
								</div>
								<div class="form-group">
									<label for="">用户密码:</label> <input type="text"
										class="form-control" id="alter-password" name="password">
								</div>
								<div class="form-group">
									<label for="">联系电话:</label> <input type="text"
										class="form-control" id="alter-phone" name="phone">
								</div>
								<div class="form-group">
									<label for="">电子邮箱:</label> <input type="text"
										class="form-control" id="alter-email" name="email">
								</div>
								<div class="form-group">
									<label for="">用户级别:</label> <input type="text"
										class="form-control" id="alter-level" name="level">
								</div>
								<button type="button" class="btn btn-primary" onclick="alter()"
									data-toggle="modal" data-target="#alter-Modal">修改</button>
							</form>
						</div>
						<div class="col-md-3"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加成功alert -->
	<div class="alert alert-success" style="display: none" id="add-success">
		<strong>Success!</strong>添加新用户成功！
	</div>
	<!-- 添加失败alert -->
	<div class="alert alert-danger" style="display: none" id="add-fail">
		<strong>Fail!</strong>添加新用户失败！
	</div>
	<!-- 删除成功alert -->
	<div class="alert alert-success" style="display: none"
		id="delete-success">
		<strong>Success!</strong>删除用户成功！！
	</div>
	<!-- 删除失败alert -->
	<div class="alert alert-danger" style="display: none" id="delete-fail">
		<strong>Fail!</strong>删除新用户失败！
	</div>
	<!-- 修改成功alert -->
	<div class="alert alert-success" style="display: none"
		id="alter-success">
		<strong>Success!</strong>更新用户成功！
	</div>
	<!-- 修改失败alert -->
	<div class="alert alert-danger" style="display: none" id="alter-fail">
		<strong>Fail!</strong>更新用户失败！
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
	<script src="${basePath}js/bootstrap/bootstrap-table.min.js"></script>
	<script src="${basePath}js/bootstrap/bootstrap-table-zh-CN.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${basePath}js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${basePath}js/custom-scripts.js"></script>
	<script type="text/javascript">
		$('#table1').bootstrapTable({
			url : '${basePath }user/findAllUsers',
			toolbar : '#toolbar',
			toolbarAlign : 'left',
			search : true,
			columns : [ {
				field : 'ck',
				checkbox : true,
				align : 'center',
				valign : 'middle'
			}, {
				field : 'userId',
				title : '用户编号',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'username',
				title : '用户名',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'password',
				title : '密码',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'phone',
				title : '联系电话',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'email',
				title : '电子邮箱',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'level',
				title : '用户级别',
				align : 'center',
				valign : 'middle'
			} ],
			pagination : true,//翻页
			pageSize : 10,//初始每页显示数量
			pageList : [ 2, 5, 10, 20, 50, 100 ],//每页内容数量下拉框
			maintainSelected : true, //
			showRefresh : true,
		})
	</script>
	<script type="text/javascript">
		function checkAlterCount() {
			var array = $('#table1').bootstrapTable("getAllSelections");
			if (array.length == 0) {
				alert("请选择一行数据！");
				var a = document.getElementById("btn-alter");
				a.dataset.target = "";
			} else if (array.length > 1) {
				alert("请选择一行数据，不要选多行！");
				var a = document.getElementById("btn-alter");
				a.dataset.target = "";
			} else {
				var a = document.getElementById("btn-alter");
				a.dataset.target = "#alter-Modal";
				$('#alter-userid').val(array[0].userId);
				$('#alter-username').val(array[0].username);
				$('#alter-password').val(array[0].password);
				$('#alter-phone').val(array[0].phone);
				$('#alter-email').val(array[0].email);
				$('#alter-level').val(array[0].level);
			}
		}
		function checkDeleteCount() {
			var array = $('#table1').bootstrapTable("getAllSelections");
			var id = new Array();
			if (array.length < 1) {
				alert("请选择至少一行数据！");
				var a = document.getElementById("btn-delete");
				a.dataset.target = "";
			} else {
				//alert("delete-count:"+array.length);
				var a = document.getElementById("btn-delete");
				a.dataset.target = "#delete-Modal";
				for (var i = 0; i < array.length; i++) {
					id[i] = array[i].userId;
				}
				return id;
			}
		}
		function add() {
			var d = $('#add-form').serialize();
			//alert(d);
			$.post("${basePath }user/saveUser", d, function(data, status, xhr) {
				if (data == "success") {
					$('#table1').bootstrapTable("refresh");
					$('#add-success').show();
					setTimeout("$('#add-success').hide();", 3000);
				} else {
					$('#table1').bootstrapTable("refresh");
					$('#add-fail').show();
					setTimeout("$('#add-fail').hide();", 3000);
				}
				$('#add-username').val("");
				$('#add-password').val("");
				$('#add-phone').val("");
				$('#add-email').val("");
				$('#add-level').val("");
			});
		}

		function del() {
			var id = checkDeleteCount();
			var s = "[{";
			for (var i = 0; i < id.length; i++) {
				s += "userId:" + id[i] + "},{";
			}
			s = s.substr(0, s.length - 2);
			s += "]";
			//		alert(s);
			$.post("${basePath }user/deleteUser", "ids=" + s, function(data,
					status, xhr) {
				//			alert(data);
				if (data == "success") {
					$('#table1').bootstrapTable("refresh");
					$('#delete-success').show();
					setTimeout("$('#delete-success').hide();", 3000);
				} else {
					$('#table1').bootstrapTable("refresh");
					$('#delete-fail').show();
					setTimeout("$('#delete-fail').hide();", 3000);
				}
			});
		}

		function alter() {
			var array = $('#table1').bootstrapTable('getAllSelections');
			var d = $('#alter-form').serialize();
			$.post("${basePath }user/updateUser", d,
					function(data, status, xhr) {
						if (data == "success") {
							$('#table1').bootstrapTable("refresh");
							$('#alter-success').show();
							setTimeout("$('#alter-success').hide();", 3000);
						} else {
							$('#table1').bootstrapTable('refresh');
							$('#alter-fail').show();
							setTimeout("$('#alter-fail').hide();", 3000);
						}
						$('#alter-userid').val("");
						$('#alter-username').val("");
						$('#alter-password').val("");
						$('#alter-phone').val("");
						$('#alter-email').val("");
						$('#alter-level').val("");
					})
		}
	</script>
</body>
</html>