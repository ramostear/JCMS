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
		<title>JCMS | 管理员控制台</title>
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
		<!-- 顶部导航栏 -->
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
					<a class="navbar-brand" id="brand" href="index.html"><img src="<%=path %>/static/admin/main/img/Logo_white.png"/></a>
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
										<img class="img-circle pull-left" src="<%=path %>/static/admin/main/img/test-big/test_xiaoercun.jpg" width="40px" height="40px" />
										<b>保洁大妈<span>14:20</span></b>
										<p class="small">麻烦你下次尿道池子里asdadsa</p>
									</a>
								</li>
								<li class="message" style="border-bottom: 1px solid #f1f1f1;">
									<a href="#">
										<img class="img-circle pull-left" src="<%=path %>/static/admin/main/img/test-big/test_xiaoercun.jpg" width="40px" height="40px" />
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

		<!-- 网页内容开始 -->
		<div id="center-content">

			<!-- 左侧菜单栏 -->
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
						<c:forEach var="menu" items="${menus}">
							<li>
							<a class="link">
								<i class="icon icon-dashboard" style="margin-top: -3px;"></i>
								<span class="ul-header">${menu.name}</span>
								<i class="icon icon-chevron-left" style="margin-top: -2px;"></i>
							</a>
							<c:if test="${!empty menu.subMenu }">
								<ul class="submenu">
									<c:forEach var="subMenu" items="${menu.subMenu }">
										<li><a href="<%=path %>${subMenu.url }"><span class="icon icon-circle-blank">&nbsp;&nbsp;${subMenu.name }</span></a></li>
									</c:forEach>
								</ul>
							</c:if>
						</li>
						</c:forEach>
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
			<!-- 左侧菜单栏结束 -->

			<!-- 右侧内容 -->
			<div class="main-right">

				<!-- 快捷导航栏
				<div class="quick-nav">
					暂时不使用
				</div>
				快捷导航栏结束 -->

				<!-- 引入页面 -->
				<div class="auto-height main-content" id="pull-html" style="overflow-y: auto;">
					<div style="padding-top: 15px; padding-bottom: 15px;">
						<h1 style="display: inline;">管理员控制台</h1>
						<h4 style="display: inline; color: #808080; margin-right: 15px;" class="pull-right">
							<a href="#">主页</a>
							/
							管理员控制台
						</h4>
					</div>
					<div class="col-xs-12">
						<div class="panel" style="border-top-color: darkgrey;" id="top-panel">
							<div class="my-panel-head">
								<span>XXXXX</span>
								<a href="#" class="pull-right" data-panel-hide="#top-panel"><i class="icon icon-times"></i></i></a>
								<a href="#" class="pull-right" data-panel-toggle="#top-panel-body"><i class="icon icon-minus"></i></a>
							</div>
							<div class="panel-body" id="top-panel-body">
								<!-- 导入柱状图 -->
								<div class="col-lg-8" style="height: 300px;" id="enrollSimpleBar"></div>
								<!-- 工作进度 -->
								<div class="col-lg-4">
									<h4 style="text-align: center;">最新消息</h4>
								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="panel" id="review-situation">
							<div class="my-panel-head">
								<span style=" color: dimgrey;">审核情况</span>
								<a href="#" class="pull-right" data-panel-hide="#review-situation"><i class="icon icon-times"></i></i></a>
								<a href="#" class="pull-right" data-panel-toggle="#enrollReviewPie"><i class="icon icon-minus"></i></a>
							</div>
							<!-- 导入饼状图 -->
							<div class="panel-body" style="width: 100%; height: 300px;" id="enrollReviewPie"></div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="panel" id="simple-table" style="border-top-color: green;">
							<div class="my-panel-head">
								<span style=" color: dimgrey;">生源信息</span>
								<a href="#" class="pull-right" data-panel-hide="#simple-table"><i class="icon icon-times"></i></i></a>
								<a href="#" class="pull-right" data-panel-toggle="#simple-table-body"><i class="icon icon-minus"></i></a>
							</div>
							<!-- 表格简报 -->
							<div class="panel-body" id="simple-table-body">
								<!-- 搜索 -->
								<div class="input-group col-lg-2 pull-right">
									<input type="text" class="form-control" id="search"/>
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" onclick="search()"><i class="icon icon-search"></i></button>
									</span>
								</div><!-- 搜索结束 -->
								<table class="table table-hover">
									<tbody>
										<tr style="border-bottom: 2px solid grey;">
											<th>姓名</th>
											<th>性别</th>
											<th>民族</th>
											<th>生日</th>
											<th>年龄</th>
											<th>状态</th>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-danger">未通过</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-success">已通过</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-default">待定</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-warning">未通过</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-info">未审核</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-danger">未通过</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-success">已通过</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-default">待定</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-warning">未通过</i></td>
										</tr>
										<tr>
											<td><a href="#">王大锤</a></td>
											<td>不明</td>
											<td>锤子族</th>
											<td>2012-03-06</th>
											<td>3</td>
											<td><i class="label label-info">未审核</i></td>
										</tr>
									</tbody>
								</table>
								<ul class="pager pull-right">
									<li class="previous disabled">
										<a href="#">«上一页</a>
									</li>
									<li class="previous active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li class="next">
										<a href="#">下一页»</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div><!-- 主要内容结束 -->
			</div>
			<!-- 右侧内容结束 -->
		</div>
		<!-- 网页内容结束 -->

		<!-- jQuery1.11.4 -->
		<script src="<%=path %>/static/admin/main/plugins/jqurry1.11.4/jquery.js" type="text/javascript" charset="utf-8"></script>
		<!-- zui -->
		<script src="<%=path %>/static/admin/main/zui/js/zui.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- echars.js 3.0 -->
		<script src="<%=path %>/static/admin/main/plugins/Echars3.0/echarts.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- 样式控制js -->
		<script src="<%=path %>/static/admin/main/build/js/AdminTLY.js" type="text/javascript" charset="utf-8"></script>
		<!-- 导入图表信息js -->
		<script src="<%=path %>/static/admin/main/build/js/Echars-TLY.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>
