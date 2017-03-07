<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<ul id="side-menu" class="side-menu">
						<c:forEach var="menu" items="${menus}">
							<li>
							<a class="link">
								<i class="${menu.icon}" style="margin-top: -3px;"></i>
								<span class="ul-header">${menu.name}</span>
								<i class="icon icon-chevron-left" style="margin-top: -2px;"></i>
							</a>
							<c:if test="${!empty menu.subMenu }">
								<ul class="submenu">
									<c:forEach var="subMenu" items="${menu.subMenu }">
										<li><a href="<%=path %>${subMenu.url }"><span class="${subMenu.icon }">&nbsp;&nbsp;${subMenu.name }</span></a></li>
									</c:forEach>
								</ul>
							</c:if>
						</li>
						</c:forEach>
					</ul>