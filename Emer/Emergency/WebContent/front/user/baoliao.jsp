<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath() + "/");
%>
<!DOCTYPE html>
<html>
<head>
<title>我要爆料</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${basePath }css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${basePath }css/bootstrap-datetimepicker.min.css">
<script type="text/javascript">
	window.UEDITOR_HOME_URL = "${basePath }js/ueditor/";
</script>

</head>
<body>
	<div class="container">
		<form class="form-horizontal" role="form" id="baoliao-form" action="${basePath }info/springUpload" enctype="multipart/form-data" method="POST">
			<div class="form-group">
				<label class="control-label col-md-2" for="add-title">标题：</label>
				<div class="col-md-9">
					<input type="text" class="form-control" id="add-title" name="title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2" for="add-description">简要描述：</label>
				<div class="col-md-9">
					<textarea class="form-control" id="add-description" name="description"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2" for="add-type">事件类型：</label>
				<div class="col-md-9">
					<select class="form-control" name="type" >
						  <option disabled>请选择事件类型..</option>
						  <option>社会安全事件</option>
						  <option>公共卫生事件</option>
						  <option>自然灾害</option>
						  <option>事故灾难</option>
					</select>
				</div>
			</div>
			<div class="form-group"  id="city_4">
				<label class="control-label col-md-2" for="add-place">事发地点：</label>
					<input type="hidden" id="add-place" name="place">
				<div class="col-md-3">
		            <select class="prov form-control" name="prov"></select> 
		        </div><div class="col-md-3">
		            <select class="city form-control col-md-3" disabled="disabled" name="city"></select>
		        </div><div class="col-md-3">    
		            <select class="dist form-control col-md-3" disabled="disabled" name="dist"></select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2" for="add-time">事发时间：</label>
				<div class="col-md-9">
					<input type="text" class="form-control datetimepicker" name="time" data-date-format="yyyy-mm-dd hh:ii:ss"><!-- data-date-format="yyyy-mm-dd hh:ii:ss" -->
				</div>
			</div>
				
			<div class="form-group">
				<label class="control-label col-md-2" for="add-audio">音频文件：</label>
				<div class="col-md-9">
					<input type="file" id="add-audio" name="audio" accept="audio/*" >
					<p class="help-block">请上传相关音频文件，支持mp3,wav,ogg等格式音频文件</p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2" for="add-video">视频文件：</label>
				<div class="col-md-9">
					<input type="file" id="add-video" name="video" accept="video/*">
					<p class="help-block">请上传相关视频文件，支持mp4,era,mpeg4,webm,mov等格式视频文件</p>
				</div>
			</div>

			<!-- 内容，上传者id,审核状态 :通过jQuery赋值 -->
			<div class="form-group">
			<label class="control-label col-md-2" for="add-content">图文信息：</label>
			<div class="col-md-9">
				<textarea id="add-content" name="content"></textarea>
				</div>
			</div>
			<input type="hidden" name="uploaderId" value=${sessionScope.user.userId }>
			<input type="hidden" name="state" value="待审核">
		</form>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<input type="button" class="btn btn-primary" id="submit1" value="OK,我要提交" form="baoliao-form"/>
				<a class="btn btn-primary" href="${basePath }index.jsp" >NO,不想爆了</a>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
<script type="text/javascript"
	src="${basePath }js/jquery/jquery1.11.1.min.js"></script>
<script type="text/javascript"
	src="${basePath }js/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basePath }js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basePath }js/ueditor/ueditor.all.min.js"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${basePath }js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8"
	 src="${basePath }js/bootstrap/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8" 
	src="${basePath }js/bootstrap/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript"
	src="${basePath }js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${basePath }js/city/jquery.cityselect.js"></script>
<%-- <script type="text/javascript" src="${basePath }js/jsonp/jquery.jsonp.js"> --%>
<!-- 初始化富文本编辑器，初始化默认时间 -->
	<script>
	$(function(){
		//初始化富文本编辑器，
		var ue = UE.getEditor('add-content');
		//初始化默认时间

		var date=new Date();
		var now="";
		now = date.getFullYear()+"-"; //读英文就行了
		now = now + (date.getMonth()+1)+"-";//取月的时候取的是当前月-1如果想取当前月+1就可以了
		now = now + date.getDate()+" ";
		now = now + date.getHours()+":";
		now = now + date.getMinutes()+":";
		now = now + date.getSeconds()+"";
		$('.datetimepicker').val(now);
		
		initPlace();
		//init_citySelect();
	});
	</script>
	<!-- 初始化选择地点操作， 初始化地点-->
	<script>
	//初始化选择地点操作， 初始化地点	
function initPlace(){
 	   var url = 'http://chaxun.1616.net/s.php?type=ip&output=json&callback=?&_=' + Math.random();
		$.ajax({
			url:url,
			type:"GET",
			dataType:"jsonp",
			processData: false,
			success:function(result){
				if(result!=null){
					//alert(JSON.stringify(result));
						init_citySelect({
							prov:result.Isp.substring(0,2),
							city:result.Isp.substring(3,5),
							dist:""
						});
					return;
				}else{
						alert(textStatus);
					alert("获取数据为空");
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				 alert(XMLHttpRequest.status);
			       alert(XMLHttpRequest.readyState);
			       alert(textStatus);
			}
		}); 
		init_citySelect(); 
}
	</script>
	<!-- 初始化选择日期操作 插件，datetimepicker-->
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
	$('#submit1').click(function(){
		//获取地点
		$('#add-place').val(function(){
			var prov=$('select[name="prov"]').val();
			var city=$('select[name="city"]').val();
			var dist=$('select[name="dist"]').val();
			if(prov!=null){
				if(city!=null){
					if(dist!=null){
						return prov+"-"+city+"-"+dist;	
					}else{
						return prov+"-"+city;	
					}
				}else{
					return prov;
				}
			}else{
				return null;
			}		
		});
		//判空处理
		var form1=document.getElementById("baoliao-form");
		if(form1.title.value==""){alert("标题不能为空！");}		
		else if(form1.type.value==""){alert("类型不能为空！");}		
/* 		else if(form1.place.value==""){alert("地点不能为空！");}		
		else if(form1.time.value==""){alert("时间不能为空！");}	 */	
		else{
			//提交表单
			 $('#baoliao-form').ajaxSubmit({
				 url:'${basePath }info/springUpload',
				 type:'post',
				 enctype:'multipart/form-data',
				 success:function(backdata){
					 if(backdata=='success'){
						 if(!window.confirm("添加成功，是否再报一个料？")){
							 window.open('${basePath}index.jsp','_self');
						 }else{
							 window.location.reload();
						 }
					 }else{
						 alert("添加失败！请检查！");
					 }
				 },
				 error:function(backdata){
					 alert("请求失败，请再次尝试！错误信息："+backdata);
				 }
			 });
		}
	});
function init_citySelect(init_data){
	if(init_data==null||init_data.prov==null||init_data.prov==""){
		$("#city_4").citySelect({
	        nodata: "none",
	        required: false,
	        prov:"广东",
	        city:"肇庆",
	        dist:"端州区"
		});
	}else{
		$("#city_4").citySelect({
	        nodata: "none",
	        required: false,
	        prov: init_data.prov,
	        city: init_data.city,
	        dist: init_data.dist
		})
	}
};

</script>
</body>
</html>