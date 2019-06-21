<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<link rel="shortcut icon" href="img/icon.ico">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>admin登录</title>
		<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css"/>

	</head>

	<body class="login-page sidebar-collapse">
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
			<div class="container">
				<div class="collapse navbar-collapse justify-content-end" data-nav-image="img/blurred-image-1.jpg">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="index.jsp">返回首页</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">有问题吗？</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="page-header" filter-color="orange">
			<div class="page-header-image" style="background-image:url(img/login.jpg)"></div>
			<div class="container">
				<div class="col-md-4 content-center">
					<div class="card card-login card-plain">
						<form class="form" method="post" action="login">
							<div class="header header-primary text-center">
								<div class="logo-container">
									<img src="img/now-logo.png" alt="logo">
								</div>
							</div>
								<div class="content">
									<div class="input-group form-group-no-border input-lg">
										<span class="input-group-addon">
                                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                </span>
										<input type="text" class="form-control" placeholder="账号" name="ua.uid" required="required">
									</div>
									<div class="input-group form-group-no-border input-lg">
										<span class="input-group-addon">
                                    <i class="fa fa-text-height" aria-hidden="true"></i>
                                </span>
										<input type="password" placeholder="密码" class="form-control" name="ua.pswd" required="required"/>
									</div>
								</div>
								<div class="footer text-center">
									<input type="submit" class="btn btn-primary btn-round btn-lg btn-block" value="登录"/>
								</div>
							<div class="pull-left">
								<h6>
                                <a href="masterRegister.jsp" class="link">创建账户</a>
                           		</h6>
							</div>
							<div class="pull-right">
								<h6>
                                <a href="#" class="link">需要帮助？</a>
                            	</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>