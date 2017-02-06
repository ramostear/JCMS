
/****************************************登录/注册*************************************/
/*展开/收起*/
function startUp(b,d,f){
	var x=$(b);
	var y=$(d);
	var z=$(f);
	
	function ce(x ,y){	
		x.find(".btn-folding").css("display")=="none" ? y.hide() : y.show();

		x.find(".btn-spread").click(function(){
			$(this).hide();
			x.find(".btn-folding").show();
			y.stop(true, true).slideDown();
			
		});
		x.find(".btn-folding").click(function(){
			$(this).hide();
			x.find(".btn-spread").show();
			y.stop(true, true).slideUp();
			
		});
	}
	
	
	if(z.length>0){
		z.each(function(){
			var n=$(this).find(x);
			var m=$(this).find(y);
			ce(n ,m);
		})
	} else {
		ce(x ,y);
	}
	
}

/*背景全屏*/
function bgimg(){
	var bg = $("#bgimg");
	var bgi = $("#bgimg img");
	landCenter("#bgimg img");
	 
	var winW = document.documentElement.clientWidth;
	var winH = document.documentElement.clientHeight;
	var scale = 0.5625;

}

/*inpt框内提示*/
function promptInpt(){
	$('.inptText').each(function(){ 
		if($(this).val()!=""){
				$(this).siblings().children(".promptTxt").hide();
		}
	})
	$('.promptTxt').click(function(){
		$(this).hide();
		$(this).parent().siblings(".inptText").focus();
		
	});
	$('.inptText').focus(function(){
         $(this).siblings().children(".promptTxt").hide();
    }).blur(function(){
		if($(this).val()==""){
        	$(this).siblings().children(".promptTxt").show();
		}
   });

}
/*inpt框内提示 end*/




/*div居中*/
function landCenter(a){
	var land= $(a);
	land.css({
		"left": ($(window).width() - land.outerWidth())/2,
		"top": ($(window).height() - land.outerHeight())/2
	});
		
};

/*登录/注册*/
function switching(a,b){
	$(a).fadeOut();
	$(b).fadeIn();
}


/****************************************登录/注册-end*************************************/


/*上传美化*/
function upload(){
	var textButton="<input type='button' name='' value='选择文件' class='btn btn-primary type_file_button' />"
	$(".type_file").each(function(a){
			var fileDiv = $(this);
			var file = fileDiv.find(".fileField");
			var fileTxt = fileDiv.find(".textfield");
			
			$(textButton).insertBefore(file);
			file.change(function(){
				fileTxt.val(file.val());
			});					   
	})
}
/*上传美化-end*/

/*高度开关绑定*/
function seitchH(a, b, f) { 
	var k = $(a);
	var o = $(b);
	var p = $(f);
	function se(k, o) {
		k.is(':checked') ? o.slideDown() : o.hide()
		k.change(function() {
			k.is(':checked') ? o.slideDown() : o.slideUp()
		})
	}

	if (p.length > 0) {
		p.each(function() {
			var n = $(this).find(a);
			var m = $(this).find(b);
			se(n, m);
		});

	} else {
		se(k, o);
	}

}
/* 高度开关绑定-end */

/*开关切换*/
//function selectChange(s,a,f){
//	var d= $(a);
//	var k= $(s);
//	var p= $(f);
//
//	function se(d ,k){
//		d.each(function(c){
//				if(k.find("option:selected").val()==(c+1)){ 
//					d.hide();
//					$(this).show(); 
//				}
//			});
//	}
//	if(p.length>0){
//		p.each(function(){
//			var n=$(this).find(d);
//			var m=$(this).find(k);
//			
//			se(n,m);
//			m.change(function(){se(n,m);});
//		})
//		
//	} else {
//		se(d,k);
//		k.change(function(){se(d,k);});
//	}
//	
//}
function selectChange(selectClass, optionClass, parentClass) {
	//alert(selectClass);alert(optionClass);
	var parent = $(parentClass);

	if (parent.length > 0) {
		parent.each(function() {
			var options = $(this).find(optionClass);
			var select = $(this).find(selectClass);
			execSelect(options, select);
			
			select.change(function() {
				execSelect(options, select);
			});
		})
	} else {
		var options = $(optionClass);
		var select = $(selectClass);
		execSelect(options, select);
		
		select.change(function() {
			execSelect(options, select);
		});
	}

	function execSelect(options, select) {
		options.each(function(idx) {
			if (select.find("option:selected").val() == (idx + 1)) {
				options.hide();
				$(this).show();
		}
		});
	}
}
/*开关切换-end*/

