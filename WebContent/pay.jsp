<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/banner.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/pay.css" />
<link rel="shortcut icon" href="img/icon.ico">
<title>确认支付</title>
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
	<div id="title">
		<span class="dish-title">武汉热干面</span> <i> > </i> <span>确认购买</span>
	</div>
	<div id="center">
		<div class="left-menu">
			<div class="menu-list">
				<span class="menu-name font">菜品</span> <span class="menu-pri font">价格/份数</span>
			</div>

			<s:iterator value="goods">
				<div class="menu-list">
					<span class="menu-name"><s:property value="goodName" /></span> <span
						class="menu-pri">￥<s:property value="goodPrice" />*<s:property
							value="goodCount" /></span>
				</div>
			</s:iterator>

			<div class="menu-list">
				<span class="menu-name font">合计</span> <span class="menu-pri font">￥<s:property
						value="total" /></span>
			</div>
			<div class="menu-list foot-h">
				<span class="of-select"> <select name="offer"
					class="sele-list">
						<option value="选择优惠券">选择优惠券</option>
						<option value="选择优惠券">满10元减2元</option>
						<option value="选择优惠券">满20元减5元</option>
				</select>
				</span> <span class="preferential">优惠卷:</span>
			</div>
		</div>
		<form action="Pay" method="post">
			<div class="right-menu">
				<div class="right-list">
					<p>送餐详情</p>
					<a data-toggle="modal" data-target="#myModal">
						<div class="add-address">
							<i><img src="img/add-address-icon.png" /></i>添加新地址
						</div>
					</a>
					<div class="leave-message">
						<label for="message">给商家留言:</label> <input class="show-tags"
							type="text" name="cib.demand" id="leave-word"
							placeholder="不要香菜，多放辣等口味要求" />
					</div>
					<div class="order-tags" style="display: none;">
						<ul>
							<li><a class="tags" href="javascript:void(0);">别放辣</a></li>
							<li><a class="tags" href="javascript:void(0);">辣一点</a></li>
							<li><a class="tags" href="javascript:void(0);">米饭多一点</a></li>
							<li><a class="tags" href="javascript:void(0);">别放香菜</a></li>
							<li><a class="tags" href="javascript:void(0);">别放葱花</a></li>
							<li><a class="tags" href="javascript:void(0);">放点醋</a></li>
						</ul>
						<div class="tags-icon"></div>
					</div>
					<div class="pay-type">
						<label class="pay-tags">付款方式:</label> <a
							href="javascript:void(0);"><span class="type1">餐到付款</span></a> <a
							href="javascript:void(0);"><span class="type2">在线支付</span></a>
					</div>
				</div>
				<div class="pre-time">
					<span>期望送达时间:</span> <select name="pre-time">
						<option value="immediate">立即送出</option>
						<option value="seven">7:00</option>
						<option value="eight">8:00</option>
						<option value="nine">9:00</option>
						<option value="ten">10:00</option>
						<option value="eleven">11:00</option>
						<option value="twelve">12:00</option>
						<option value="thirteen">13:00</option>
						<option value="forteen">14:00</option>
					</select>
				</div>
				<div class="pay">
					<div class="pay-area">
						<span class="pay-tips">您需要支付</span> <span class="pay-info">￥<s:property
								value="total" /></span> <input type="submit" value="去付款" id="pay-btn">
					</div>
				</div>
			</div>
		</form>
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
	<!-- add address Modal-->
	<div id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">添加新地址</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="saveUserInfo" method="post" id="saveInfo">
						<div class="form-group">
							<span>*</span> <label style="margin-right: 28px;">联系人:</label> <input
								class="form-control" type="text" placeholder="联系人" id="username"
								name="cib.username" required="required">
						</div>
						<div class="option">
							<span>*</span> <input type="radio" name="sex" id="male"
								value="先生" /> <label for="male">先生</label> <input type="radio"
								name="sex" id="female" value="女士" /> <label for="female">女士</label>
						</div>
						<div class="form-group">
							<span>*</span> <label>手机号码:</label> <input class="form-control"
								type="tel" placeholder="手机号" id="tel" name="cib.telphone"
								required="required">
						</div>
						<div class="form-group">
							<span>*</span> <label>收餐地址:</label> <input class="form-control"
								type="text" placeholder="详细地址" id="addr" name="cib.address"
								required="required">
						</div>
						<div class="modal-footer">
							<div style="margin: 0 auto;">
								<input type="button" data-dismiss="modal"
									class="btn btn-secondary" value="取消" /> <input type="button"
									class="btn btn-primary" value="保存" id="save" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--import js-->
	<script src="jquery/jquery.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="js/pay.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>