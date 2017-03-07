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
						<span class="user-name">黄大蒜<a href="#"><i class="label label-success">在线</i></a></span>
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
						<h1 style="display: inline;">角色管理</h1>
						<h4 style="display: inline; color: #808080; margin-right: 15px;" class="pull-right">
							<a href="#">主页</a>
							/
							角色管理
						</h4>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="panel" style="border-top-color: #38b03f;">
							<div class="my-panel-head">
								<span>角色详细信息列表</span>
								<a href="#" class="pull-right" data-panel-toggle="#people-panel-body"><i class="icon icon-minus"></i></a>
							</div>
							<div class="panel-body table-responsive" id="people-panel-body">
								<div class="button-box" style="margin-bottom: 5px;">
									<a class="btn btn-primary" type="button" href="<%=path %>/admin/role/create" target="_self">
									 	<i class="icon icon-plus"></i>&nbsp;${op}
									</a>
									<a class="btn btn-danger" type="button">
										<i class="icon icon-trash"></i>&nbsp;删除
									</a>
								</div><!-- 按钮容器结束-->
								<table class="table datatable table-hover table-condensed" id="permission">
									<thead>
										<tr>
											<th data-type="string">角色名称</th>
											<th data-type="string">描述信息</th>
											<th data-type="string">创建者</th>
											<th data-type="string">创建时间</th>
											<th data-type="string">操作</th>
										</tr>
									</thead>
									<tbody id="perdata">
										<c:forEach items="${list }" var="role">
											<tr>
												<td>${role.roleName }</td>
												<td>${role.description }</td>
												<td>${role.creator }</td>
												<td>${role.createTime }</td>
												<td>
													<a href="<%=path %>/admin/role/edit/${role.id}">编辑</a>
													<a href="<%=path %>/admin/role/${role.id}">查看</a>
													<a href='javascript:void(0);' onclick="deleteRole(${role.id})">删除</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div id="page" style="margin-top:5px;text-align: right;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="add-resource">
				<div class="modal-dialog">
			  		<div class="modal-content">
					    <div class="modal-header">
					      	<button type="button" class="close" data-dismiss="modal">
					      		<span aria-hidden="true">×</span><span class="sr-only">关闭</span>
					      	</button>
					      	<h4 class="modal-title"><i class="icon icon-sitemap"></i>&nbsp;添加新资源</h4>
					    </div>
					    <form action="" id="add-resource-form" method="get" style="text-align: center;">
						    <div class="modal-body">
					    		<b>名称:</b><input type="text" name="name" style="width: 200px; margin-left: 15px;" /><br /><br />
					    		<b>图标:</b><input type="text" name="icon" style="width: 200px; margin-left: 15px;" /><br /><br />
					    		<b>URL:</b><input type="text" name="url" style="width: 200px; margin-left: 15px;" /><br /><br />
					    		<b>类型:</b><select  name="resourceType" style="width: 200px; margin-left: 15px;">
					    				  		<option value="menu">菜单</option>
					    				  		<option value="button">按钮</option>
					    				  		<option value="link">链接</option>
					    				   </select>
					    				<br />
					    		<br />
					    		<b>权限:</b><input type="text" name="permission" style="width: 200px; margin-left: 15px;" /><br /><br />
						    </div>
						    <div class="modal-footer">
						      	<button type="button" class="btn btn-default btn-resource-close" data-dismiss="modal">取消</button>
						      	<button type="button" class="btn btn-primary btn-resource-add">确认</button>
						    </div>
					    </form>
			  		</div>
				</div>
			</div><!-- 添加部门对话框结束 -->
			<div class="modal fade" id="update-resource">
				<div class="modal-dialog">
			  		<div class="modal-content">
					    <div class="modal-header">
					      	<button type="button" class="close" data-dismiss="modal">
					      		<span aria-hidden="true">×</span><span class="sr-only">关闭</span>
					      	</button>
					      	<h4 class="modal-title"><i class="icon icon-sitemap"></i>&nbsp;更新资源</h4>
					    </div>
					    <form action="" id="update-resource-form" method="get" style="text-align: center;">
						    <div class="modal-body">
					    		<b>名称:</b><input type="text" name="name" style="width: 200px; margin-left: 15px;" /><br /><br />
					    		<b>图标:</b><input type="text" name="icon" style="width: 200px; margin-left: 15px;" /><br /><br />
					    		<b>URL:</b><input type="text" name="url" style="width: 200px; margin-left: 15px;" /><br /><br />
					    		<b>类型:</b><select  name="resourceType" style="width: 200px; margin-left: 15px;">
					    				  		<option value="menu">菜单</option>
					    				  		<option value="button">按钮</option>
					    				  		<option value="link">链接</option>
					    				   </select>
					    				<br />
					    		<br />
					    		<b>权限:</b><input type="text" name="permission" style="width: 200px; margin-left: 15px;" /><br /><br />
						    </div>
						    <div class="modal-footer">
						      	<button type="button" class="btn btn-default btn-resource-close" data-dismiss="modal">取消</button>
						      	<button type="button" class="btn btn-primary btn-resource-update">确认</button>
						    </div>
					    </form>
			  		</div>
				</div>
			</div>
			<div class="modal fade" id="add-teache">
				<div class="modal-dialog modal-lg">
			  		<div class="modal-content">
					    <div class="modal-header">
					      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
					      	<h4 class="modal-title"><i class="icon icon-group"></i>&nbsp;添加菜单</h4>
					    </div>
					    <div class="modal-body">
							<div class="input-group col-lg-3 col-md-3 col-sm-4 pull-right" style="margin-bottom: 15px;">
								<input type="text" class="form-control" id="search"/>
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="search()"><i class="icon icon-search"></i></button>
								</span>
							</div>
					      	<div class="table datatable" id="org-t-all"></div>
					    </div>
					    <div class="modal-footer">
					      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					      	<button type="button" class="btn btn-primary">保存</button>
					    </div>
			  		</div>
				</div>
			</div>
			<div class="modal fade modal-danger" id="remove-teacher">
				<div class="modal-dialog">
			  		<div class="modal-content">
					    <div class="modal-header">
					      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
					      	<h4 class="modal-title">警告</h4>
					    </div>
					    <div class="modal-body">
					    	<p>是否确认从XXX部门移除已选中的教师？</p>
					    </div>
					    <div class="modal-footer">
					      	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					      	<button type="button" class="btn btn-danger">确认</button>
					    </div>
			  		</div>
				</div>
			</div><!-- 移除教师对话框结束 -->
			<div class="modal fade modal-warning" id="modal-org">
				<div class="modal-dialog">
			  		<div class="modal-content">
					    <div class="modal-header">
					      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">关闭</span></button>
					      	<h4 class="modal-title">警告</h4>
					    </div>
					    <div class="modal-body" id="del_msg">
					    	<p>确认删除该角色吗？该操作不可逆！</p>
					    </div>
					    <div class="modal-footer">
					      	<button type="button" class="btn btn-default delroleBtn" data-dismiss="modal">取消</button>
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
		<script src="<%=path %>/static/admin/main/default/org.jcms.role.js"type="text/javascript"></script>
	</body>
</html>