<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<link rel="shortcut icon" href="<%=path %>/static/ramostear.ico"/>
<meta name="description" content=""/>
<meta name="viewport" content="width=device-width"/>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="description"
	content="爱快云（iKuai Cloud）是基于爱快路由/AP的云端运维平台，可以进行集中管理、WiFi大数据分析、WiFi认证配置、在线升级、推送通知等工作"/>
<meta name="viewport" content="width=device-width"/>
<link rel="stylesheet" href="<%=path %>/static/admin/login/css/bootstrap-2.3.2.css"/>
<link rel="stylesheet" href="<%=path %>/static/admin/login/css/flat-ui.css"/>
<link rel="stylesheet" href="<%=path %>/static/admin/login/css/normalize.css"/>
<link rel="stylesheet" href="<%=path %>/static/admin/login/css/main.css"/>
<link rel="stylesheet" href="<%=path %>/static/admin/login/css/login.css"/>
<link rel="stylesheet" href="<%=path %>/static/admin/login/css/bootstrap-select.css"/>
<title>歡迎登錄JCMS|RAMOSTEAR</title>
</head>
<body>
	<div class="headers">
		<div class="head_login">
			<img src="<%=path %>/static/admin/login/img/ikuai_yun.png"/>
		</div>
	</div>
	<div class="login_lay">
		<div class="slogan" style="top: 265px;">
			<img src="<%=path %>/static/admin/login/img/slogan.png"/>
		</div>
		<div class="logins" style="top: 115.5px;">
			<div class="box_tab">
				<img src="<%=path %>/static/admin/login/img/yun.png"/> <span>登录JCMS</span>
			</div>
			<form class="fc" id="login-form"
				action="#" method="post">
				<div class="box_div">
					<div class="promptInpt">
						<p class="promptTxt" style="display: block;">用户名</p>
					</div>
					<input class="user inptText login-email" name="username" value=""
						type="text"/>
				</div>
				<div class="box_div">
					<div class="promptInpt">
						<p class="promptTxt" style="display: none;">密码</p>
					</div>
					<input class="pwd01 inptText login-pwd" name="password" value=""
						type="password"/>
				</div>
				<div id="verify" class="code_img"
					style="display: none; height: 40px; margin-bottom: 10px;">
					<div class="fl" style="*width: 110px;">
						<div class="promptInpt" style="width: 60px;">
							<p class="promptTxt" style="width: 60px; left: -38px;">验证码</p>
						</div>
						<input class="verify" value="0" type="hidden"/> <input
							class="verification-code inptText login-code" name="" type="text"
							style="margin-bottom: 0; background: #eff3f6"/>
					</div>
					<a class="verification-code-img fl" href="Javascript: void(0)" onclick="">
						<img src="#"/>
					</a>
				</div>
				<div class="prompt" style="display: none;">
					<div class="prompt-error">用户名或密码错误</div>
				</div>
				<div class="H10"></div>
				<input class="btn-success bntH40" id="btn-login" name=""
					type="button" value="登　录"/>
			</form>

			<div class="states" style="margin: 0 auto; height: 24px;">
				<div class="stat">
					<label class="checkbox fl"
						style="margin-bottom: 0; margin-top: 5px;"> 7天内自动登录 <span
						class="icons"><span
							class="first-icon fui-checkbox-unchecked"></span><span
							class="second-icon fui-checkbox-checked"></span></span><input
						type="checkbox" class="login-remberPass" name="remberPass"
						style="display: none;" data-toggle="checkbox"/>
					</label> <a href="https://yun.ikuai8.com/login/register" class="fr">注册账户</a>
					<span class="fr"
						style="margin: 0px 5px 7px 5px; vertical-align: middle;">|</span>
					<a href="https://yun.ikuai8.com/login/forgotpass" class="fr"
						target="_blank">忘记密码</a>
				</div>
			</div>
		</div>
	</div>
	<div class="foot_bottom tc">
		<div>Copyright © 2017 - 2020 Ramostear. All Rights Reserved.
			黔ICP备13042604号</div>
		<div>版权所有 www.ramostear.com</div>
	</div>

	<script src="<%=path %>/static/admin/login/script/jquery-1.8.3.min.js"></script>
	<script src="<%=path %>/static/admin/login/script/bootstrap-2.3.2.js"></script>
	<script src="<%=path %>/static/admin/login/script/application.js"></script>
	<script src="<%=path %>/static/admin/login/script/bootstrap-select.js"></script>
	<script src="<%=path %>/static/admin/login/script/bootstrap-switch.js"></script>
	<script src="<%=path %>/static/admin/login/script/flatui-checkbox.js"></script>
	<script src="<%=path %>/static/admin/login/script/flatui-radio.js"></script>
	<script src="<%=path %>/static/admin/login/script/jquery.tagsinput.js"></script>
	<script src="<%=path %>/static/admin/login/script/jquery.placeholder.js"></script>
	<script src="<%=path %>/static/admin/login/script/main.js"></script>
	<script src="<%=path %>/static/admin/login/script/validate.js"></script>
	<script src="<%=path %>/static/admin/login/script/jquery.easing.min.js"></script>
	<!-- <div style="display:none">
		<script type="text/javascript">
		var _bdhmProtocol = (("https:" == document.location.protocol) ? "https://" : "http://");
		document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F94c233b083467f29121cf1b55e8e4464' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script>
		/*var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?d25dbdd99885d6279cbc5c627f7ee878";
			var s = document.getElementsByTagName("script")[0]; 
			s.parentNode.insertBefore(hm, s);
		})();*/
		</script>
	</div> -->
	<script src="<%=path %>/static/admin/login/script/login.js"></script>

	<script type="text/javascript">

