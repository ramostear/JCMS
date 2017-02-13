$(document).ready(function(){
	var info = $("#subBtn").text();
	if(info=="修改用户"){
		$("#userName").attr("readOnly",true);
		var _roleIds = $(".roleIds").val();
		var roleIdArray = _roleIds.split(",");
		var _depId = $(".depId").val();
		for(var i=0,l=roleIdArray.length;i<l;i++){
			var roleid = roleIdArray[i];
			if($("input:checkbox[name=roleId] :contains("+roleid+")")){
				$("input:checkbox[value="+roleid+"]").attr("checked",true);
			}
		}
		$("select[name=depId]").val(_depId);
	}
	
	$("#subBtn").click(function(){
		if(info=="修改用户"){
			var nickName = $("#nickName").val();
			var available = $("input[name=available]:checked").val();
			var depId = $("select[name=depId]").val();
			var roleIds = "";
			var roles = $("input[name=roleId]:checked").each(function(){
				var id = $(this).val();
				roleIds+=id+",";
			});
			if(roleIds.length>0){
				roleIds = roleIds.substring(0,roleIds.length-1);
			}
			var id = $(".uid").val();
			if(nickName==""||depId==""||roleIds.length<=0){
				return;
			}else{
				$.ajax({
					type:'POST',
					url:$(".path").val()+"/user/update",
					data:{
						id:id,
						nickName:nickName,
						available:available,
						depId:depId,
						roleIds:roleIds
					},
					success:function(result){
						result = $.parseJSON(result);
						new $.zui.Messager(result.msg, {
							type : 'success',
							placement : 'center'
						}).show();
						setTimeout(function() {
							window.location = $(".path").val() + "/user/";
						}, 1000);
					}
				})
			}
			
		}
		if(info=="添加用户"){
			var userName = $("#userName").val();
			var nickName = $("#nickName").val();
			var available = $("input[name=available]:checked").val();
			var depId = $("select[name=depId]").val();
			var roleIds = "";
			var roles = $("input[name=roleId]:checked").each(function(){
				var id = $(this).val();
				roleIds+=id+",";
			});
			if(roleIds.length>0){
				roleIds = roleIds.substring(0,roleIds.length-1);
			}
			if(userName==""||nickName==""||depId==""||roleIds.length<=0){
				return;
			}else{
				$.ajax({
					type:"POST",
					url:$(".path").val()+"/user/create",
					async:false,
					data:{
						userName:userName,
						nickName:nickName,
						depId:depId,
						roleIds:roleIds,
						available:available
					},
					success:function(result){
						result = $.parseJSON(result);
						new $.zui.Messager(result.msg, {
							type : 'success',
							placement : 'center'
						}).show();
						setTimeout(function() {
							window.location = $(".path").val() + "/user/";
						}, 1000);
					}
				});
			}
		}
	});
});