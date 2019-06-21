$(function(){  
	//发送验证码
	$(".sendVerifyCode").on("click", function(){
		var number = $("input[name=number]").val();
		$.ajax({
	        url: getBasePath()+"/sendSms.html",
	        async : true,
	        type: "post",
	        dataType: "json",
	        data: {"number":number},
	        success: function (data) {
	        	if(data == 'fail'){
	        		alert("发送验证码失败");
	        		return ;
	        	}
	        }
    	});
	}) 
	//提交
	$(".sub-btn").on("click", function(){
		var data = {};
		data.userId = $.trim($("input[name=userId]").val());
		data.password = $.trim($("input[name=password]").val());
		data.number = $.trim($("input[name=number]").val());
		data.verifyCode = $.trim($("input[name=verifyCode]").val());
		$.ajax({
	        url: getBasePath()+"/register.html",
	        async : true,
	        type: "post",
	        dataType: "json",
	        data: data,
	        success: function (data) {
	        	if(data == 'fail'){
	        		alert("注册失败");
	        		return ;
	        	}
	        	alert("注册成功");
	        }
    	});
	})
});