var InterValObj; //timer变量，控制时间
var count = 300; //间隔函数，1秒执行
var curCount;//当前剩余秒数
var code = ""; //验证码
var codeLength = 6;//验证码长度

function sendMessage() {
	
	var m = $("#mobile_number").val();
	var v = $('#register-code').val();
	if ( m == "" || v == "") return;
    
    $.ajax({
        url : '/login/verifyMobile',
        type: 'post',
        dataType: 'json',
        data: {
            mobile: m,
            code:v,
			code_id:'register'
        },
        success: function(json) {
            if (json.status == 1) {
            	curCount = count;
                var dealType; //验证方式
                //产生验证码
                for (var i = 0; i < codeLength; i++) {
                    code += parseInt(Math.random() * 9).toString();
                }
                //设置button效果，开始计时
                $("#btnSendCode").attr("disabled", "true");
                $("#btnSendCode").addClass("disabled"); $("#btnSendCode").val( "重新获取"+"("+ curCount+"s)");
                InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                $('#regist-form .vcode-error').html('').hide();
                $('#regist-form .vcode-success').html(json.info);
                $('#regist-form .vcode-success').show();
                $('#regist-form .prompt').show();
            } else {
            	$('#regist-form .vcode-success').hide();
                $('#regist-form .vcode-success').html('');
                $('#regist-form .vcode-error').html(json.info);
                $('#regist-form .vcode-error').show();
                $('#regist-form .prompt').show();
            }
        }
    });
}
//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {                
        window.clearInterval(InterValObj);//停止计时器
        $("#btnSendCode").removeAttr("disabled");//启用按钮
        $("#btnSendCode").removeClass("disabled");
        $("#btnSendCode").val("重新获取验证码");
        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效    
    }
    else {
        curCount--;
        $("#btnSendCode").val( "重新获取"+"("+ curCount+"s)");
    }
}



    function landTop(a){
        var land= $(a);
        land.css({
            "top": (($(window).height() - land.outerHeight())/2)-40
        });

    };
    landTop(".logins");
    landTop(".slogan");
    $(window).resize(function(){
        landTop(".logins");
        landTop(".slogan");
    });
</script>
	<div
		style="position: static; width: 0px; height: 0px; border: none; padding: 0px; margin: 0px;">
		<div id="trans-tooltip">
			<div id="tip-left-top"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-left-top.png&quot;);"></div>
			<div id="tip-top"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-top.png&quot;) repeat-x;"></div>
			<div id="tip-right-top"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-right-top.png&quot;);"></div>
			<div id="tip-right"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-right.png&quot;) repeat-y;"></div>
			<div id="tip-right-bottom"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-right-bottom.png&quot;);"></div>
			<div id="tip-bottom"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-bottom.png&quot;) repeat-x;"></div>
			<div id="tip-left-bottom"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-left-bottom.png&quot;);"></div>
			<div id="tip-left"
				style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-left.png&quot;);"></div>
			<div id="trans-content"></div>
		</div>
		<div id="tip-arrow-bottom"
			style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-arrow-bottom.png&quot;);"></div>
		<div id="tip-arrow-top"
			style="background: url(&quot;chrome-extension://ikkepelhgbcgmhhmcmpfkjmchccjblkd/imgs/map/tip-arrow-top.png&quot;);"></div>
	</div>
</body>
</html>