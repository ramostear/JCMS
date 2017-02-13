/*
 * 组织机构（admin-org）页面数据展示js
 * ===========================
 */
//控制id=#org-teacher，class=datatable的div显示表格
$(document).ready(function (){
	var control =  "<a href='###'><i class='icon icon-search'></i></a> &nbsp; <a href='###' class='text-danger'><i class='icon-trash'></i></a>";
	$('#org-teacher.datatable').datatable({
		checkable: true,
		sortable: true,
		checkByClickRow: false,
	    data: {
	        cols: [
	            {text: "工号", type: "number", flex: false, colClass: "text-center"},
	            {text: "性别", type: "string", flex: false, colClass: "text-center"},
	            {text: "民族", type: "string", flex: false, colClass: "text-center"},
	            {text: "出生年月", type: "string", flex: false, colClass: "text-center"},
	            {text: "任教科目", type: "string", flex: false, colClass: "text-center"},
	            {text: "任教班级", type: "string", flex: false, colClass: "text-center"},
	            {text: "操作", type: "string", flex: false, colClass: "text-center"}
	        ],
	        rows: [
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "语文", "高三（1）班", control]},
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "数学", "高三（1）班", control]},
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "英语", "高三（1）班", control]}
	        ]
	    },
	});
});

//控制id=#teacher-all，class=datatable的div显示表格
$(document).ready(function (){
	var control =  "<a href='###'><i class='icon icon-pencil'></i></a> &nbsp; <a href='###' class='text-danger'><i class='icon-trash'></i></a>";
	$('#teacher-all.datatable').datatable({
		checkable: true,
		sortable: true,
		checkByClickRow: false,
	    data: {
	        cols: [
	            {text: "工号", type: "number", flex: false, colClass: "text-center"},
	            {text: "性别", type: "string", flex: false, colClass: "text-center"},
	            {text: "民族", type: "string", flex: false, colClass: "text-center"},
	            {text: "出生年月", type: "string", flex: false, colClass: "text-center"},
	            {text: "任教科目", type: "string", flex: false, colClass: "text-center"},
	            {text: "任教班级", type: "string", flex: false, colClass: "text-center"},
	            {text: "操作", type: "string", flex: false, colClass: "text-center"}
	        ],
	        rows: [
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "语文", "高三（1）班", control]},
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "数学", "高三（1）班", control]},
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "英语", "高三（1）班", control]}
	        ]
	    },
	});
});

//控制id=#org-t-all，class=datatable的div显示表格
$(document).ready(function loadOrgDataTable(){
	var control =  "<a href='###'><i class='icon icon-plus-sign'></i></a>";
	$('#org-t-all.datatable').datatable({
		checkable: true,
		sortable: true,
		checkByClickRow: false,
	    data: {
	        cols: [
	            {text: "工号", type: "number", flex: false, colClass: "text-center"},
	            {text: "性别", type: "string", flex: false, colClass: "text-center"},
	            {text: "民族", type: "string", flex: false, colClass: "text-center"},
	            {text: "出生年月", type: "string", flex: false, colClass: "text-center"},
	            {text: "任教科目", type: "string", flex: false, colClass: "text-center"},
	            {text: "任教班级", type: "string", flex: false, colClass: "text-center"},
	            {text: "操作", type: "string", flex: false, colClass: "text-center"}
	        ],
	        rows: [
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "语文", "高三（1）班", control]},
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "数学", "高三（1）班", control]},
	        	{checked: false, data:[1001, "男", "汉族", "1964-07-18", "英语", "高三（1）班", control]}
	        ]
	    },
	});
});

//生成组织机构的ztree
$(document).ready(function loadOrgZtree() {
	var setting = {
		edit: {
  			enable: true,
  			showRemoveBtn: true,
  			showRenameBtn: true,
  			removeTitle: "删除部门",
  			renameTitle: "修改部门名称"
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback:{
         	beforeRemove:beforeRemove,//点击删除时触发，用来提示用户是否确定删除
//          beforeEditName: beforeEditName,//点击编辑时触发，用来判断该节点是否能编辑
//          beforeRename:beforeRename,//编辑结束时触发，用来验证输入的数据是否符合要求
//          onRemove:onRemove,//删除节点后触发，用户后台操作
//          onRename:onRename,//编辑后触发，用于操作后台
//          beforeDrag:beforeDrag,//用户禁止拖动节点
//          onClick:clickNode//点击节点触发的事件
        }
	};
	
	var zNodes =[
		{ id:1, pId:0, name:"父节点 1", open:true},
		{ id:11, pId:1, name:"叶子节点 1-1"},
		{ id:12, pId:1, name:"叶子节点 1-2"},
		{ id:13, pId:1, name:"叶子节点 1-3"},
		{ id:2, pId:0, name:"父节点 2", open:true},
		{ id:21, pId:2, name:"叶子节点 2-1"},
		{ id:22, pId:2, name:"叶子节点 2-2"},
		{ id:23, pId:2, name:"叶子节点 2-3"},
		{ id:3, pId:0, name:"父节点 3", open:true},
		{ id:31, pId:3, name:"叶子节点 3-1"},
		{ id:32, pId:3, name:"叶子节点 3-2"},
		{ id:33, pId:3, name:"叶子节点 3-3"}
	];
	
	function beforeRemove() {
		var flag = false;
		
		$("#modal-org").modal();
		
		return flag;
	}
	
	$.fn.zTree.init($("#org-tree"), setting, zNodes);
});