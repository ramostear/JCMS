$(document).ready(function() {
	var info = $("#subBtn").text();
	if (info == "创建角色") {
		loadResourceTree();
	} else if (info == "编辑角色") {
		loadResourceTrees($("#roleId").val());
	}
});
function loadResourceTree() {
	var setting = {
		async : {
			autoParam : [ "id", "name", "parentId", "checked" ],
			contentType : 'application/json;charset=utf-8',
			enable : true,
			type : 'GET',
			url : $(".path").val() + "/admin/role/getPermissions",
		},
		callback : {
			onAsyncSuccess : function() {
				resourceTree.expandAll(true);
			},
			beforeClick : beforeClick,
			onCheck : onCheck
		},
		check : {
			chkboxType : {
				"Y" : "p",
				"N" : "s"
			},
			chkStyle : "checkbox",
			enable : true,
		},
		view : {
			dblClickExpand : false
		},
		data : {
			/*
			 * key:{ checked:"checked", },
			 */
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "parentId"
			}
		}
	};
	var resourceTree = $.fn.zTree.init($("#permissionTree"), setting, []);
}
function loadResourceTrees(id) {
	var setting = {
		async : {
			autoParam : [ "id", "name", "parentId", "checked" ],
			contentType : 'application/json;charset=utf-8',
			enable : true,
			type : 'GET',
			url : $(".path").val() + "/admin/role/getRolePermissionTree",
			otherParam : {
				id : id
			}
		},
		callback : {
			onAsyncSuccess : function() {
				resourceTree.expandAll(true);
			},
			beforeClick : beforeClick,
			onCheck : onCheck
		},
		check : {
			chkboxType : {
				"Y" : "p",
				"N" : "s"
			},
			chkStyle : "checkbox",
			enable : true,
		},
		view : {
			dblClickExpand : false
		},
		data : {
			key : {
				checked : "checked",
			},
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "parentId"
			}
		}
	};
	var resourceTree = $.fn.zTree.init($("#permissionTree"), setting, []);
}
function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("permissionTree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}
function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("permissionTree");
	nodes = zTree.getCheckedNodes(true);
	v = "";
	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].id + ",";
	}
	if (v.length > 0) {
		v = v.substring(0, v.length - 1);
	}
	var resObj = $("#resourceId");
	resObj.val(v);
}
function showResource() {
	var resObj = $("#resourceId");
	var resOffset = $("#resourceId").offset();
	$("#ResourceContent").css({
		left : resOffset.left + 5 + "px",
		top : resOffset.top + resObj.outerHeight() + "px"
	}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
	var zTree = $.fn.zTree.getZTreeObj("permissionTree");
	nodes = zTree.getCheckedNodes(true);
	v = "";
	for (var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].id + ",";
	}
	if (v.length > 0) {
		v = v.substring(0, v.length - 1);
	}
	var resObj = $("#resourceId");
	resObj.val(v);
}
function hideResource() {
	$("#ResourceContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "resourceId" || event.target.id == "resourceBtn"
			|| event.target.id == "ResourceContent" || $(event.target).parents(
			"#ResourceContent").length > 0)) {
		hideResource();
	}
}
$("#subBtn").click(function() {
	var info = $(this).text();
	if (info == "创建角色") {
		addRole(function(result) {
			new $.zui.Messager(result.msg, {
				type : 'success',
				placement : 'center'
			}).show();
			setTimeout(function() {
				window.location = $(".path").val() + "/admin/role/";
			}, 1000);
		});
	} else if (info == "编辑角色") {
		updateRole(function(result) {
			new $.zui.Messager(result.msg, {
				type : 'success',
				placement : 'center'
			}).show();
			setTimeout(function() {
				window.location = $(".path").val() + "/admin/role/";
			}, 1000);
		});
	}
});

function addRole(callback) {
	var role = {};
	role.roleName = $("#role").val();
	role.description = $("#description").val();
	role.perm = $("#resourceId").val();
	if (role.roleName == "" || role.description == "" || role.perm == "") {
		new $.zui.Messager("提交的数据不完整!", {
			type : 'danger',
			placement : 'center'
		}).show();
		return;
	} else {
		$.ajax({
			type : 'POST',
			url : $(".path").val() + "/admin/role/create",
			async : false,
			data : {
				roleName : role.roleName,
				description : role.description,
				perm : role.perm
			},
			success : function(result) {
				result = $.parseJSON(result);
				if (typeof (callback) == "function") {
					callback(result);
				}
			}
		});
	}
}

function updateRole(callback) {
	var role = {};
	role.id = $("#roleId").val();
	role.roleName = $("#role").val();
	role.description = $("#description").val();
	role.perm = $("#resourceId").val();
	if (role.roleName == "" || role.description == "" || role.perm== "") {
		new $.zui.Messager("提交的数据不完整!", {
			type : 'danger',
			placement : 'center'
		}).show();
		return;
	} else {
		$.ajax({
			type : 'POST',
			url : $(".path").val() + "/admin/role/edit/"+role.id,
			async : false,
			data : {
				roleName : role.roleName,
				description : role.description,
				perm : role.perm
			},
			success : function(result) {
				result = $.parseJSON(result);
				if (typeof (callback) == "function") {
					callback(result);
				}
			}
		});
	}
}
