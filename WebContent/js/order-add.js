  $(function(){
    var zong
    // 点击左边的添加的按钮获取对应商品的信息
    var k = 0
    $('.food-details').on("click",".addcart",function(){
      if (!isNaN(parseInt($(this).prev().text()))) {
        var m = $(this).prev().text();
        var t = $(this).prev().attr("data")
        m++
        $(this).prev().text(m)
        $('.add[data='+t+']').click()
      } else {
        var dishName = $(this).prev().prev().text()//获取点击元素的上上个兄弟节点的内容
        var prices = parseInt($(this).prev().text().substring(1))//获取单品价格
        $(this).before('<span data='+k+' class="single_price">'+ 1 +'</span>')
        $('.shopping-info').append('<div class="info">'+ dishName +'</div>')
        $('.shopping-info').append('<div class="add-info"><a data='+k+' href="javascript:;" class="sub"></a><input type="text" class="txt-count" value="1" maxlength="2" /><a data='+k+' href="javascript:;" class="add"></a></div>')
        $('.shopping-info').append('<div class="shop-pri"><span  class="unit-price">￥'+prices+'</span></div>')
        k++;
      }
      spJingE ()
    })
    //点击+ - 号;
    $('.shopping-info').on("click",".sub",function(){
      var t = $(this).attr("data") ;
      var x =  $(this).next().val();
    	x--;
      if (x == 0) {
        $(this).parent().next().remove()
        $(this).parent().prev().remove()
        $(this).parent().remove()
        $('.single_price[data='+t+']').remove()
      }
      $(this).next().val(x);
      jiSuan(t);
		  spJingE();
    });
  	$('.shopping-info').on("click",".add",function(){
      var t = $(this).attr("data");
  		var x = $(this).prev().val();
  		x++;
  		$(this).prev().val(x);
  		jiSuan(t);
  		spJingE();
    });
    // 手动输入数量
    $('.shopping-info').on("blur",".txt-count",function(){
      var dan = parseInt($('.single_price[data='+t+']').prev().text().substring(1));
      var t = $(this).next().attr("data");
      console.log(t)
  		var x = $('.add[data='+t+']').prev().val();
  		var reg = /^\d+$/;
  		if (reg.test(x)) {
  			$('.add[data='+t+']').prev().val(x);
  			jiSuan(t);
  			spJingE();
  		}else{
  			$('.add[data='+t+']').prev().val(1);
  			$('.add[data='+t+']').parent().next().children().text(dan.toFixed(2));
  			alert('请输入正确的商品数目!')
  		}
  	});
    //每行的金额和数量
    function jiSuan (t) {
      
      var dan = parseInt($('.single_price[data='+t+']').prev().text().substring(1));
      var num = $('.add[data='+t+']').prev().val()
      zong = dan * num;
      $('.add[data='+t+']').parent().next().children().text('￥'+zong.toFixed(2))
      $('.single_price[data='+t+']').text(num)
    }
    // 商品总的金额和数量
    function spJingE () {
      var allprice = 0; //总价
       var alltotal = 0;//总数
      $(".txt-count").each(function() {
        var total = parseInt($(this).val())
        alltotal += total
      })
      $(".unit-price").each(function() {
        var total_price = parseInt($(this).text().substring(1))
        allprice += total_price
      })
      $('.price-info').text(alltotal);
      $('.price').text('￥'+allprice);
      if(allprice > 0){
    	  $('#goBuyBtn').css('background-color','#FFD161')
    	  $('#goBuyBtn').css('color','black')
      }
      if ($('.price').text().substring(1) == 0) {
    	  $('.price').text(parseInt($('.price').text().substring(1)).toFixed(2))
      }
    }
    // 清空购物车
    $(".clear").click(function(){
      $('.shopping-info').empty()
      $('.single_price').remove()
      spJingE()
    })

    //点击去结算
      $('#goBuyBtn').click(function () {
    	  let str = $('.shopping-price .price ').html().trim();
    	  if(str == null || str == '0.00'){
    		  alert("请您购买商品后再下单");
    	  }else{
    		  let jsonStr = '';
    		  let nameStr = '';
    		  var nameNode = $(".shopping-info .info");
    		  let priceNode = $(".shopping-info .txt-count");
    		  let countNode = $(".shopping-info .unit-price");
    		  let dataArr = [];
    		  for(var i = 0; i < nameNode.length; i++){
    			  let obj = {}
    			  obj.goodName = nameNode[i].innerHTML;
    			  obj.goodCount = priceNode[i].value;
    			  obj.goodPrice = countNode[i].innerHTML.substr(1);
    			  if(obj.goodCount>1){
    				  obj.goodPrice  = obj.goodPrice/obj.goodCount;
    			  }
    			  dataArr.push(obj);
    		  }
    		  
    		  var myform=$('#shopping-cart-form'); //得到form对象
    		  var tmpInput=$("<input type='hidden' name='data'/>");
    		  tmpInput.attr("value", JSON.stringify(dataArr));
    		  var addrInput=$("<input type='hidden' name='addr'/>");
    		  addrInput.attr("value",$("#addr").text().trim());
    		  myform.append(tmpInput);
    		  myform.append(addrInput);
    		  myform.submit();
    	  }
       })

  })
