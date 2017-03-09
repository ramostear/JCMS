$(document).ready(function() {
	var info = $("#subBtn").text();
	if (info == "编辑管理员") {
		$("input[id=userName]").attr("readOnly",true);
		var roleIds = $(".roleIds").val();
		managerFun.setManagerRoles({roleIds:roleIds});
	} 
});
var managerFun = {};
managerFun.createManager = function(datas,callback){
	$.ajax({
		type:"POST",
		url:$(".path").val()+"/admin/manager/create",
		async:false,
		data:{
			userName:datas.userName,
			nickName:datas.nickName,
			roleIds:datas.roleIds
		},
		success:function(result){
			result = $.parseJSON(result);
			if(typeof(callback)=="function"){
				callback(result);
			}
		}
	});
}
managerFun.editManager = function(datas,callback){
	$.ajax({
		type:"POST",
		url:$(".path").val()+"/admin/manager/edit/"+$(".managerId").val(),
		async:false,
		data:{
			userName:datas.userName,
			nickName:datas.nickName,
			roleIds:datas.roleIds
		},
		success:function(result){
			result = $.parseJSON(result);
			if(typeof(callback)=="function"){
				callback(result);
			}
		}
	});
}
managerFun.setManagerRoles = function(datas,callback){
	if(datas.roleIds.length>0){
		var rlist = datas.roleIds.split(",");
		for(var i=0;i<rlist.length;i++){
			$("#roleIds option[value='"+rlist[i]+"']").attr("selected",true);
		}
	}
}
$("#subBtn").click(function(){
	var manager = {};
	manager.userName = $("input[id=userName]").val();
	manager.nickName = $("input[id=nickName]").val();
	manager.roleIds = "";
	$("#roleIds option:selected").each(function(){
		manager.roleIds += $(this).val()+",";
	})
	manager.roleIds = manager.roleIds.substr(0,manager.roleIds.length-1);
	var info = $("#subBtn").text();
	if(manager.userName==""||manager.nickName==""||manager.roleIds==""){
		return false;
	}else{
		if(info=="编辑管理员"){
			managerFun.editManager(manager,function(result){
				new $.zui.Messager(result.msg, {
					type : 'success',
					placement : 'center'
				}).show();
				setTimeout(function() {
					window.location = $(".path").val() + "/admin/manager/";
				}, 1000);
			});
		}else{
			managerFun.createManager(manager,function(result){
				new $.zui.Messager(result.msg, {
					type : 'success',
					placement : 'center'
				}).show();
				setTimeout(function() {
					window.location = $(".path").val() + "/admin/manager/";
				}, 1000);
			});
		}
	}
});