/*动态切换开关，支持clone的对象*/
function selectChangeActive(selectClass, optionClass, parentClass){
	var parent = $(parentClass);

	if (parent.length > 0) {
		parent.each(function() {
			var options = $(this).find(optionClass);
			var select = $(this).find(selectClass);
			execSelect(options, select);
			
			select.change(function() {
				var parentBlock = $(this).parents('.parent-block');
				var options = parentBlock.find(optionClass);
				var select = parentBlock.find(selectClass);
				execSelect(options, select);
			});
		})

	} else {
		var options = $(optionClass);
		var select = $(selectClass);
		execSelect(options, select);
		
		select.change(function() {
			var parentBlock = $(this).parents('.parent-block');
			var options = parentBlock.find(optionClass);
			var select = parentBlock.find(selectClass);
			execSelect(options, select);
		});
	}

	function execSelect(options, select) {
		options.each(function(idx) {
			if (select.find("option:selected").val() == (idx + 1)) {
				options.hide();
				$(this).show();
			}
		});
	}
}

$(document).ready(function(){
	sideNavs();//侧导航
	$(".subset > ul  li").click(function(){
		var len = $(this).find("ul").length;

		if(len > 0){
			$(this).addClass("on");
			$(this).css("background","#2b3c4e")
			$(this).find("a").css("color","#a1a1a1");
		}else{
			$(".side-nav  li").removeClass("on");
			$(this).addClass("on");
		}
	});
	
	
	// 判断IE版本
	checkIEVersion();
	
	// 表单验证
	easy();
	
	/*下拉表单给隐藏域赋值*/
	selectHide();
	
	/*上传美化*/
	upload();
	
	
	/*认证开关*/
	seitchH("#auth-switch input",'#auth-block');
	seitchH("#inform-switch input",'#inform-block');
	
	/*高度开关绑-列表用*/
	seitchH(".checkbox-seitchK input",'.checkbox-seitchOn',"seitchN");
	/*开关切换-列表用*/
	selectChange(".selectI",".selectF-ul li",".selectF");
	/* 高度开关绑定--设备管理-js插入-配置模板（弹框）-PC移动切换- */
	selectChange(".selectPC-Mobiles", ".selectPC-Mobiles-ul>li", ".selectPC-Mobile-parent");
	
	
	/*高度开关绑定--设备管理-认证设置-基础模板（2）-高级设置*/
	seitchH("#developA01 input",'#develop01');
	startUp("#developA02",'#develop02');
	
	startUp(".no-auth-setting-switch",'.no-auth-setting','.no-auth-setting-parent');
	startUp(".global-setting-switch",'.global-setting','.global-setting-parent');
	
	/*高度开关绑定--设备管理-认证设置-基础模板（2）-认证方式*/
	seitchH(".turn-on-wechat-setting input", '.wechat-setting', '.wechat-setting-parent');
	
	seitchH(".turn-on-wechat-conadv input", '.wechat-conadv', '.wechat-conadv-parent');
	seitchH("#checkbox-seitchK01a input",'#checkbox-seitchO01a');
	seitchH("#checkbox-seitchK01b input",'#checkbox-seitchO01b');
	//seitchH("#checkbox-seitchK02 input",'#checkbox-seitchO02');
	seitchH(".turn-on-fixed-passwd-setting input", '.fixed-passwd-setting', '.fixed-passwd-setting-parent');
	seitchH("#checkbox-seitchK03 input",'#checkbox-seitchO03');
	seitchH("#checkbox-seitchK04 input",'#checkbox-seitchO04');
	seitchH("#checkbox-seitchK05 input",'#checkbox-seitchO05');
	
	/*高度开关绑定--设备管理-认证设置-自定义页面*/
	seitchH(".use-partial-ip input",'.partial-ip', '.partial-ip-parent');

	/*高度开关绑定--设备管理-认证设置-微信认证高级切换*/
	seitchH('.turn-on-general-wechat-setting input', '.general-wechat-setting', '.wechat-setting');
	seitchH('.turn-on-advance-wechat-setting input', '.advance-wechat-setting', '.wechat-setting');
	seitchH('.turn-on-connect-wechat-setting input', '.connect-wechat-setting', '.wechat-setting');
	seitchH('.turn-on-wechat-new-setting input', '.wechat-new-setting', '.wechat-setting');
	seitchH('.turn-on-easy-wechat-setting input', '.easy-wechat-setting', '.wechat-setting');
	
	seitchH("#checkbox-seitchK06a input",'#checkbox-seitchO06a');
	seitchH("#checkbox-seitchK07a input",'#checkbox-seitchO07a');
	seitchH("#checkbox-seitchK11 input", '#checkbox-seitchO11');
	seitchH("#checkbox-seitchK11s input", '#checkbox-seitchO11s');
	/* 高度开关绑定--设备管理-js插入-投放策略（弹框）-通知范围 */
	seitchH("#checkbox-seitchK10 input", '#checkbox-seitchO10');
	
	/*开关切换*/
	selectChange("#select01","#select01-ul>li");
	//selectChange("#select02","#select02-ul>li");
	selectChange(".second_auth_option",".second_auth_method li", '.second_auth_parent');
	
	selectChange("#select00","#select00-ul>li");
	
	/*微信连一连高级*/
	startUp(".eee",".ttt");
	
	/*页面切换*/
	jump("#jump01"); 
	
	/*绑定码显示修正*/
	fixBindCode();
	
	/*鼠标放在错误提示框上的时候自动隐藏*/
	$('.popover').live('hover', function() {
		var that = this;
		setTimeout(function(){
			$(that).prev().popover('hide');
		}, 500);
	});
	
});	

