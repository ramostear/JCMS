<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
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
						<li><a href="<%=path %>/admin/manager/main">JCMS控制台</a></li>
						<li class="dropdown">
							<a href="index.html" class="dropdown-toggle" data-toggle="dropdown">功能导航 <b class="caret"></b></a>
							<ul class="dropdown-menu dropdown-menu-big" role="menu" aria-labelledby="dropdownMenu1">
								<ul style="margin-right: -50px;">
									<ul class="col-xs-2">
										<li class="header">系统管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>权限管理</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>角色管理</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">插件管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>新增插件</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>管理插件</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">文章管理</li>
										<li><a href="#"><i class="icon icon-cubes"></i>栏目设置</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>新增文章</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">个人中心</li>
										<li><a href="#"><i class="icon icon-cubes"></i>个人信息</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>修改密码</a></li>
									</ul>
									<ul class="col-xs-2">
										<li class="header">系统备份</li>
										<li><a href="#"><i class="icon icon-cubes"></i>备份数据</a></li>
										<li><a href="#"><i class="icon icon-cubes"></i>恢复数据</a></li>
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
							<a href="your/nice/url" class="dropdown-toggle" data-toggle="dropdown">Admin&nbsp;<b class="caret"></b></a>
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