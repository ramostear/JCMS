//================控制sidebar的js==================//
$(document).ready(function() {
	var flag = true;
    var side = function (el, multiple) {
        this.el = el || {};
        this.multiple = multiple || false;
        var links = this.el.find('.link');
        links.on('click', {
           el: this.el,
           multiple: this.multiple
        }, this.dropdown);
    };
    side.prototype.dropdown = function (e) {
    	if(flag && $("#sidebar").hasClass("sidebar-big")) {
    		flag = false;
    		var $el = e.data.el;
	        $this = $(this), $next = $this.next();
	        $next.slideToggle(300, function() {flag = true});
	        $this.parent().toggleClass('open');
	        if (!e.data.multiple) {
	            $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
	        };
    	}
    };
    var sidebar = new side($('#side-menu'), false);
});

$(document).ready(function() {
	$(".side-btn").click(function() {
		var c = $(this).find("i");
		var p = $(this).parent();
		var userName = $(this).parent().find(".user-name");
		var search = $(this).parent().find(".search-group");
		var btn = $(".side-btn").find(".icon");
		
		if(p.hasClass("sidebar-big")) {
			userName.hide(0);
			search.hide(0);
			$(".ul-header").hide(0);
			p.removeClass("sidebar-big");
			p.addClass("sidebar-sm");
			btn.toggleClass("icon-arrow-left icon-arrow-right");
			$(".link").parent().removeClass("open");
			$(".link").next().hide(0);
		}
		else {
			userName.show(0);
			search.show(0);
			$(".ul-header").show(0);
			p.removeClass("sidebar-sm");
			p.addClass("sidebar-big");
			btn.toggleClass("icon-arrow-left icon-arrow-right");
		}
	});
	
	$(".side-search").focus(function() {
		$(this).next().find(":button").addClass("active");
		$(this).addClass("active");
	});
	$(".side-search").focusout(function() {
		$(this).next().find(":button").removeClass("active");
		$(this).removeClass("active");
	});
	$(".btn-search").focus(function() {
		$(this).parent().prev().addClass("active");
		$(this).addClass("active");
	});
	$(".btn-search").focusout(function() {
		$(this).parent().prev().removeClass("active");
		$(this).removeClass("active");
	});
	
	$(".link").mouseover(function(){
		if($("#sidebar").hasClass("sidebar-sm")) {
			$(this).find(".ul-header").show(0);
			$(this).next().show(0);
			$(this).parent().addClass("open");
		}
	});
	$(".link-none").mouseover(function(){
		if($("#sidebar").hasClass("sidebar-sm")) {
			$(this).find(".ul-header").show(0);
			$(this).next().show(0);
			$(this).parent().addClass("open");
		}
	});
	$(".submenu").mouseover(function() {
		if($("#sidebar").hasClass("sidebar-sm")) {
			$(this).prev().find(".ul-header").show(0);
			$(this).show(0);
			$(this).parent().addClass("open");
		}
	});
	$(".submenu").mouseleave(function() {
		if($("#sidebar").hasClass("sidebar-sm")) {
			$(this).prev().find(".ul-header").hide(0);
			$(this).hide(0);
			$(this).parent().removeClass("open");
		}
	});
	$(".link").mouseleave(function(){
		if($("#sidebar").hasClass("sidebar-sm")) {
			$(this).find(".ul-header").hide(0);
			$(this).next().hide(0);
			$(this).parent().removeClass("open");
		}
	});
	$(".link-none").mouseleave(function(){
		if($("#sidebar").hasClass("sidebar-sm")) {
			$(this).find(".ul-header").hide(0);
			$(this).next().hide(0);
			$(this).parent().removeClass("open");
		}
	});
});
//=============控制sidebar的js结束====================//


//自动获取浏览器高度写入.auto-height中
$(document).ready(function autoHeight() {
	var height = $(window).outerHeight(true);
	height = height -50;
	$(".auto-height").height(height);
	$(window).resize(function resizeWindow() {
		var fns = function(){
			height = $(window).height();
			height = height - 50;
			$(".auto-height").height(height);
		}
		setInterval(fns, 10);
	});
	
});
//以上是弃用代码

//获取sidebar的高度给右边内容最小高度
$(document).ready(function(){
var tohigh=$("#sidebar").height();
$(".main-right").css({"minHeight":tohigh});
});

//获取导航条的高度写入min-height中
$("#sidebar").resize(function(){
	var kj=$("#sidebar").height();
	//获取sidebar的class值，当为sidebar-sm时auo-height用另一套minHeight
	var bb=$("#sidebar").attr("class");
    var bbj=bb.split(" ");
    var bbk=bbj[1];
    if(bbk=="sidebar-big"){
	   $(".main-right").css({"minHeight":kj});
    }   
	if(bbk=="sidebar-sm"){
	   $(".main-right").css({"minHeight":kj+200});
    }  
})



//报名分步开始
$("#double-kill").click(function(){
	$("#second").hide();
	$("#third").show();
});
$("#triple-kill").click(function(){
	$("#third").hide();
	$("#forth").show();
});
$("#return-fist").click(function(){
	$("#first").show();
	$("#second").hide();
});
$("#renturn-second").click(function(){
	$("#second").show();
	$("#third").hide();
});
//报名分步结束

//表单验证开始
$(".validate").validate({
	onFocus: function() {
		this.parent().addClass('active');
		return false;
	},
	onBlur: function() {
		var $parent = this.parent();
		var _status = parseInt(this.attr('data-status'));
		$parent.removeClass('active');
		if (!_status) {
			$parent.addClass('error');
		}
		return false;
	}
});	
$(".check-form").on('click', function(event) {
	var ks;
	event.preventDefault();
	ks=$(".validate").validate('submitValidate'); //return boolean;
	if(ks){
		$("#first").hide();
		$("#second").show();
	}
});
//表单验证结束