$(window).resize(function(){
		
	/********登录/注册*******/	
	/*背景全屏*/
	bgimg();
		
	/*div居中*/
	landCenter(".login");
	landCenter(".register");
	/********登录/注册-end*******/
});	

/**************************以下为全局变量、全局函数*****************************/
var globalNetErrorMsg = '网络不给力，请稍后刷新重试！';

//单位转换
function changeSize(value) {
	var a = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
	for (var i = 0; value >= 1024 && i < a.length; i++) {
		value = value / 1024;
	}
	return value.toFixed(2) + a[i];
}

/*页面切换*/
function jump(a){
	var d= $(a);
	d.change(function(){
		window.location = d.find("option:selected").val();
	})
}
/*页面切换-end*/

/**
 * 解析URL参数
 */
function parseUrl (url){
	var url_seg = {}, url_component = {}, params = {};
	//首先，根据?的位置，将url分成两端
	url_seg = url.split('?');
	
	//如果存在第二段，开始解析参数
	if (url_seg[1] != undefined) {
		var query_seg = url_seg[1].split('&');
		for (var i = 0; i < query_seg.length; i++) {
			var param_seg = query_seg[i].split('=');
			if (param_seg[0]) {
				params[param_seg[0]] = decodeURIComponent(param_seg[1]);
			}
		}
	}
	url_component.base_url = url_seg[0];
	url_component.params = params;
	return url_component;
}

/**
 * 构建URL
 * @param base_url string
 * @param params object
 * @return string 构建后的URL
 */
function builtUrl (base_url, params){
	return base_url + '?' + $.param(params);
}

/**
 * 绑定码截取
 */
