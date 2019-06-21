<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8" />
<title>菜单</title>
<link rel="shortcut icon" href="img/icon.ico">
<link rel="icon" href="img/icon.ico">
<link rel="stylesheet" type="text/css" href="css/details.css" />
<link rel="stylesheet" type="text/css" href="css/banner.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
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
		<div id="center_top">
			<div id="zone">
				<i></i> <span> <s:property value="rName" />
				</span>
				<form action="findByrName" method="post"
					style="display: inline-block;">
					<select name="rName" class="select">
						<option value="lh">龙湖餐厅</option>
						<option value="ry">榕苑餐厅</option>
						<option value="bx">北区新餐厅</option>
						<option value="zx">中区新餐厅</option>
					</select>
				</form>
			</div>
			<div id="order">
				<i></i> <a href="myOrder?"><span>订单任务</span></a>
			</div>
			<div>
				<a href="register.jsp">注册</a>
			</div>
			<div>
				<a href="login.jsp">登录</a>
			</div>
		</div>
		<div id="sort_list">
			<span id="sort"> 商家分类 </span> <a
				href="findByrName?rName=<s:property value="rName" />"><span
				id="list">全部</span></a> <a
				href="findGoodsByType?type=美食&rName=<s:property value="rName" />"><span
				class="_list">美食</span></a> <a
				href="findGoodsByType?type=快餐&rName=<s:property value="rName" />"><span
				class="_list">快餐</span></a> <a
				href="findGoodsByType?type=超市&rName=<s:property value="rName" />"><span
				class="_list">超市</span></a> <a
				href="findGoodsByType?type=水果&rName=<s:property value="rName" />"><span
				class="_list">水果</span></a> <a
				href="findGoodsByType?type=饮料&rName=<s:property value="rName" />"><span
				class="_list">饮料</span></a>
			<form action="searchByName" method="post" class="search">
				<input type="submit" value="Search" id="search_btn" /> <input
					type="text" id="search" name="sa.shopName" placeholder="搜素商家、美食" />
			</form>
		</div>
		<div id="center_content">
			<div class="shop_wrap">
				<s:iterator value="list1">
					<a
						href="findGoodsByShopName?shopName=<s:property value="shopName" />">
						<div class="shop_info">
							<div class="img">
								<img src="<s:property value="logo"/>" alt="加载图片中..." />
							</div>
							<div class="food_info">
								<p>
									<s:property value="shopName" />
								</p>
								<div class="send">
									<span class="send_info">起送:￥0</span> <span class="send_info">配送费:￥1</span>
									<span class="send_info time">10分钟</span>
								</div>
							</div>
						</div>
					</a>
				</s:iterator>
			</div>
		</div>
	</div>
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
	<script src="js/jquery-2.1.4.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/filterByRname.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>