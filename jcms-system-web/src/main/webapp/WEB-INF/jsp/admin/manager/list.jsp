<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, Chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>桃李云 | 管理员控制台</title>
		<link rel="shortcut icon" href="<%=path %>/static/ramostear.ico"/>
		<!-- ZUI样式文件 -->
		<link rel="stylesheet" type="text/css" href="<%=path %>/static/admin/main/zui/css/zui.css" />
		<!-- 数据表格样式文件 -->
		<link rel="stylesheet" type="text/css" href="<%=path %>/static/admin/main/plugins/datatable/zui.datatable.css" />
		<!-- ztree样式文件 -->
		<link rel="stylesheet" type="text/css" href="<%=path %>/static/admin/main/plugins/ztree/metroStyle/metroStyle.css" />
		<!-- AdminTLY样式文件 -->
		<link rel="stylesheet" type="text/css" href="<%=path %>/static/admin/main/build/less/AdminTLY.css" />
		<!--面包屑导航样式-->
		<link rel="stylesheet" type="text/css" href="<%=path %>/static/admin/main/plugins/breadcrumb/breadcrumb-style.css" />
		<!--[if lt IE 9]>
			<script src="<%=path %>/static/admin/main/plugins/ie8/html5shiv.js"></script>
        <![endif]-->
		<!--[if lt IE 9]>
            <script src="<%=path %>/static/admin/main/plugins/ie8/respond.js"></script>
        <![endif]-->
		<!--[if lt IE 9]>
            <script src="<%=path %>/static/admin/main/plugins/ie8/excanvas.js"></script>
        <![endif]-->
		<!--[if lt IE 8]>
            <div class="alert alert-danger">您正在使用 <strong>过时的</strong> 浏览器. 是时候 <a href="http://browsehappy.com/">更换一个更好的浏览器</a> 来提升用户体验.</div>
        <![endif]-->
	</head>
	<body style="overflow-y: hidden;">
		<input type="hidden" class="path" value="<%=path %>">
		<jsp:include page="/common/head.jsp"></jsp:include>
		<div id="center-content">
			<div class="auto-height " style="float: left;">
				<div id="sidebar" class="pull-left sidebar-big">
					<a href="#" class="side-btn"><i class="icon icon-arrow-left"></i></a>
					<div class="side-user">
						<img id="head" class="img-circle" src="<%=path %>/static/admin/main/img/test-big/test_xiaoercun.jpg" alt="head" />
						<span class="user-name">谭朝红<a href="#"><i class="label label-success">在线</i></a></span>
						<form action="#" method="get">
							<div class="input-group search-group">
								<input class="side-search" type="search" />
								<span class="input-group-btn">
									<button type="submit" class="btn-search">
										<i class="icon icon-search"></i>
									</button>
								</span>
							</div>
						</form>
					</div>
					<jsp:include page="/common/menu.jsp"></jsp:include>
				</div>
			</div>
			<!-- 右侧内容 -->
			<div class="main-right">
				<div class="quick-nav">
				</div>
				<div class="auto-height main-content" id="pull-html" style="overflow-y:auto;">
					<div style="padding-top: 15px; padding-bottom: 15px;">
						<h1 style="display: inline;">管理员设置</h1>
						<h4 style="display: inline; color: #808080; margin-right: 15px;" class="pull-right">
							<a href="#">主页</a>
							/
							管理员设置
						</h4>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="panel" style="border-top-color: #38b03f;">
							<div class="my-panel-head">
								<span>管理员列表</span>
								<a href="#" class="pull-right" data-panel-toggle="#people-panel-body"><i class="icon icon-minus"></i></a>
							</div>
							<div class="panel-body table-responsive" id="people-panel-body">
								<div class="button-box" style="margin-bottom: 5px;">
									<a class="btn btn-primary" type="button" href="<%=path %>/admin/manager/create" target="_self">
									 	<i class="icon icon-plus"></i>&nbsp;${op}
									</a>
									<a class="btn btn-danger" type="button">
										<i class="icon icon-trash"></i>&nbsp;删除
									</a>
								</div><!-- 按钮容器结束-->
								<table class="table datatable table-hover table-condensed" id="permission">
									<thead>
										<tr>
											<th data-type="string">管理员账号</th>
											<th data-type="string">管理员昵称</th>
											<th data-type="string">创建者名称</th>
											<th data-type="string">创建时间</th>
											<th data-type="string">操作</th>
										</tr>
									</thead>
									<tbody id="mdata">
									</tbody>
								</table>
								<div id="page" style="margin-top:5px;text-align: right;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade modal-warning" id="modal-org">
				<div class="modal-dialog">
			  		<div class="modal-content">
					    <div class="modal-header">
					      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
					      	<h4 class="modal-title">警告</h4>
					    </div>
					    <div class="modal-body" id="del_msg">
					    	<p>确认删除该管理员吗？该操作不可逆！</p>
					    </div>
					    <div class="modal-footer">
					      	<button type="button" class="btn btn-default delBtn" data-dismiss="modal">取消</button>
					      	<button type="button" class="btn btn-danger" id="del_ok">确认</button>
					    </div>
			  		</div>
				</div>
			</div><!-- 删除部门对话框结束 -->
		</div>
		<script src="<%=path %>/static/admin/main/plugins/jqurry1.11.4/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/plugins/jquery-validate/jquery-validate.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/zui/js/zui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/plugins/datatable/zui.datatable.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/build/js/AdminTLY.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/plugins/ztree/jquery.ztree.all.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/laypage-v1.3/laypage/laypage.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=path %>/static/admin/main/default/org.jcms.manager.js"type="text/javascript"></script>
	</body>
</html>