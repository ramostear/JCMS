$(document).ready(function() {
	var info = $("#subBtn").text();
	if (info == "添加角色") {
		loadResourceTree();
	} else if (info == "更新角色") {
		loadResourceTrees($("#resId").val());
	}
});
function loadResourceTree() {
	var setting = {
		async : {
			autoParam : [ "id", "name", "pid", "checked" ],
			contentType : 'application/json;charset=utf-8',
			enable : true,
			type : 'GET',
			url : $(".path").val() + "/role/view_resource",
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
				pIdKey : "pid"
			}
		}
	};
	var resourceTree = $.fn.zTree.init($("#resourceTree"), setting, []);
}
function loadResourceTrees(id) {
	var setting = {
		async : {
			autoParam : [ "id", "name", "pid", "checked" ],
			contentType : 'application/json;charset=utf-8',
			enable : true,
			type : 'GET',
			url : $(".path").val() + "/role/view_role_update_resources",
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
				pIdKey : "pid"
			}
		}
	};
	var resourceTree = $.fn.zTree.init($("#resourceTree"), setting, []);
}
function beforeClick(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("resourceTree");
	zTree.checkNode(treeNode, !treeNode.checked, null, true);
	return false;
}
function onCheck(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("resourceTree");
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
	var zTree = $.fn.zTree.getZTreeObj("resourceTree");
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
	if (info == "添加角色") {
		addRole(function(result) {
			new $.zui.Messager(result.msg, {
				type : 'success',
				placement : 'center'
			}).show();
			setTimeout(function() {
				window.location = $(".path").val() + "/role/";
			}, 1000);
		});
	} else if (info == "更新角色") {
		updateRole(function(result) {
			new $.zui.Messager(result.msg, {
				type : 'success',
				placement : 'center'
			}).show();
			setTimeout(function() {
				window.location = $(".path").val() + "/role/";
			}, 1000);
		});
	}
});

function addRole(callback) {
	var role = $("#role").val();
	var description = $("#description").val();
	var resourceId = $("#resourceId").val();
	if (role == "" || description == "" || resourceId == "") {
		new $.zui.Messager("提交的数据不完整!", {
			type : 'danger',
			placement : 'center'
		}).show();
		return;
	} else {
		$.ajax({
			type : 'POST',
			url : $(".path").val() + "/role/create",
			async : false,
			data : {
				role : role,
				description : description,
				resourceIdsStr : resourceId
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
	var role = $("#role").val();
	var description = $("#description").val();
	var resourceId = $("#resourceId").val();
	if (role == "" || description == "" || resourceId == "") {
		new $.zui.Messager("提交的数据不完整!", {
			type : 'danger',
			placement : 'center'
		}).show();
		return;
	} else {
		$.ajax({
			type : 'POST',
			url : $(".path").val() + "/role/update",
			async : false,
			data : {
				id : $("#roleId").val(),
				role : role,
				description : description,
				resourceIdsStr : resourceId
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
