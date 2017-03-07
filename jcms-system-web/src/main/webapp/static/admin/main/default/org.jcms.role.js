function deleteRole(id){
	$("#modal-org").modal({
		keyboard : false,
		show : true
	});
	$("#del_ok").click(function(){
		$.ajax({
			type : 'POST',
			url : $(".path").val() + "/admin/role/delete/"+id,
			async : false,
			success : function(res) {
				$(".delroleBtn").click();
				  window.location.reload();
			}
		});
	})
}