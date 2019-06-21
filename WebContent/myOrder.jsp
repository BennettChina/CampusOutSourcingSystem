<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<link rel="shortcut icon" href="img/icon.ico">
<link rel="stylesheet" type="text/css" href="css/banner.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/task.css">
</head>
<body>
	<div id="top">
		<a href="/CampusOutSourcingSystem"> <span id="index" class="nav">
				首页 </span>
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
		<div class="card">
			<div class="card-body">
				<h4 class="card-title">待审核商家</h4>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>商品logo</th>
							<th>商品名</th>
							<th>数量</th>
							<th>价格</th>
							<th>商家</th>
							<th>收件地址</th>
							<th>时间</th>
							<th>收件人</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list">
							<tr>
								<td class="py-1"><img alt="商品logo" width="20" height="20"
									src="<s:property value="foodImg"/>"></td>
								<td><s:property value="goodName" /></td>
								<td><s:property value="goodCount" /></td>
								<td><s:property value="goodPrice" /></td>
								<td><s:property value="shopName" /></td>
								<td><s:property value="address" /></td>
								<td><s:property value="time" /></td>
								<td><s:property value="username" /></td>
								<td><s:property value="status" /></td>
								<td><a href="received?id=<s:property value="id"/>">收件</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
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
</body>
</html>