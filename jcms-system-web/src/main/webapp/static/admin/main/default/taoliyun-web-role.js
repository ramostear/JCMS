var show_resource;
var delete_dep;
$(document)
		.ready(
				function() {
					loadRole();
					function loadRole() {
						var count = 0;
						var data1 = {
							url : $(".path").val() + "/role/getSize"
						}
						getSize(data1, function(size) {
							count = size;
						});
						var data2 = {
							curr : 1,
							count : count,
							pageSize : 15,
							url : $(".path").val() + "/role/list"
						}
						getPageData(data2, function(result) {
							PackageData(result, function(content) {
								$("#roledata").html(content);
							});
						});
					}

					function getSize(data, callback) {
						$.ajax({
							type : 'GET',
							url : data.url,
							async : false,
							success : function(result) {
								result = $.parseJSON(result);
								if (typeof (callback) == "function") {
									callback(result.size);
								}
							}
						});
					}
					function getPageData(datas, callback) {
						$.ajax({
							type : 'GET',
							async : false,// 异步锁定
							url : datas.url,
							data : {
								page : datas.curr,
								pageSize : datas.pageSize
							},
							success : function(data) {
								var count = datas.count;
								var pageCount = Math.ceil(count
										/ datas.pageSize);
								var res = $.parseJSON(data);
								laypage({
									cont : $("#page"),
									pages : pageCount,
									curr : datas.curr || 1,
									first : '首页',
									last : '尾页',
									prev : '上一页',
									next : '下一页',
									skip : true,
									skin : '#039BE5',
									groups : 3,
									jump : function(obj, first) {
										if (!first) {
											getPageData({
												curr : obj.curr,
												pageSize : datas.pageSize,
												count : datas.count,
												url : datas.url
											}, callback);
										}
									}
								});
								callback(res);
							}
						});
					}
					function PackageData(res, callback) {
						var content = "";
						$
								.each(
										res,
										function(i, role) {
											content += "<tr>"
													+ "<td>"
													+ role.role
													+ "</td>"
													+ "<td>"
													+ role.description
													+ "</td>"
													+ "<td><a href='javascript:void(0);' onclick='show_resource(this,\""
													+ role.id
													+ "\")' title='查看权限'><i class='icon icon-zoom-in'></i>点击查看</a></td>";
											content += "<td><a href='"
													+ $(".path").val()
													+ "/role/update?id="
													+ role.id
													+ "' title='修改'><i class='icon icon-edit'></i></a>&nbsp;"
													+ "<a href='javascript:void(0);' onclick='delete_dep(this,\""
													+ role.id
													+ "\")' title='删除'><i class='icon icon-times'></i></a>&nbsp;";
										});
						callback(content);
					}

					show_resource = function(obj, id) {
						$('#show-resource').modal({
							keyboard : false,
							show : true
						});
						$.ajax({
							type : 'GET',
							url : $(".path").val()
									+ "/role/view_role_resources",
							data : {
								id : id
							},
							success : function(res) {
								res = $.parseJSON(res);
								var content = "";
								$.each(res, function(i, resource) {
									content += "<tr><td>" + resource.name
											+ "</td><td>" + resource.permission
											+ "</td><td>"
											+ resource.resourceType
											+ "</td></tr>";
								});
								$("#resourceData").html(content);
							}
						});
					}
					delete_dep = function(obj, id) {
						//remove-role
						$("#remove-role").modal({
							keyboard : false,
							show : true
						});
						$(".delBtn").click(function() {
							$.ajax({
								type : 'POST',
								url : $(".path").val() + "/role/delete",
								async : false,
								data : {
									id : id
								},
								success : function(res) {
									$(".delroleBtn").click();
									/*res = $.parseJSON(res);
									new $.zui.Messager(res.msg,{
										type:'success',
										placement:'center'
									}).show();*/
									loadRole();
								}
							});
						});
					}
				});