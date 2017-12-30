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
<link href="${basePath }css/bootstrap-datetimepicker.min.css"  rel="stylesheet" >
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
							<h3 class="panel-title">留言表</h3>
						</div>
						<div id="listContent" class="panel-body table-responsive">
							<form class="form-inline" action="${basePath}apprise/n_bk/findByConnectionApprises_">
								<div class="form-group form-group-sm">
									 <label class="sr-only" for="title">通过标题查询</label>
									<input type="text" class="form-control" placeholder="通过标题查询" name="title" id="title" />
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="username">通过用户查询</label>
									<input type="text" class="form-control" placeholder="通过用户查询" name="username" id="username">
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="appriseInfo">通过留言内容查询</label>
									<input type="text" class="form-control" placeholder="通过留言内容查询" name="appriseInfo" id="appriseInfo">
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="time1">起始时间</label>
									<input type="text" class="form-control datetimepicker" placeholder="起始时间" name="time1" id="time1">-
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="time2">结束时间</label>	
									<input type="text" class="form-control datetimepicker" placeholder="结束时间" name="time2" id="time2">
								</div>
								<button type="submit" class="btn btn-default btn-sm">Search</button>
							</form>
							<table class="table table-hover">
								<thead>
									<tr>
									<!-- <th>#</th> -->
									<th>留言编号</th>
									<th>报料标题</th>
									<th>评论人</th>
									<th>评论时间</th>
									<th>评论内容</th>
									<th>审核状态</th>
									<th>操作</th>
									<th>审核</th>
									</tr>
								</thead>
								<c:forEach items="${apprises }" var="apprise">
									<tr>
										<!-- <td><input type="checkbox"/></td> -->
										<td>${apprise.id }</td>
										<td><a
											href="${basePath }info/n_bk/findByIdInfo_?infoId=${apprise.info.id}">
												${apprise.info.title }</a></td>
										<td>${apprise.user.username }</td>
										<td>${apprise.time }</td>
										<td><a href="javascript:void()" onclick="show_appriseInfo('${apprise.id }','${apprise.appriseInfo}')">点击查看</a></td>
										<td>${apprise.state }</td>
										<td><a
											href="${basePath }apprise/deleteApprise_?id=${apprise.id }"
											onClick="return confirm('确定删除?');">删除</a></td>
										<td>
											<c:if test="${apprise.state =='已通过'}"><a href="${basePath }apprise/updateApprise_?id=${apprise.id}&state=未通过">停用</a></c:if>
											<c:if test="${apprise.state =='未通过'}"><a href="${basePath }apprise/updateApprise_?id=${apprise.id}&state=已通过">发布</a></c:if>
											<c:if test="${apprise.state =='待审核'}"><a href="${basePath }apprise/updateApprise_?id=${apprise.id}&state=已通过">发布</a>|
																				<a href="${basePath }apprise/updateApprise_?id=${apprise.id}&state=未通过">停用</a></c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<hr>
				</div>
	<!-- -------------------------修改modal-------------------- -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               	用户留言：
            </h4>
         </div>
         <div class="modal-body">
         <input type="hidden" id="modal_appriseId">
         <textarea class="form-control" id="modal_appriseInfo"></textarea>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" onclick="alter()">
              	 提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
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
	<script src="${basePath}js/jquery/jquery1.11.1.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${basePath}js/bootstrap/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="${basePath}js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="${basePath}js/custom-scripts.js"></script>
	<!-- Bootstrap-datetimepicker -->
	<script type="text/javascript" charset="utf-8"
	 src="${basePath }js/bootstrap/bootstrap-datetimepicker.min.js"></script>
	<!-- Bootstrap-datetimepicker.zh-CN -->
<script type="text/javascript" charset="utf-8" 
	src="${basePath }js/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	 $('.datetimepicker').datetimepicker({
	    	language:  'zh-CN',
	    	weekStart: 1,
	    	todayBtn:  "linked",
	    	autoclose: 1,
	    	todayHighlight: 1,
	    	startView: 2,
		    format: 'yyyy-mm-dd hh:ii:ss',
		    initialDate:new Date(),
		    minuteStep :2,
		    forceParse:true
	});
	function show_appriseInfo(id,msg){
			$('#modal_appriseId').val(id);
			$('#modal_appriseInfo').val(msg);
		   $('#myModal').modal();
	}
	function alter() {
		var d ="appriseInfo="+$('#modal_appriseInfo').val()+"&id="+$('#modal_appriseId').val();
		alert(d);
		 $.post("${basePath}apprise/updateApprise", d,
			function(data, status, xhr) {
				if (data == "success") {
					alert("修改成功！");
					window.location.reload();
				} else {
					alert(data);
					window.location.reload();
				}
			}); 
	}
</script>
</body>
</html>