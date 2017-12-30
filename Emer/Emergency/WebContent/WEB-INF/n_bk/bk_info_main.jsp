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
							<h3 class="panel-title">报料表</h3>
						</div>
						<div id="listContent" class="panel-body">
							<div class=" table-responsive">
							<form class="form-inline" action="${basePath}info/n_bk/findByConnectionInfos_">
								<div class="form-group form-group-sm">
									<label class="sr-only" for="title">通过标题查询</label>
									<input type="text" class="form-control" placeholder="通过标题查询" name="title" id="title" />
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="username">通过报料人查询</label>
									<input type="text" class="form-control" placeholder="通过报料人查询" name="user.username" id="username">
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="place">通过事发地点查询</label>
									<input type="text" class="form-control" placeholder="通过事发地点查询" name="place" id="place">
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="type">通过事件类型查询</label>
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
									<!--<label class="sr-only" for="state">通过审核状态查询</label>	
									  <input type="text" class="form-control" placeholder="通过审核状态查询" name="state" id="state">-->
								<div class="form-group form-group-sm">
									<label class="radio-inline">
									  <input type="radio" name="state" id="inlineRadio1" value="待审核">待审核
									</label>
									<label class="radio-inline">
									  <input type="radio" name="state" id="inlineRadio2" value="已通过">已通过
									</label>
									<label class="radio-inline">
									  <input type="radio" name="state" id="inlineRadio3" value="未通过">未通过
									</label>
									<label class="radio-inline">
									  <input type="radio" name="state" id="inlineRadio4" value=""  checked>全部
									</label>
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="start_time">起始时间</label>
									<input type="text" class="form-control datetimepicker" placeholder="起始时间" name="start_time" id="time1">-
								</div>
								<div class="form-group form-group-sm">
									<label class="sr-only" for="end_time">结束时间</label>	
									<input type="text" class="form-control datetimepicker" placeholder="结束时间" name="end_time" id="time2">
								</div>
								<button type="submit" class="btn btn-default btn-sm">Search</button>
							</form>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>编号</th>
										<th>标题</th>
										
										<th>报料人</th>
										<th>事发地点</th>
										<th>事发时间</th>
										<th>事件类型</th>
										<th>审核状态</th>
										<th>视频</th>
										<th>音频</th>
										<th>操作</th>
										<th>审核</th>
									</tr>
								</thead>
								<c:forEach items="${infos }" var="info">
									<tr>
										<td>${info.id }</td>
										<td><a href="${basePath }info/n_bk/findByIdInfo_?infoId=${info.id}"> ${info.title }</a></td>
										
										<td>${info.user.username }</td>
										<td>${info.place }</td>
										<td>${info.time }</td>
										<td>${info.type }</td>
										<td>${info.state }</td>
										<td>${!empty info.video }</td>
										<td>${!empty info.audio }</td>
										<td><a href="${basePath }info/deleteInfo_?id=${info.id }"
											onClick="return confirm('确定删除?');">删除</a>
											<a href="javascript:void(0)" onclick="checkAlter('${info.id }','${info.title }','${info.place }','${info.time }','${info.type }')">修改</a>
										</td><%-- ,'${info.user.userId }','${info.state }','${info.video }','${info.audio }','${info.content }' --%>
										<td>
											<c:if test="${info.state =='已通过'}"><a href="${basePath }info/updateInfo_?id=${info.id}&state=未通过">停用</a></c:if>
											<c:if test="${info.state =='未通过'}"><a href="${basePath }info/updateInfo_?id=${info.id}&state=已通过">发布</a></c:if>
											<c:if test="${info.state =='待审核'}"><a href="${basePath }info/updateInfo_?id=${info.id}&state=已通过">发布</a>|
																				<a href="${basePath }info/updateInfo_?id=${info.id}&state=未通过">停用</a></c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
							</div>
						</div>
					</div>
					<hr>
				</div>
	<!-- -------------------------修改modal-------------------- -->
	<div id="alter-Modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">修改爆料</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<form role="form" id="alter-form">
								<div class="form-group">
									<label for="">标题</label> <input type="text"
										class="form-control" id="alter-title" name="title">
								</div>
								<div class="form-group">
									<label for="">事发地点</label> <input type="text"
										class="form-control" id="alter-place" name="place">
								</div>
								<div class="form-group">
									<label for="">事发时间</label> <input type="text"
										class="form-control" id="alter-time" name="time">
								</div>
								<div class="form-group">
									<label for="">报料类型</label> <input type="text"
										class="form-control" id="alter-type" name="type">
								</div>
								<input type="hidden" id="alter-id" name="id">
<!-- 								<input type="hidden" id="alter-user" name="user">
								<input type="hidden" id="alter-state" name="state">
								<input type="hidden" id="alter-video" name="video">
								<input type="hidden" id="alter-audio" name="audio">
								<input type="hidden" id="alter-content" name="content"> -->
								
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
	<script>
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
	function checkAlter(id,title,place,time,type){//userId,,state,video,audio,content
		$('#alter-id').val(id);
		$('#alter-title').val(title);
		$('#alter-place').val(place);
		$('#alter-time').val(time);
		$('#alter-type').val(type);
/* 		$('#alter-user').val(userId);
		$('#alter-state').val(state);
		$('#alter-video').val(video);
		$('#alter-audio').val(audio);
		$('#alter-content').val(content); */
		$("#alter-Modal").modal();
	}
	function alter() {
		var d = $('#alter-form').serialize();
		//alert(d);
		$.post("${basePath}info/updateInfo", d,
				function(data, status, xhr) {
					if (data == "success") {
						alert(data);
						window.location.reload();
/* 						$('#table1').bootstrapTable("refresh");//刷新页面
						$('#alter-success').show();//提示 
						setTimeout("$('#alter-success').hide();", 3000);*/
					} else {
						alert(data);
						window.location.reload();
/*						$('#table1').bootstrapTable('refresh');
 						$('#alter-fail').show();//
						setTimeout("$('#alter-fail').hide();", 3000);//提示 */
					}
					$('#alter-id').val("");
					$('#alter-title').val("");
					$('#alter-place').val("");
					$('#alter-time').val("");
					$('#alter-type').val("");
/* 					$('#alter-user').val("");
					$('#alter-state').val("");
					$('#alter-video').val("");
					$('#alter-audio').val("");
					$('#alter-content').val(""); */
				})
	}
	</script>
</body>
</html>