function fixBindCode() {
	var p = $('.ID-num');
//	if (p.html()) {
//		var span = p.find('span');
//		span.html(span.attr('value').substring(0, 7) + '...');
//		p.hover(
//			function(){
//				span.html(span.attr('value'));
//			},
//			function(){
//				if (span.attr('rightClick') != 'true') {
//					span.html(span.attr('value').substring(0, 7) + '...');
//				}
//			}
//		);
//		span.mousedown(function(event){
//			if (event.which == 3) {
//				span.attr('rightClick', 'true');
//			}
//		});
//		$('body').mousedown(function(event){
//			if (event.which == 1) {
//				if (span.attr('rightClick') == 'true') {
//					span.removeAttr('rightClick');
//					span.mouseleave();
//				}
//				
//			}
//		});
//	}
	if (p.html()) {
		var span = p.find('span');
		span.html(span.attr('value').substring(0, 7) + '...');
		p.hover(
			function(){
				if (span.html().indexOf('...') != -1) {
					span.html(span.attr('value'));
				}
			},
			function(){
				if (span.attr('click') != 'true') {
					span.html(span.attr('value').substring(0, 7) + '...');
				}
			}
		);
		p.mousedown(function(event){
			span.attr('click', 'true');
			event.stopPropagation();
		});
		$('body').mousedown(function(event){
			if (event.which == 1) {
				if (span.attr('click') == 'true') {
					span.removeAttr('click');
					span.mouseleave();
				}
				
			}
		});
	}
}

/**
 * ajax错误返回处理
 * @param json
 * @param doNotShowError 不显示错误
 * @returns {Boolean} 有错时弹出错误并返回false，无错时返回true
 */
function checkAjaxError(json, doNotShowError){
	if (json.status != 1) {
		if (json.url) {
			window.location.href = json.url;
		} else if (!doNotShowError) {
			showAlert(json.info);
		}
		return false;
	} else {
		return true;
	}
}

/**
 * 弹窗提示
 * @param msg
 */
function showAlert(msg){
	$('.close').click();
	$('#alert-modal').find('.confirm-msg').html(msg);
	var al = $('#_alert_btn');
	if (al.length > 0) {
		$('#_alert_btn').click();;
	} else {
		var _html = '<a href="#alert-modal" role="button" data-toggle="modal" id="_alert_btn"></a>';
		$('body').append(_html);
		$('#_alert_btn').click();
	}
}

/**
 * 显示加载完后的内容
 */
function ready(){
	$('.main-content').slideDown();
	$('.main-content-loading').slideUp();
}

/**
 * 校验指定节点下指定的表单项
 * @param fields
 * @param block
 * @returns {Boolean}
 */
function processCheck(fields, block) {
	var flag = true;
	$.each(fields, function(idx, val) {
		if (!validate(block.find('[name="' + val + '"]'))) {
			flag = false;
		}
	});
	return flag;
}

/**
 * 滑动到第一个显示的错误提示框
 * @param block
 */
function scrollFirstPopover(block){
	var is_modal = 0;
	//确定要滑动的窗口
	if (block == undefined) {
		block = $('html,body');
	} else {
		is_modal = 1;
	}
	
	//获取第一个显示的错误提示框
	var position, tmp = 0;
	block.find('.popover:visible').each(function(idx, val){
		tmp = $(val).offset().top;
		if (typeof(position) == 'undefined') {
			position = tmp;
		} else if (tmp < position) {
			position = tmp;
		}
	});
	
	//距离窗口顶端保留一定的距离
	if (position > 10) {
		position -= 10;
	}
	
	//确定要滑动的窗口
	//把指定窗口内的第一个元素作为参照物重新计算滑动距离
	if (is_modal) {
		position -= block.children().eq(0).offset().top;
	}
	
	block.animate({
		scrollTop: position
	},
	500);
}

/**
 * @desc 判断IE版本
 */
function checkIEVersion() {
	var appver = navigator.appVersion;
	if (appver.indexOf('MSIE') != -1) {
		var matches = appver.match(/MSIE (\d+)/i);
		var version = matches[1];
		if (version < 8) {
			$('.IEtip').show();
		} else {
			$('.IEtip').hide();
		}
	}
}

