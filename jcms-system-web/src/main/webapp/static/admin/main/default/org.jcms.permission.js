var update_resource;
var delete_resource;
$(document).ready(function(){
	loadResources();
	reloadChildren("0");
	function loadResources(){
		var setting = {
				async:{
					autoParam:["id","name","parentId"],
					contentType:'application/json;charset=utf-8',
					enable:true,
					type:'GET',
					url:$(".path").val()+"/admin/permission/treeNode"
				},
				callback:{
					onClick:zTreeOnClick,
					onAsyncSuccess:function(){
						permissionTree.expandAll(true);
					}
				},
				data:{
					simpleData:{
						enable:true,
						idKey:"id",
						pIdKey:"parentId",
						rootPid:0
					}
				}
		};
		var permissionTree = $.fn.zTree.init($("#permission-tree"),setting,[]);
	}
	
	function zTreeOnClick(event,treeId,treeNode){
		var parentId = treeNode.id;
		var size ;
		getPermissionSize(parentId,function(res){
			size = res.size;
		});
		var datas={
				url:$(".path").val()+"/admin/permission/subList",
				curr:1,
				pageSize:10,
				count:size,
				parentId:parentId
		}
		getPageData(datas,function(res){
			PackageData(res,function(content){
				$("#perdata").html(content);
			});
		});
		
	}
	function reloadChildren(id){
		var parentId = id;
		var size ;
		getPermissionSize(parentId,function(res){
			size = res.size;
		});
		var datas={
				url:$(".path").val()+"/admin/permission/subList",
				curr:1,
				pageSize:10,
				count:size,
				parentId:parentId
		}
		getPageData(datas,function(res){
			PackageData(res,function(content){
				$("#perdata").html(content);
			});
		});
	}

	$(".btn-resource-add").click(function(){
		var treeObj = $.fn.zTree.getZTreeObj("permission-tree");
		var nodes = treeObj.getSelectedNodes();
		var params = {};
		params.parentId = "0";
		if(nodes.length>0){
			params.parentId = nodes[0].id;
		}
		params.name = $("#add-resource-form input[name=name]").val();
		params.icon = $("#add-resource-form input[name=icon]").val();
		params.url = $("#add-resource-form input[name=url]").val();
		params.permission = $("#add-resource-form input[name=permission]").val();
		params.type = $("#add-resource-form select[name=resourceType]").val();
		if(params.name==""||params.icon==""||params.url==""||params.permission==""){
			return;
		}else{
			var datas={
					url:$(".path").val()+"/admin/permission/create",
					data:params
			};
			createResource(datas,function(res){
				if(res.status=="success"){
					loadResources();
					reloadChildren(params.parentId);
					$("#add-resource-form")[0].reset();
					$(".btn-resource-close").click();
				}
			});
		}
	});
	
	function createResource(datas,callback){
		$.ajax({
			type:"POST",
			url:datas.url,
			async:false,
			data:datas.data,
			success:function(result){
				result = $.parseJSON(result);
				if(typeof(callback)=="function"){
					callback(result);
				}
			}
		});
	}
	function updatePermission(datas,callback){
		$.ajax({
			type:"POST",
			url:datas.url,
			async:false,
			data:datas.data,
			success:function(result){
				result = $.parseJSON(result);
				if(typeof(callback)=="function"){
					callback(result);
				}
			}
		});
	}
	function getPermissionSize(parentId,callback){
		$.ajax({
			type:'GET',
			async:false,
			url:$(".path").val()+"/admin/permission/size",
			data:{
				parentId:parentId
			},
			success:function(res){
				res = $.parseJSON(res);
				if(typeof(callback)=="function"){
					callback(res);
				}
			}
		});
	}
	function findPermission(id,callback){
		$.ajax({
			type:'GET',
			async:false,
			url:$(".path").val()+"/admin/permission/permission",
			data:{id:id},
			success:function(res){
				res = $.parseJSON(res);
				if(typeof(callback)=="function"){
					callback(res.parentId);
				}
			}
		})
	}
	function getPageData(datas,callback){
    	$.ajax({
    		type : 'GET',
    		async : false,// 异步锁定
    		url :datas.url,
    		data : {
    			parentId:datas.parentId,
    			page : datas.curr,
    			pageSize : datas.pageSize
    		},
    		success : function(data) {
    			var count = datas.count;
    			var pageCount = Math.ceil(count / datas.pageSize);
    			laypage({
    				cont : $("#page"),
    				pages : pageCount,
    				curr : datas.curr || 1,
    				first : '首页',
    				last : '尾页',
    				prev : '上一页',
    				next : '下一页',
    				skip : true,
    				skin:'#039BE5',
    				groups : 3,
    				jump : function(obj, first) {
    					if (!first) {
    						getPageData({parentId:datas.parentId,curr:obj.curr,pageSize:datas.pageSize,count:datas.count,url:datas.url},callback);
    					}
    				}
    			});
    			callback(data);
    		}
    	});
    } 
	
	function PackageData(res,callback) {
		res = $.parseJSON(res);
    	var content = "";
    	$.each(res, function(i, resource) {
    		content += "<tr>" +
    				"<td>"+resource.name+"</td>" +
    				"<td>"+resource.icon+"</td>" +
    				"<td>"+resource.url+"</td>"+
    				"<td>"+resource.permission+"</td>"+
    				"<td>"+resource.type+"</td>"+
    			    "<td>" +
    			    "<a href='javascript:void(0);' class='update_resource' onclick='update_resource(this,\""+resource.id+"\")' title='修改'><i class='icon icon-edit'></i></a>&nbsp;" +
    				"<a href='javascript:void(0);' onclick='delete_resource(this,\""+resource.id+"\")' title='删除'><i class='icon icon-times'></i></a>&nbsp;" +
    				"</td></tr>";
    				
    	});
    	callback(content);
    }
	update_resource = function(obj,id){
		var tds = $(obj).parent("td").parent("tr").find("td");
		var _name = $(tds[0]).text();
		var _icon = $(tds[1]).html();
		var _url = $(tds[2]).text();
		var _permission = $(tds[3]).text();
		var _resourceType = $(tds[4]).text();
		$("#update-resource").modal({
			 keyboard : false,
			 show     : true
		});
		$("#update-resource-form input[name=name]").val(_name);
		$("#update-resource-form input[name=icon]").val(_icon);
		$("#update-resource-form input[name=url]").val(_url);
		$("#update-resource-form input[name=permission]").val(_permission);
		$("#update-resource-form select[name=resourceType]").val(_resourceType);
		$(".btn-resource-update").click(function(){
			var params = {};
			params.id = id;
			params.name = $("#update-resource-form input[name=name]").val();
			params.icon = $("#update-resource-form input[name=icon]").val();
			params.url = $("#update-resource-form input[name=url]").val();
			params.permission = $("#update-resource-form input[name=permission]").val();
			params.type = $("#update-resource-form select[name=resourceType]").val();
			if(params.name==""||params.icon==""||params.url==""||params.permission==""){
				return;
			}else{
				var datas={
						url:$(".path").val()+"/admin/permission/update",
						data:params
				};
				updatePermission(datas,function(res){
					if(res.status=="success"){
						loadResources();
						findPermission(id,function(res){
							params.parentId = res;
						});
						reloadChildren(params.parentId);
						$("#update-resource-form")[0].reset();
						$(".btn-resource-close").click();
					}
				});
			}
		});
		
	}
	delete_resource = function(obj,id){
		var parentId = "0";
		findPermission(id,function(result){
			parentId = result;
		});
		var size = 0;
		getPermissionSize(id,function(res){
			size = res.size;
		});
		if(size>0){
			new $.zui.Messager("该资源暂不能删除",{
				type:'danger',
				placement:'center'
			}).show();
		}else{
			$.ajax({
				type:'POST',
				url:$(".path").val()+"/admin/permission/delete",
				async:false,
				data:{
					id:id
				},
				success:function(res){
					res = $.parseJSON(res);
					if(res.status=="success"){
						new $.zui.Messager(res.msg,{
							type:'success',
							placement:'center'
						}).show();
						var treeObj = $.fn.zTree.getZTreeObj("permission-tree");
						var nodes = treeObj.getSelectedNodes();
						if(nodes.length>0){
							parentId = nodes[0].id;
						}
						loadResources();
						reloadChildren(parentId);
						if(nodes.length>0){
							treeObj.selectNode(nodes[0]);
						}
					}else{
						new $.zui.Messager(res.msg,{
							type:'danger',
							placement:'center'
						}).show();
					}
				}
			});
		}
	}
});