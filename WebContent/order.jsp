<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8" />
<title>选菜下单</title>
<link rel="shortcut icon" href="img/icon.ico">
<link rel="stylesheet" type="text/css" href="css/order.css" />
<link rel="stylesheet" type="text/css" href="css/banner.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<script src="./js/jquery-2.1.4.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/order-add.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div id="top">
		<a href="/CampusOutSourcingSystem"> <span id="index" class="nav"> 首页 </span>
		</a>
		<s:set name="tag2" value="tag" />
		<s:if test="#tag2 == 2">
			<a href="addShops.jsp"><span class="nav" id="join">入驻加盟</span></a>
		</s:if>
		<s:else>
			<a href="merchantLogin.jsp"><span class="nav" id="join">入驻加盟</span></a>
		</s:else>
		<a href="#"> <span id="offer" class="nav"> 加入我们 </span>
		</a> <a href="#"> <span id="app_download" class="nav"> APP下载 </span>
		</a>
		<div id="top_logo">
			<img src="img/logo2.jpg" />
		</div>
	</div>
	<div id="center">
		<div class="center-nav">
			<div id="shop-info">
				<s:iterator value="list1">
					<div id="shop-details">
						<div id="shop-logo">
							<img src="<s:property value="logo"/>" alt="商店logo" />
						</div>
						<div id="shop-name">
							<h3>
								<s:property value="shopName" />
							</h3>
							<p id="addr">
								<s:property value="addr" />
							</p>
							<span> <img src="img/star-seleted.jpg" /> <img
								src="img/star-seleted.jpg" /> <img src="img/star-seleted.jpg" />
								<img src="img/star-seleted.jpg" /> <img
								src="img/star-seleted.jpg" />
							</span> <span>5.0</span>
						</div>
					</div>
				</s:iterator>
				<div class="favorite">
					<div class="tips">收藏本店</div>
					<a href="#"><i class="icon"></i></a>
				</div>
				<div class="send-info">
					<div class="tips">配送费</div>
					<div class="send-content">
						<strong>1</strong> <span>元</span>
					</div>
				</div>
				<div class="send-info">
					<div class="tips">起送</div>
					<div class="send-content">
						<strong>>0</strong> <span>元</span>
					</div>
				</div>
				<div class="send-info">
					<div class="tips">平均送餐时间</div>
					<div class="send-content">
						<strong>10</strong> <span>分钟</span>
					</div>
				</div>

			</div>
		</div>
		<div id="food-list">
			<div id="food-nav">
				<a href="#"><span class="nav-list nav-menu">菜单</span></a> <a
					href="#"><span class="nav-list">评价</span></a> <a href="#"><span
					class="nav-list">食品安全档案</span></a>
			</div>
			<div class="menu-content">
				<s:iterator value="list">
					<a class="menu-a" href="#<s:property value="gid" />"><s:property
							value="gname" /></a>
				</s:iterator>
			</div>
		</div>
		<div class="food-details">
			<div class="menu-title">美味面食</div>
			<s:iterator value="list">
				<div class="menu-img" id="<s:property value="gid" />">
					<img src="<s:property value="foodImg"/>" alt="铁板热干面" />
					<p>
						<s:property value="gname" />
					</p>
					<span>￥<s:property value="price" /></span> <a href="javascript:;"
						class="addcart"></a>
				</div>
			</s:iterator>
		</div>
	</div>
	<!--购物车开始-->
	<div class="shopping-cart">
		<form action="toPay" method="post" id="shopping-cart-form">
			<div class="shop-title">
				<div class="cart">购物车</div>
				<div class="clear">
					<a href="javascript:;">清空菜品</a>
				</div>
			</div>
			<ul>
				<li>
					<div class="shopping-info">
						<!-- 动态添加 -->
					</div>
				</li>
			</ul>
			<div class="shopping-price">
				共 <span class="price-info color">0</span> 份, 总计 <span
					class="price color">0.00</span>

			</div>
			<div id="footer">
				<span><img src="img/shopping-cart.jpg" alt="购物车" /></span> <input
					type="button" id="goBuyBtn" value="立即下单" />
			</div>
		</form>
	</div>
	<!--购物车结束-->
	<div id="bottom">
		<div id="bottom_a">
			<div id="bottom_left">
				<ul>
					<li><a href="#">常见问题</a></li>
					<li><a href="#">用户反馈</a></li>
					<li><a href="#">诚信举报</a></li>
					<li><a href="#">入驻加盟</a></li>
					<li><a href="#">加入我们</a></li>
				</ul>
				<ul>
					<li>友情链接:</li>
					<li><a href="http://wisec.huanghuai.edu.cn/index.jsp">校园地图</a>
					</li>
				</ul>
			</div>
			<div id="bottom_mid">
				<h2>品牌合作</h2>
				<p>w2500513053@outlook.com</p>
				<h2>客服电话</h2>
				<p>0375-329429</p>
			</div>
			<div id="bottom_right">
				<h2>手机APP</h2>
				<div>
					<img src="img/QR.png" alt="App二维码" />
				</div>
			</div>
		</div>
		<div id="bottom_icon">
			<span> ©校园外卖 hhwaimai.com </span> <span> <a href="">豫ICP证000001号</a></span>
			<span> <a href="">豫ICP备000002号</a></span> <span> <a href="">食品经营许可证</a></span>
		</div>
	</div>
</body>

</html>
