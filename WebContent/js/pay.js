$(function(){
	//商家留言部分的js
	let allData = "";
	let datas = [];

	$('.show-tags').on('focus', function() {
		$(".order-tags").css("display", "block");
		if($('.show-tags').value == null){
			allData = "";
			datas = [];
		}
	});
	
	$('.right-menu').on('click', function(event){
		let txt = $(event.target).html();
		allData = $('.show-tags').val();
		if($(event.target).attr('class') == 'tags'){
			if(datas.indexOf(txt) == -1){
				allData += $(event.target).html() + " ";		
				$('.show-tags').val(allData);
				datas.push(txt);
			}
		}else if($(event.target).attr('class') == 'show-tags'){
		}else{
			$(".order-tags").css("display", "none");
		}
	});
	

	// 添加新地址模块里保存按钮的js
	$('#save').click(function() {
		let sexNode = '';
		$("input[type=radio]:checked").each(function() {
			sexNode = $(this).val();
		})
		username = $('#username').val()+sexNode;
		$('#username').val(username);

		
		$('#saveInfo').submit();
	});
	
	$('#pay-btn').on('click', function(){
		alert("购买成功！即将进入任务页");
	});
})