function show_message(msg,type,button,title){
	var button=arguments[2]?arguments[2]:false;
	var title=arguments[3]?arguments[3]:false;
	var divObj=document.createElement("div");
	if($("#confirm_info").length==0){
		divObj.innerHTML='<div id="confirm_info" style="z-index: 1600; top: 25%;" class="modal hide fade"><div class="modal-header"><h3>确认</h3></div><div class="modal-body tc"><p class="confirm-msg" id="msg_info">'+msg+'</p></div><div class="modal-footer tc" id="msg_button"><a href="javascript:void(0)" id="msg_commit" class="btn btn-success btn-submit" data-dismiss="modal" aria-hidden="true">确&nbsp;认</a></div></div>';
		var first=document.body.firstChild;
		document.body.insertBefore(divObj,first);
	}
	if(type==1){
		$('#confirm_info').find("#msg_commit").attr("onclick","window.location.reload();");
	}else{
		$('#confirm_info').find("#msg_commit").removeAttr("onclick");
	}
	$('#confirm_info').find("#msg_info").html(msg);
	if(title){
		$('#confirm_info').find("h3").html(title);
	}
	if(button){
		$('#confirm_info').find("#msg_button").html(button);
	}
	$('#confirm_info').modal('show');
}

function ajax_return_error(obj,error_tips){
	var controls = obj.parents('.controls:eq(0)');
	obj.attr('data-toggle', 'popover').attr('data-trigger', 'manual').attr('data-placement', 'right');
	if (!obj.hasClass('form-control')) {
		obj.addClass('form-control');
	}
	controls.addClass('has-error');
	var old_error_tips = obj.attr('data-content');
	if (old_error_tips != error_tips) {
		if (old_error_tips != undefined) {
			obj.popover('destroy');
		}
		obj.attr('data-content', error_tips);
		obj.popover({content: error_tips});
	}
	obj.popover('show');
}
function ajax_remove_error(obj){
	var controls = obj.parents('.controls:eq(0)');
	controls.removeClass('has-error');
	obj.attr('data-content', '');
	obj.popover('hide');
	controls.find('.popover').remove();
	obj.popover('destroy');
}
/**
 * 下拉表单给隐藏域赋值  
 * select 加 hideId=""
 */
function selectHide(){	
	$("select[name='herolist']").change(function(){
		var val = $(this).val();
		var hideId = $(this).attr("hideId");
		var hide = $("#"+hideId);
		if(hideId!=undefined && hide!=undefined){ 
			hide.val(val);
		};
	});
};
function sideNav_bak(){
	//先区分左侧菜单是一级菜单还是二级菜单
	var li =$(".side-nav li");
	li.addClass("submenu");
	li.has("ul").removeClass("submenu").addClass("menus");
	
	var submenu = $(".submenu > a");
	var menus = $(".menus > a");
	
	submenu.click(function(){
		li.removeClass("on");
		$(this).parent().addClass("on");	
		if($(this).parents().is(".menus")){}else{closemenu();}
	});
	menus.click(function(){
		if($(this).parent().is(".open")){
			closemenu();
		}else{
			closemenu();
			$(this).parent().addClass("open");
			$(this).siblings("ul").slideDown();	
		}
			
	});
	
	//关闭二级标签
	function closemenu(){
		$(".open").removeClass("open");
		$(".side-nav ul").slideUp(100);
	}
}
//日期比较
function duibiday(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes >= lktimes)
        return false;
    else
        return true;
}

//流量转换
function formatBytes(v){
	  var A = [' B', ' KB', ' MB', ' GB', ' TB',' PB']; 
	  for (i = 0; v >= 1024 && i < 5; i++){v /= 1024;}
	  return (Math.round(v*100)/100)+A[i]; 
	}

