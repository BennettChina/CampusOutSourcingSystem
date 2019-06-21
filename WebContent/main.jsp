<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
<title>校园外卖</title>
<link rel="shortcut icon" href="img/icon.ico">
<link rel="icon" href="img/icon.ico">
</head>
<body>
	<!--顶部logo-->
	<div id="logo">
		<img src="img/logo3.jpg" />
	</div>
	<!--头部 begin-->
	<div id="top">
		<!--用户登录显示-->
		<div class="user-info">
			<i class="fa fa-user-circle fa-2x user-icon" aria-hidden="true"></i>
			<span class="user"><a href="login.jsp"><s:property value="username"/></a></span>
		</div>
		<!--公告-->
		<div id="announcement">
			公告：<span><s:property value="announcement"/></span>
		</div>
		<!--APP下载-->
		<div id="app_download">
			<input type="button" id="app" value="APP下载" class="app" />
			<div id="app_QR">
				<p>扫码下载手机APP</p>
				<img src="img/QR.png" />
			</div>
		</div>
		<div id="re_log_join">
			<!--注册-->
			<div id="register">
				<a href="register.jsp">注册</a>
			</div>
			<!--登录-->
			<div id="login">
				<a href="login.jsp">登录</a>
			</div>
			<div id="join">
			<s:set name="tag2" value="tag"/>
			<s:if test="#tag2 == 2">
				<a href="addShops.jsp">入驻加盟</a>
			</s:if>
			<s:else>
				<a href="merchantLogin.jsp">入驻加盟</a>
			</s:else>
			</div>
		</div>

	</div>
	<!--头部 end-->
<div style="overflow:hidden;">
	<!--内容_左侧 begin-->
	<!--餐厅分区-->
	<div id="left">
		<div id="left_zone">
			<h4 class="title">餐厅分区</h4>
			<ul class="task">
				<a href="findGoodsByrId?rId=1">
					<li class="target">龙湖餐厅</li>
				</a>
				<a href="findGoodsByrId?rId=2">
					<li class="list">榕苑餐厅</li>
				</a>
				<a href="findGoodsByrId?rId=3">
					<li class="list">北区新餐厅</li>
				</a>
				<a href="findGoodsByrId?rId=4">
					<li class="list">中区新餐厅</li>
				</a>
			</ul>
		</div>
		<!--订单任务-->
		<div id="left_task">
			<h4 class="title">订单任务</h4>
			<ul class="task">
				<a href="goTask">
					<li class="target">1~12号寝室楼</li>
				</a>
				<a href="goTask">
					<li class="list">13~24号寝室楼</li>
				</a>
				<a href="goTask">
					<li class="list">1~3号教学楼</li>
				</a>
				<a href="goTask">
					<li class="list">综合楼</li>
				</a>
				<a href="goTask">
					<li class="list">创业园</li>
				</a>
				<a href="goTask">
					<li class="list">6~8号及12号教学楼</li>
				</a>
				<a href="goTask">
					<li class="list">9~11号教学楼</li>
				</a>
			</ul>
		</div>
	</div>
	<!--内容_左侧 end-->
	<!--内容_中间 begin-->
	<div class="content">
		<h4 class="title">推荐菜品：</h4>
		<div class="div1">
			<s:iterator value="list">
				<div class="menu">
					<a href="findGoodsBycId?cId=<s:property value="cid" />">
						<div id="shadow">
							<div id="shadow_content">
								<s:property value="gname" />
							</div>
						</div> <img src="<s:property value="foodImg"/>" alt="加载图片中..." class="img" />
					</a>

					<div class="tips">
						<div class="name" title="<s:property value="shopName" />">
							<s:property value="shopName" />
						</div>
						<div class="sec_name" title="<s:property value="gname" />">
							<s:property value="gname" />
						</div>
						<div class="price">
							<span class="new_price"></span> <span class="price_logo">¥</span>
							<span class="price_number"> <s:property value="price" />
							</span> <span class="old_price"></span> <span class="address"></span>
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
	</div>
	<!--内容_中间 end-->
	<!--<hr style="margin-top:50px ;"/>-->
	<!--网页foot begin-->
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
					<li><a href="http://wisec.huanghuai.edu.cn/index.jsp">校园地图</a></li>
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
	<!--网页foot end-->
	<!-- js模块 -->
	<script src="./js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			$('join-a').click(function(){
				
			})
		})
	</script>
</body>
</html>