//注册完成实现读秒跳转开始
var c=5;
function timedCount(){
	document.getElementById("time").innerHTML=c;
	c=c-1;
	if(c==0){window.location.href='enroll-list.html'};
	setTimeout("timedCount()",1000);   
}

//面板收缩和展开通用js
$("[data-panel-toggle]").click(function panelToggle() {
	var id = $(this).attr("data-panel-toggle");
	$(id).slideToggle(300);
	var iClass = $(this).children("i").attr("class");
	if(iClass == 'icon icon-minus') {
		$(this).children("i").removeClass("icon-minus");
		$(this).children("i").addClass("icon-plus");
	}
	else {
		$(this).children("i").removeClass("icon-plus");
		$(this).children("i").addClass("icon-minus");
	}
});

//面板隐藏通用js
$("[data-panel-hide]").click(function panelHide() {
	var id = $(this).attr("data-panel-hide");
	$(id).hide(300);

});

//实现表单全选
$(".all-check").click(function() {
	if ($(this).prop("checked")) {
		$("input[type='checkbox']").prop("checked",true);
	} 
	else {
		$("input[type='checkbox']").prop("checked",false);	
	}
});

//为页面加载ZUI的tooltip组件
$("*").tooltip(Option);

//为菜单栏目下的添加种类加载ZUI弹出面板组件
$('#add-food-class').popover(Option);

//实现菜单功能中，当选中菜谱时，点击加入今日/明日/后日菜单，获取该选中栏目的菜名，复制后装到菜单显示栏中
$(function(){
   $("#add-today").click(function(){
   	  $("#food-check input[type='checkbox']").each(function(index){
   	  	if($(this).prop("checked")){
   	  		var a=$(this).parent().next().html();
   	  	    var b=$(this).parent().next().next().clone().attr("id",a).wrapInner("<span class='food-span'></span>").append("<a href='#' class='icon-times kiss'></a>");
   	  	    if($("#time-select").val()=="breakfast"){
   	  	    	$("#today-up").append(b);
   	  	    }
   	  	    if($("#time-select").val()=="lunch"){
   	  	    	$("#today-mid").append(b);
   	  	    }
   	  	    if($("#time-select").val()=="dinner"){
   	  	    	$("#today-down").append(b);
   	  	    } 
   	  	    return a;
   	  	    
   	    } 	      
   	  })
   	  //实现点击加入菜单后，选中的菜谱取消选中
   	  $("input[type='checkbox']").prop("checked",false);
   	  //实现每日的菜单中的标签关闭按钮，关闭当前加入的菜品
   	  $("#add-menu .kiss").each(function(index){
   	  	  $(this).click(function(){
   	  	  	   $(this).parent().remove();
   	  	  })
		
      })
})
$("#add-tomorrow").click(function(){
   	  $("#food-check input[type='checkbox']").each(function(index){
   	  	if($(this).prop("checked")){
   	  		var c=$(this).parent().next().html();
   	  	    var d=$(this).parent().next().next().clone().attr("id",c).wrapInner("<span class='food-span'></span>").append("<a href='#' class='icon-times kiss'></a>");
   	  	    if($("#time-select").val()=="breakfast"){
   	  	    	$("#tomorrow-up").append(d);
   	  	    }
   	  	    if($("#time-select").val()=="lunch"){
   	  	    	$("#tomorrow-mid").append(d);
   	  	    }
   	  	    if($("#time-select").val()=="dinner"){
   	  	    	$("#tomorrow-down").append(d);
   	  	    }  
   	  	    return c;
   	    } 	      
   	  })
   	  //实现点击加入菜单后，选中的菜谱取消选中
   	  $("input[type='checkbox']").prop("checked",false);
   	  //实现每日的菜单中的标签关闭按钮，关闭当前加入的菜品
   	  $("#add-menu .kiss").each(function(index){
   	  	  $(this).click(function(){
   	  	  	   $(this).parent().remove();
   	  	  })
		
      })
})
$("#add-future").click(function(){
   	  $("#food-check input[type='checkbox']").each(function(index){
   	  	if($(this).prop("checked")){
   	  		var e=$(this).parent().next().html();
   	  	    var f=$(this).parent().next().next().clone().attr("id",e).wrapInner("<span class='food-span'></span>").append("<a href='#' class='icon-times kiss'></a>");
   	  	    if($("#time-select").val()=="breakfast"){
   	  	    	$("#future-up").append(f);
   	  	    }
   	  	    if($("#time-select").val()=="lunch"){
   	  	    	$("#future-mid").append(f);
   	  	    }
   	  	    if($("#time-select").val()=="dinner"){
   	  	    	$("#future-down").append(f);
   	  	    } 
   	  	    return e;
   	    } 	      
   	  })
   	  //实现点击加入菜单后，选中的菜谱取消选中
   	  $("input[type='checkbox']").prop("checked",false);
   	  //实现每日的菜单中的标签关闭按钮，关闭当前加入的菜品
   	  $("#add-menu .kiss").each(function(index){
   	  	  $(this).click(function(){
   	  	  	   $(this).parent().remove();
   	  	  })
		
      })
})

//实现每日菜单中"清空列表"的功能
$("#del-today").click(function(){
 	$("#today td").remove();
})
$("#del-tomorrow").click(function(){
 	$("#tomorrow td").remove();
})
$("#del-future").click(function(){
 	$("#future td").remove();
})
})

//实现上传附件改变样式
$('input[class=lefile]').change(function() {
				$('.photoCover').html($(this).val());
});