<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="css/register_login.css" />
<link rel="shortcut icon" href="img/icon.ico">
<link rel="icon" href="img/icon.ico">
</head>

<body>
	<div id="registe_login">
		<span>已有账号？</span> <a href="login.jsp"><button>登录</button></a>
	</div>
	<div id="logo">
		<img src="img/logo2.jpg" />
	</div>
	<div id="content">
		<form action="register" method="post">
			<!-- 用户的Id模块 -->
			<section class="input">
				<input type="text" id="account_number" name="ua.uid"
					placeholder="账号(学号)" required="required" autofocus/>
				<!-- <button disabled="disabled" class="get_code">获取验证码</button> -->
			</section>
			<!-- 用户的昵称模块 -->
			<section class="input">
				<input type="text" id="input_code" name="ua.uname" placeholder="昵称" required="required"/>
			</section>
			<!-- 用户的密码模块 -->
			<section class="input">
				<input type="password" id="account_password" name="ua.pswd"
					placeholder="密码" required="required"/>
			</section>
			<input type="submit" value="注册" class="submit" />
		</form>
	</div>
	<hr style="margin-top: 50px;" />
	<div class="foot">
		<span> ©校园外卖 hhwaimai.com&nbsp;| </span> <span> <a href="">豫ICP证000001号&nbsp;|</a></span>
		<span> <a href="">豫ICP备000002号&nbsp;|</a></span> <span> <a
			href="">食品经营许可证</a></span>
	</div>
</body>

</html>