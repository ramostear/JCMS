$(document).ready(function(){
	loadManager();
});

var managerFun = {};

function loadManager (){
	var _size = 0;
	managerFun.getSize({url:$(".path").val()+"/admin/manager/size"},function(size){
		_size = size;
	});
	var _data={
			url:$(".path").val()+"/admin/manager/list",
			curr:1,
			pageSize:10,
			count:_size
	}
	managerFun.getPageData(_data,function(res){
		managerFun.packageData(res,function(content){
			$("#mdata").html(content);
		});
	});
}
managerFun.getPageData = function(datas,callback){
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
			var pageCount = Math.ceil(count/ datas.pageSize);
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
						managerFun.getPageData({
							curr : obj.curr,
							pageSize : datas.pageSize,
							count : datas.count,
							url : datas.url
						}, callback);
					}
				}
			});
			if(typeof(callback)=="function"){
				callback(res);
			}
		}
	});
}
managerFun.packageData = function(res,callback){
	var content = "";
	$.each(res,function(i,manager){
		content	+="<tr>" +
				"<td>"+manager.userName+"</td>" +
				"<td>"+manager.nickName+"</td>" +
				"<td>"+manager.creator+"</td>" +
				"<td>"+manager.createTime+"</td>" +
				"<td>" +
					"<a href='"+$(".path").val()+"/admin/manager/edit/"+manager.id+"'>编辑 </a> &nbsp;" +
					"<a href='"+$(".path").val()+"/admin/manager/"+manager.id+"'>查看</a>  &nbsp;" +
					"<a href='javascript:void(0);' onclick='deleteManager("+manager.id+")'>删除</a>" +
				"</td>" +
			"</tr>";
	});
	if(typeof(callback)=="function"){
		callback(content);
	}
}
managerFun.getSize = function(data,callback){
	$.ajax({
		type:'GET',
		url:data.url,
		async:false,
		success:function(result){
			result = $.parseJSON(result);
			if(typeof(callback)=="function"){
				callback(result.size);
			}
		}
	});
}
function deleteManager(id){
	$("#modal-org").modal({
		keyboard : false,
		show : true
	});
	$("#del_ok").click(function(){
		$.ajax({
			type : 'POST',
			url : $(".path").val() + "/admin/manager/delete/"+id,
			async : false,
			success : function(res) {
				$(".delBtn").click();
				  window.location.reload();
			}
		});
	})
}
