$(document).ready(function(){
	
	loadUser();
	
});
function loadUser(){
	var _size=0;
	getSize({url:$(".path").val()+"/user/size"},function(size){
		_size=size;
	});
	var _data={
			url:$(".path").val()+"/user/list",
			curr:1,
			pageSize:12,
			count:_size
	}
	getPageData(_data,function(res){
		packageData(res,function(content){
			$("#udata").html(content);
		});
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
function packageData(res,callback){
	var content = "";
	$.each(res,function(i,user){
		content+="<tr>"+
		"<td>"+user.nickName+"</td>" +
		"<td>"+user.userName+"</td>" +
		"<td>"+user.createTime+"</td>";
		if(user.available){
			content+="<td>已启用</td>";
		}else{
			content+="<td>已停用</td>";
		}
		content+="<td><a href='"+$(".path").val()+"/user/update?id="+user.id+"' title='更新用户'><i class='icon icon-edit'></i></a>&nbsp;" +
				"<a href='javascript:void(0);'onclick='delete_user(this,\""+user.id+"\")' title='删除用户'><i class='icon icon-times'></i></a>" +
				"</td>" +
				"</tr>";
	});
	if(typeof(callback)=="function"){
		callback(content);
	}
}
function getSize(data,callback){
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
function delete_user(obj,id){
	$("#remove-user").modal({
		keyboard : false,
		show : true
	});
	$(".submitbtn").click(function(){
		$.ajax({
			type:'POST',
			url:$(".path").val()+"/user/delete",
			async:false,
			data:{id:id},
			success:function(res){
				loadUser();
				$(".closebtn").click();
			}
		});
	});

}