//日期插件联动
function time_function(start,end){
	var status=arguments[2]?arguments[2]:false;
	var day_status=arguments[3]?arguments[3]:false;
	start.datetimepicker({
		language:'zh-CN',
	 	weekStart:1,
        format: "yyyy-mm-dd",
        autoclose: true,
        startView:2,
		minView:2,
		forceParse:true
    }).on("show",function(ev){
		date1 = new Date();
		if(status){
			date1.setDate(date1.getDate()-1);
		}else{
			date1.setDate(date1.getDate()-2);
		}
		time = date1.getFullYear()+"-"+(date1.getMonth()+1)+"-"+date1.getDate();
		start.datetimepicker("setEndDate", time);
	}).on("changeDate",function(ev){
    	start.datetimepicker("hide");
		end.datetimepicker("show");
	});
	
	end.datetimepicker({
		language:'zh-CN',
		weekStart:1,
		format: "yyyy-mm-dd",
		autoclose: true,
		startView: 2,
		minView: 2,
		forceParse: true
	}).on("show", function (ev) {
		if (start.find(".signstart").val()) {
			if(!day_status){
				date1 = new Date();
				date1.setDate(date1.getDate()-1);
				time = date1.getFullYear()+"-"+(date1.getMonth()+1)+"-"+date1.getDate();
				end.datetimepicker("setEndDate", time);
			}

			time = start.find(".signstart").val();
			date2 = new Date(time);
			if(status){
				date2.setDate(date2.getDate());
			}else{
				date2.setDate(date2.getDate()+1);
			}
			time = date2.getFullYear()+"-"+(date2.getMonth()+1)+"-"+date2.getDate();
			end.datetimepicker("setStartDate", time);
		}else{
			start.datetimepicker("show");
			end.datetimepicker("hide");
		}
	});
}

function sideNavs(){
	var li = $(".side-nav  li");
	$(".side-nav  li").addClass("noSubset"); // 一级菜单
	
	li.has("ul").removeClass("noSubset").addClass("subset");  // 二级菜单

	var lis = $(".side-nav >  li");
	lis.has("ul>li>ul").removeClass("subset").addClass("submenu");  // 三级菜单


	var noSubset = $(".noSubset > a");
	var subset = $(".subset > a");
	var submenu = $(".submenu > a");

	noSubset.click(function(){
		li.removeClass("on");
		$(this).parent().addClass("on");
		if($(this).parents().is(".subset")){

		}else{
			if($(this).parents("li").is(".subset")){
				shut();
			}else if($(this).parents("li").is(".submenu")){
				$(this).parent("li").siblings().removeClass("open");
			}
		}
	});
	
	subset.click(function(){
		if($(this).parent().is(".open")){
			if($(this).parents("li").is(".subset")){
				$(this).parent("li").removeClass("open");
				$(".side-nav  ul").slideUp(100);
			}else if($(this).parents("li").is(".submenu")){

			}
		}else{
			if($(this).parents("li").is(".submenu")){

				$(this).parent().addClass("open");
				$(this).siblings("ul").slideDown();
			}else if($(this).parents("li").is(".subset")){
				shut();
				$(this).parent().addClass("open");
				$(this).siblings("ul").slideDown();
			}
		}
	});

	submenu.click(function(){
		if($(this).parent().is(".open")){
			shut();

		}else{
			shut();
			$(this).parent().addClass("open");
			$(this).siblings("ul").slideDown();
		}
	});
	
	
	//关闭子集
	function shut(){
		$(".open").removeClass("open");
		$(".side-nav ul").slideUp(100);
	}
	
	
}



/*================================*/
function createForm(url,myArr,method,target){
	myArr=myArr||new Array();
	method=method||'post'; 
	target=target||'_self'; 
	// 创建一个 form 
	var form1 = document.createElement("form"); 
	form1.id = "form1"; 
	form1.name = "form1"; 
	// 添加到 body 中 
	document.body.appendChild(form1); 
	// 创建一个输入 
	// 设置相应参数 
	for (x in myArr)
	{
		var input = document.createElement("input"); 
		input.type = "text"; 
		input.name = x
		input.value = myArr[x];
		// 将该输入框插入到 form 中 
		form1.appendChild(input); 
	}
	
	// form 的提交方式 
	form1.method = method;
	// form 提交路径 
	form1.action = url; 
	form1.target = target; 
	// 对该 form 执行提交 
	form1.submit(); 
	// 删除该 form 
	document.body.removeChild(form1); 
}

function showError(obj,json){
	var p = obj[json.name].parentNode;
	p.className += " " + 'has-error';  
	for(var i =0,pl= p.childNodes.length;i<pl;i++) {
		if(_hasClass(p.childNodes[i].className,'error_red'))
			p.childNodes[i].innerHTML=json.msg;
	}
}
function _hasClass(objClass, cls) { 
	if(objClass)
		return objClass.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
	else
		return false;
}

