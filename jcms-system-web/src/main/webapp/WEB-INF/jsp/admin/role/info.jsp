<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>桃李云 | 管理员控制台</title>
<link rel="shortcut icon" href="<%=path %>/static/ramostear.ico"/>
<!-- ZUI样式文件 -->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/static/admin/main/zui/css/zui.css" />
<!-- 数据表格样式文件 -->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/static/admin/main/plugins/datatable/zui.datatable.css" />
<!-- ztree样式文件 -->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/static/admin/main/plugins/ztree/metroStyle/metroStyle.css" />
<!-- AdminTLY样式文件 -->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/static/admin/main/build/less/AdminTLY.css" />
<!--面包屑导航样式-->
<link rel="stylesheet" type="text/css"
	href="<%=path %>/static/admin/main/plugins/breadcrumb/breadcrumb-style.css" />
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
	<input type="hidden" id="roleId" value="${role.id }">
	<jsp:include page="/common/head.jsp"></jsp:include>
	<div id="center-content">
		<div class="auto-height " style="float: left;">
			<div id="sidebar" class="pull-left sidebar-big">
				<a href="#" class="side-btn"><i class="icon icon-arrow-left"></i></a>
				<div class="side-user">
					<img id="head" class="img-circle"
						src="<%=path %>/static/admin/main/img/test-big/test_xiaoercun.jpg" alt="head" />
					<span class="user-name">谭朝红<a href="#"><i
							class="label label-success">在线</i></a></span>
					<form action="#" method="get">
						<div class="input-group search-group">
							<input class="side-search" type="search" /> <span
								class="input-group-btn">
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
			<div class="quick-nav"></div>
			<div class="auto-height main-content" id="pull-html"
				style="overflow-y: auto;">
				<div style="padding-top: 15px; padding-bottom: 15px;">
					<h1 style="display: inline;">角色管理</h1>
					<h4 style="display: inline; color: #808080; margin-right: 15px;"
						class="pull-right">
						<a href="#">主页</a> / <a href="#">角色管理</a> /${op }
					</h4>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="panel" style="border-top-color: #38b03f;">
						<div class="my-panel-head">
							<span>${op }</span> <a href="#" class="pull-right"
								data-panel-toggle="#people-panel-body"><i
								class="icon icon-minus"></i></a>
						</div>
						<div class="panel-body table-responsive" id="people-panel-body">
							<form class="form-horizontal container">
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label for="role" class="col-lg-2 col-md-2 col-sm-2">角色标识</label>
										<div class="col-md-8 col-sm-6">
											<input type="text" class="form-control" id="role" value="${role.roleName}"
											readonly="readonly">
										</div>
									</div>
									<div class="form-group">
										<label for="role" class="col-lg-2 col-md-2 col-sm-2">创建者</label>
										<div class="col-md-8 col-sm-6">
											<input type="text" class="form-control" id="role" value="${role.creator}"
											readonly="readonly"	>
										</div>
									</div>
									<div class="form-group">
										<label for="role" class="col-lg-2 col-md-2 col-sm-2">创建时间</label>
										<div class="col-md-8 col-sm-6">
											<input type="text" class="form-control" id="role" value="${role.createTime}"
											readonly="readonly"	>
										</div>
									</div>
									<div class="form-group">
										<label for="description" class="col-lg-2 col-md-2 col-sm-2">角色描述</label>
										<div class="col-md-8 col-sm-6">
											<textarea class="form-control" id="description" rows="5" 
												readonly="readonly" >${role.description} </textarea>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6">
									<div class="form-group">
										<label for="description" class="col-lg-2 col-md-2 col-sm-2">权限范围</label>
										<div class="input-group col-md-8 col-sm-6">
											<c:forEach items="${perms }" var="permission">
												<button type="button" style="margin: 2px;" class="btn">${permission.name }</button>&nbsp;
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<a href="<%=path %>/admin/role/edit/${role.id}" class="btn btn-primary"><i class="icon icon-edit"></i>编辑角色</a>
										<button type="button" class="btn btn-primary" onclick='history.go(-1)'><i class="icon icon-reply"></i>返回</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="ResourceContent" style="display:none; position:absolute; outline:0">
		<ul id="permissionTree" class="ztree" style="border:1px solid gray; margin-top:0;width:200px; height:300px;  background-color:#fff; overflow: auto;" ></ul>
	</div>
	<script src="<%=path %>/static/admin/main/plugins/jqurry1.11.4/jquery.js"
		type="text/javascript" charset="utf-8"></script>
	<script
		src="<%=path %>/static/admin/main/plugins/jquery-validate/jquery-validate.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=path %>/static/admin/main/zui/js/zui.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=path %>/static/admin/main/plugins/datatable/zui.datatable.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=path %>/static/admin/main/build/js/AdminTLY.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=path %>/static/admin/main/plugins/ztree/jquery.ztree.all.min.js"
		type="text/javascript" charset="utf-8"></script>
	<script src="<%=path %>/static/admin/main/laypage-v1.3/laypage/laypage.js"
		type="text/javascript" charset="utf-8"></script>
</body>
</html>