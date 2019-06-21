<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/banner.css" />
		<link rel="stylesheet" type="text/css" href="css/bottom.css" />
		<link rel="stylesheet" type="text/css" href="css/task.css" />
		<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="shortcut icon" href="img/icon.ico">
		<link rel="icon" href="img/icon.ico">
		<title>订单任务</title>
	</head>

	<body>
		<div id="top">
			<a href="/CampusOutSourcingSystem">
				<span id="index" class="nav">
					首页
				</span>
			</a>
			<s:set name="tag2" value="tag" />
			<s:if test="#tag2 == 2">
				<a href="addShops.jsp"><span class="nav" id="join">入驻加盟</span></a>
			</s:if>
			<s:else>
				<a href="merchantLogin.jsp"><span class="nav" id="join">入驻加盟</span></a>
			</s:else>
			<a href="#">
				<span id="offer" class="nav">
					加入我们
				</span>
			</a>
			<a href="#">
				<span id="app_download" class="nav">
					APP下载
				</span>
			</a>
			<div id="top_logo">
				<img src="img/logo2.jpg" />
			</div>
		</div>

		<div id="center">
			<div id="order-list">
				<span id="sort">
					排序方式
				</span>
				<a href="sortByTime?time=desc"><span class="list" >发布时间↓</span></a>
				<a href="sortByTime?time=asc"><span class="_list" >发布时间↑</span></a>
				<form action="filterByRname" method="post" id="select-addr">
					<select name="select" class="select">
						<option value="all">全部餐厅</option>
						<option value="lh">龙湖餐厅</option>
						<option value="ry">榕苑餐厅</option>
						<option value="bx">北区新餐厅</option>
						<option value="zx">中区新餐厅</option>
					</select>
				</form>
				<form action="search" method="post" class="search">
					<input type="submit" value="Search" id="search_btn" />
					<input type="text" id="search" placeholder="搜素商家、发布者" name="cib.username"/>
				</form>
			</div>
			<div class="task-list">
				<ul>
				<s:iterator value="list">
					<li class="task-li">
						<div class="task-title">
							<span class="begin-addr"><s:property value="addr"/></span>
							<span>➡</span>
							<span class="end-addr"><s:property value="address"/></span>							
						</div>
						<div class="task-info">
							<i class="fa fa-user" aria-hidden="true"></i>
							<span class="task-author"><s:property value="username"/></span>
							<i class="fa fa-clock-o" aria-hidden="true"></i>
							<span class="task-see"><s:property value="time"/></span>
						</div>
						<p class="task-content">
						<s:set name="uid" value="id" />
						<s:iterator value="goods">
							<s:if test="%{id==#uid}">
								<s:property value="goodName"/>*
								<s:property value="goodCount"/>
							</s:if>
						</s:iterator>
						</p>
						<div class="accept-task">
							<input type="button" value="接受" class="accept-task-btn"/>
						</div>
					</li>
				</s:iterator>
				</ul>
			</div>
		</div>
		<div id="bottom">
			<div id="bottom_a">
				<div id="bottom_left">
					<ul>
						<li>
							<a href="#">常见问题</a>
						</li>
						<li>
							<a href="#">用户反馈</a>
						</li>
						<li>
							<a href="#">诚信举报</a>
						</li>
						<li>
							<a href="#">入驻加盟</a>
						</li>
						<li>
							<a href="#">加入我们</a>
						</li>
					</ul>
					<ul>
						<li>友情链接:</li>
						<li>
							<a href="http://wisec.huanghuai.edu.cn/index.jsp">校园地图</a>
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
					<div><img src="img/QR.png" alt="App二维码" /></div>
				</div>
			</div>
			<div id="bottom_icon">
				<span>
					©校园外卖 hhwaimai.com
				</span>
				<span>
					<a href="">豫ICP证000001号</a></span>
				<span>
					<a href="">豫ICP备000002号</a></span>
				<span>
					<a href="">食品经营许可证</a></span>
			</div>
		</div>
		<script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$('.accept-task-btn').click(function(){
					alert("接收任务成功，请尽快配送，谢谢合作！");
					let name = $(this).parents('.task-li').find('.task-author').text().trim();
					window.location.href="./acceptTask?name="+name;
				});
				
				$(".select").change(function(){
					let str = $('select.select option:selected').val();
					let info = $('select.select option:selected').text();
					switch(str){
					case 'lh':
					case 'ry':
					case 'bx':
					case 'zx':
						window.location.href="./filterByRname?rName="+info;
					}
				});
			})
		</script>
	</body>

</html>