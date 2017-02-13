//生成组织机构的ztree
var delete_dep;
var toggle_depStatus;
$(document).ready(function() {
	loadDepTree();
	reloadDep("0");
	function loadDepTree(callback){
		var setting = {
				data: {
					simpleData: {
						enable: true,
						idKey:"id",
						pIdKey:"pId",
						rootPId:-1
					}
				},
				async: {
					enable: true,
					url: $(".path").val()+"/dep/dep_tree",
					type:'GET',
					autoParam: ["id", "name","pId"]
				},
				callback:{
		         	onClick:zTreeOnClick,
		         	onAsyncSuccess:function(){
		         		depTree.expandAll(true);
					},
		        }
			};
			var depTree = $.fn.zTree.init($("#org-tree"), setting);
			if(typeof(callback)=='function'){
				callback(depTree);
			}
	}
	
	function zTreeOnClick(event, treeId, treeNode){
		var depid = treeNode.id;
		var count = 0;
		var data={
				parentId:depid,
				url:$(".path").val()+"/dep/view_children_size"
		}
		getChildrenSizeByDep(data,function(c){
			count = c;
		});
		var datas = {
				parentId:depid,
				curr:1,
				count:count,
				pageSize:10,
				url:$(".path").val()+"/dep/view_children"
		}
		getPageData(datas,function(res){
			PackageData(res,function(content){
				$("#udata").html(content);
			});
		});
	}
	function reloadDep(id){
		var depid = id;
		var count = 0;
		var data={
				parentId:depid,
				url:$(".path").val()+"/dep/view_children_size"
		}
		getChildrenSizeByDep(data,function(c){
			count = c;
		});
		var datas = {
				parentId:depid,
				curr:1,
				count:count,
				pageSize:10,
				url:$(".path").val()+"/dep/view_children"
		}
		getPageData(datas,function(res){
			PackageData(res,function(content){
				$("#udata").html(content);
			});
		});
	}
	var depTreeNode =  $.fn.zTree.getZTreeObj("org-tree");
	$("#addDep").click(function(){
		var name = $(".addDep input[name=depName]").val();
		var depDesc = $(".addDep textarea[name=depDesc]").val();
		var nodes = depTreeNode.getSelectedNodes();
		var pid = "";
		if(nodes.length>0){
			pid = nodes[0].id;
		}
		var data={name:name,icon:"icon",available:true,parentId:pid};
		addDep(data,function(datas){
			if(datas.status){
				loadDepTree();
				$(".addDep")[0].reset();
				$(".closeAdd").click();
			}else{
				new $.zui.Messager(datas.msg,{
					type:'danger',
					placement:'center'
				}).show();
			}
		});
	});
	
	function addDep(data,callback){
		$.ajax({
			type:'POST',
			url:$(".path").val()+"/dep/create",
			async:false,
			data:data,
			success:function(result){
				var d = $.parseJSON(result);
				callback(d);
			}
		});
	}
	function updateDepName(data,callback){
		$.ajax({
			type:'POST',
			url:'/organization/dep/updateDepName.do',
			async:false,
			data:data,
			success:function(res){
				if(typeof(callback)=="function"){
					callback(res);
				}
			}
		})
	}
	function getChildrenSizeByDep(data,callback){
		$.ajax({
    		type:'GET',
    		url:data.url,
    		async:false,
    		data:{parentId:data.parentId},
    		success:function(datas){
    			var res = $.parseJSON(datas);
    			callback(res.size);
    		}
    	});
		
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
    				skin:'#039BE5',
    				groups : 3,
    				jump : function(obj, first) {
    					if (!first) {
    						getPageData({parentId:datas.parentId,curr:obj.curr,pageSize:datas.pageSize,count:datas.count,url:datas.url},callback);
    					}
    				}
    			});
    			callback(res);
    		}
    	});
    }
    
    function PackageData(res,callback) {
    	var content = "";
    	$.each(res, function(i, dep) {
    		content += "<tr>" +
    				"<td>"+dep.id+"</td>" +
    				"<td>"+dep.name+"</td>" +
    				"<td>"+dep.createTime+"</td>";
    		if(dep.available){
    			content+="<td><span class='label label-badge label-info'>已启用</span></td>";
    			content+="<td><a href='javascript:void(0);' onclick='update_dep(this,\""+dep.id+"\")' title='修改'><i class='icon icon-edit'></i></a>&nbsp;" +
    					"<a href='javascript:void(0);' onclick='delete_dep(this,\""+dep.id+"\")' title='删除'><i class='icon icon-times'></i></a>&nbsp;" +
    					"<a href='javascript:void(0);' onclick='toggle_depStatus(this,\""+dep.id+"\")' title='切换状态'><i class='icon icon-toggle-on'></i></a></td></tr>";
    		}else{
    			content+="<td><span class='label label-badge'>已停用</span></td>"
				content+="<td><a href='javascript:void(0);' onclick='update_dep(this,\""+dep.id+"\")' title='修改'><i class='icon icon-edit'></i></a>&nbsp;" +
				"<a href='javascript:void(0);' onclick='delete_dep(this,\""+dep.id+"\")' title='删除'><i class='icon icon-times'></i></a>&nbsp;" +
				"<a href='javascript:void(0);' onclick='toggle_depStatus(this,\""+dep.id+"\")' title='切换状态'><i class='icon icon-toggle-off'></i></a></td></tr>";
    		}
    				
    	});
    	callback(content);
    }
    $(".loadTree").click(function(){
    	var nodes = depTreeNode.getSelectedNodes();
		var pid;
		if(nodes.length>0){
			pid = nodes[0].id;
		} 
    	loadDepTree();
    	reloadDep(pid);
    });
	
	delete_dep = function(obj,id){
		alert(id);
	}
	toggle_depStatus = function(obj,id){
		var tds = $(obj).parent("td").parent("tr").find("td");
		$.ajax({
			type:'POST',
			url:$(".path").val()+"/dep/update_dep_status",
			async:false,
			data:{
				id:id
			},
			success:function(res){
				res = $.parseJSON(res);
				if($(tds[3]).text()=="已启用"){
					$(tds[3]).html("<span class='label label-badge'>已停用</span>");
					$(obj).html("<i class='icon icon-toggle-off'></i>");
				}else if($(tds[3]).text()=="已停用"){
					$(tds[3]).html("<span class='label label-badge label-info'>已启用</span>");
					$(obj).html("<i class='icon icon-toggle-on'></i>");
				}
			}
		
		});
	}
});
function update_dep(obj,id){
	var tds = $(obj).parent("td").parent("tr").find("td");
	var depId = $(tds[0]).text();
	var name = $(tds[1]).text();
	var createTime = $(tds[2]).text();
	var available = $(tds[3]).text();
	$('#update_dep').modal({
	    keyboard : false,
	    show     : true
	});
	if(depId==id){
		$(".updateDep input[name=id]").val(depId);
		$(".updateDep input[name=name]").val(name);
		$(".updateDep input[name=createTime]").val(createTime);
	}
	$(".update_dep_btn").click(function(){
		var update_name = $(".updateDep input[name=name]").val();
		if(update_name==name||update_name==""){
			$(".updateDep")[0].reset();
			$(".close_dep_update").click();
		}else{
			$.ajax({
				type:'POST',
				url:$(".path").val()+"/dep/update_dep_name",
				async:false,
				data:{
					id:id,
					name:update_name
				},
				success:function(res){
					res = $.parseJSON(res);
					if(res.status=="success"){
						new $.zui.Messager(res.msg,{
							type:'success',
							placement:'center'
						}).show();
						window.location.reload();
					}else{
						new $.zui.Messager(res.msg,{
							type:'danger',
							placement:'center'
						}).show();
						$(".updateDep")[0].reset();
						$(".close_dep_update").click();
					}
				}
			});
		}
	});
}