function box_message(msg,type,button,title){
	var type=type||'right';
	var button=button ||"";
	var def;
	var src_img;
	if(type=='right'){
		def="正确提示";
		src_img="/Public/images/pass_n.png";
	}else{
		def="错误提示";
		src_img="/Public/images/errors.png";
	}
	var title=title || def;
	var box_id="box_message";
	if($("#"+box_id).length==0){
		var divObj=document.createElement("div");
		var str='';
		str+='<div id="'+box_id+'" class="modal hide fade opera_tip" tabindex="-100"  data-backdrop="static" style="top:15%; width: 460px;">';
		str+='<div class="modal-header" style="border-bottom: 0;">';
		str+='<h3 id="box_title"></h3>';
		str+='</div>';
		str+='<div class="modal-body">';
		str+='<div class="error">';
		str+='<img id="box_img"/>';
		str+='<span id="box_msg"></span>';
		str+='<a style=" margin: 0 auto; display: block;width: 60px; margin-top: 40px;" class="btn btn-success" href="javascript:void(0);" onclick="$(\'#'+box_id+'\').modal(\'hide\')">确&nbsp;&nbsp;定</a>';
		str+='</div>';
		str+='</div>';
		str+='</div>';
		divObj.innerHTML = str;
		var first=document.body.firstChild;
		document.body.insertBefore(divObj,first);
	}
	
	$("#"+box_id).find("#box_img").attr("src",src_img);
	$("#"+box_id).find("#box_title").html(title);
	$("#"+box_id).find("#box_msg").html(msg);
	$('#'+box_id).modal('show');
}
//定时器
Countdown=function(formNameOrNode,node,time){
	curCount=count =time||60
	this.node=node;
    this.setInterval = function(callback,timeout,param) 
    { 
		var args = Array.prototype.slice.call(arguments,2); 
		var _cb = function(){ 
		    callback.apply(null,args); 
		} 
		setInterval(_cb,timeout); 
    } 
    
    this.sendMessage=function () {
    	forms=$("form[name="+formNameOrNode+"]");
    	forms.find("#"+this.node).attr("disabled", "true");
    	forms.find("#"+this.node).addClass("disabled");	
    	forms.find("#"+this.node).val( "重新获取"+"("+ count+"s)");
        InterValObj=setInterval(this.d,1000,'InterValObj',forms,this.node); 
    }
    this.d=function(InterValObj,obj,node){
		if (this.curCount == 0) {
				window.clearInterval(InterValObj);//停止计时器
				obj.find("#"+node).removeAttr("disabled");//启用按钮
				obj.find("#"+node).removeClass("disabled");
				obj.find("#"+node).val("重新获取验证码");
			}else {
				this.curCount--;
				obj.find("#"+node).val( "重新获取("+ this.curCount+"s)");
			}
		}  
}

function setShowClass(field,type,notes){
	var p = field.parentNode;
	if(type=='add'){
		p.className += " " + 'has-error';  
    	for(var i =0,pl= p.childNodes.length;i<pl;i++) {
    		if(_hasClass(p.childNodes[i].className,'error_red'))
    			p.childNodes[i].innerHTML=notes;
    	}
	}else if(type=='remove'){
		if (_hasClass(p.className, 'has-error')) {  
	        var reg = new RegExp('(\\s|^)' +'has-error' + '(\\s|$)');  
	        p.className = p.className.replace(reg, ' ');  
	    }
    	for(var i =0,pl= p.childNodes.length;i<pl;i++) {

    		if(this._hasClass(p.childNodes[i].className,'error_red'))
    			p.childNodes[i].innerHTML=notes;
    	}
	}
}
function _hasClass(objClass, cls) { 
	if(objClass)
		return objClass.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
	else
		return false;
}

function removeErrorClass(fields){
	for (var i = 0, fieldLength = fields.length; i < fieldLength; i++) {
		setShowClass(fields[i],'remove',"");
	}
}
/*================================*/
