<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<header>
			<nav class="navbar navbar-inverse" id="navbar" role="navigation">
				<div class="navbar-header">
					<!-- 移动设备上的导航切换按钮 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-example">
						<span class="sr-only">切换导航</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- 品牌名称或logo -->
					<a class="navbar-brand" id="brand" href="index.html">
					<img src="<%=path %>/static/admin/main/img/Logo_white.png"/></a>
				</div>
				<div class="collapse navbar-collapse navbar-collapse-example">
					<!-- 一般导航项目 -->
					<ul class="nav navbar-nav">
						<li><a href="#">控制台</a></li>
						<li class="dropdown">
							<a href="index.html" class="dropdown-toggle" data-toggle="dropdown">产品及服务 <b class="caret"></b></a>
							<ul class="dropdown-menu dropdown-menu-big" role="menu" aria-labelledby="dropdownMenu1">
								<ul style="margin-right: -50px;">
									<ul class="col-xs-2">
										<li class="header">校园OA</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li class="divider"></li>
										<li class="header">学生管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">教务管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li class="divider"></li>
										<li class="header">XX管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">后勤系统</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li class="divider"></li>
										<li class="header">视频监控</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">系统管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li class="divider"></li>
										<li class="header">排课选课</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">CMS校园门户</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li class="divider"></li>
										<li class="header">智慧校园</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">测试用例</li>
										<li><a href="#"><i class="icon icon-cubes"></i>测试用例01</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>测试用例02</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>测试用例03</a></li>
										<li class="divider"></li>
										<li class="header">数据分析</li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>下拉菜单项</a></li>
									</ul>
								</ul>
							</ul>
						</li>
					</ul>
					<!-- 头部导航右侧项目 -->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="icon-envelope-alt dropdown-toggle" data-toggle="dropdown">&nbsp;4</a>
							<ul class="dropdown-menu message-menu" role="menu">
								<p class="message-num">你有4条未读信息</p>
								<li class="message">
									<a href="#">
										<img class="img-circle pull-left" src="<%=path %>/static/img/test-big/test_xiaoercun.jpg" width="40px" height="40px" />
										<b>保洁大妈<span>14:20</span></b>
										<p class="small">麻烦你下次尿道池子里asdadsa</p>
									</a>
								</li>
								<li class="message" style="border-bottom: 1px solid #f1f1f1;">
									<a href="#">
										<img class="img-circle pull-left" src="<%=path %>/static/img/test-big/test_xiaoercun.jpg" width="40px" height="40px" />
										<b>保洁大妈<span>14:20</span></b>
										<p class="small">麻烦你下次尿道池子里asdadsa</p>
									</a>
								</li>
								<h6 class="text-center"><a href="#">查看所有信息</a></h6>
							</ul>
						</li>
						<li><a href="your/nice/url">帮助与文档</a></li>
						<li class="dropdown">
							<a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown">Himiko&nbsp;<b class="caret"></b></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="your/nice/url"><i class="icon icon-user"></i>&nbsp;&nbsp;基本信息</a></li>
								<li><a href="your/nice/url"><i class="icon icon-lock"></i>&nbsp;&nbsp;修改密码</a></li>
								<li class="divider"></li>
								<li><a href="your/nice/url"><i class="icon icon-off"></i>&nbsp;&nbsp;安全退出</a></li>
							</ul>
						</li>
					</ul>
					<!-- 头部导航右侧结束 -->
				</div>
			</nav>
		</header>
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
					<ul id="side-menu" class="side-menu">
						<li>
							<a class="link">
								<i class="icon icon-dashboard" style="margin-top: -3px;"></i>
								<span class="ul-header">管理员控制台</span>
								<i class="icon icon-chevron-left" style="margin-top: -2px;"></i>
							</a>
							<ul class="submenu">
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
							</ul>
						</li>
						<li>
							<a class="link">
								<i class="icon icon-sitemap" style="margin-top: -3px;"></i>
								<span class="ul-header">组织机构</span>
								<i class="icon icon-chevron-left" style="margin-top: -2px;"></i>
							</a>
							<ul class="submenu">
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
							</ul>
						</li>
						<li>
							<a class="link">
								<i class="icon icon-sitemap" style="margin-top: -3px;"></i>
								<span class="ul-header">系统设置</span>
								<i class="icon icon-chevron-left" style="margin-top: -2px;"></i>
							</a>
							<ul class="submenu">
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
							</ul>
						</li>
						<li>
							<a class="link">
								<i class="icon icon-sitemap" style="margin-top: -3px;"></i>
								<span class="ul-header">人员管理</span>
								<i class="icon icon-chevron-left" style="margin-top: -2px;"></i>
							</a>
							<ul class="submenu">
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
								<li><a href="#"><span class="icon icon-circle-blank">&nbsp;&nbsp;管理员控制台-01</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!-- 右侧内容 -->
			<div class="main-right">
				<div class="quick-nav">
				</div>
				<div class="auto-height main-content" id="pull-html" style="overflow-y:auto;">
					<div style="padding-top: 15px; padding-bottom: 15px;">
						<h1 style="display: inline;">权限配置中心</h1>
						<h4 style="display: inline; color: #808080; margin-right: 15px;" class="pull-right">
							<a href="#">主页</a>
							/
							系统配置
						</h4>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3" style="min-width: 200px;">
						<div class="panel panel-yellow">
							<div class="my-panel-head">
								<span id="menuInfo" class="label label-primary" style="color:#fff"></span>
								<span>系统资源</span>
								<a href="#" class="pull-right" data-panel-toggle="#org-panel-body"><i class="icon icon-minus"></i></a>
							</div>
							<div class="panel-body" id="org-panel-body" style="height:610px;overflow-y:auto">
								<ul id="permission-tree" class="ztree" style="width: 100%; min-width: 200px;"></ul>
							</div>
						</div>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9">
						<div class="panel" style="border-top-color: #38b03f;">
							<div class="my-panel-head">
								<span>资源详细信息</span>
								<a href="#" class="pull-right" data-panel-toggle="#people-panel-body"><i class="icon icon-minus"></i></a>
							</div>
							<div class="panel-body table-responsive" id="people-panel-body">
								<div class="button-box">
									<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#add-resource">
										<i class="icon icon-plus"></i>&nbsp;添加资源
									</button>
									<button class="btn btn-danger" type="button" data-toggle="modal" data-target="#remove-teacher">
										<i class="icon icon-trash"></i>&nbsp;删除
									</button>
								</div><!-- 按钮容器结束-->
								<table class="table datatable table-hover table-condensed" id="permission">
									<thead>
										<tr>
											<th data-type="string">名称</th>
											<th data-type="string">图标</th>
											<th data-type="string">URL</th>
											<th data-type="string">权限</th>
											<th data-type="string">类型</th>
											<th data-type="string">操作</th>
										</tr>
									</thead>
									<tbody id="perdata">
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
					    	<p>是否删除XXX部门？</p>
					    </div>
					    <div class="modal-footer">
					      	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
		<script src="<%=path %>/static/admin/main/default/org.jcms.permission.js"type="text/javascript"></script>
	</body>
</html>