<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>我的店铺</title>
		<meta name="description" content="">
		<meta name="robots" content="all,follow">
		<!-- Bootstrap CSS-->
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<!-- Font Awesome CSS-->
		<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
		<!-- Fontastic Custom icon font-->
		<link rel="stylesheet" href="css/fontastic.css">
		<!-- Google fonts - Poppins -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
		<!-- theme stylesheet-->
		<link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
		<!-- Custom stylesheet - for your changes-->
		<link rel="stylesheet" href="css/custom.css" type="text/css">
		<!-- Favicon-->
		<link rel="shortcut icon" href="img/icon.ico">
	</head>

	<body>
		<div class="page">
			<!-- Main Navbar-->
			<header class="header">
				<nav class="navbar">
					<!-- Search Box-->
					<div class="search-box">
						<button class="dismiss"><i class="icon-close"></i></button>
						<form id="searchForm" action="#" role="search">
							<input type="search" placeholder="What are you looking for..." class="form-control">
						</form>
					</div>
					<div class="container-fluid">
						<div class="navbar-holder d-flex align-items-center justify-content-between">
							<!-- Navbar Header-->
							<div class="navbar-header">
								<!-- Navbar Brand -->
								<a href="#" class="navbar-brand d-none d-sm-inline-block">
									<div class="brand-text d-none d-lg-inline-block"><strong>我的店铺</strong></div>
								</a>
								<!-- Toggle Button-->
								<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
							</div>
							<!-- Navbar Menu -->
							<ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
								<!-- Notifications-->
								<li class="nav-item dropdown">
									<a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner">12</span></a>
									<ul aria-labelledby="notifications" class="dropdown-menu">
										<li>
											<a rel="nofollow" href="#" class="dropdown-item">
												<div class="notification">
													<div class="notification-content"><i class="fa fa-envelope bg-green"></i>You have 6 new messages </div>
													<div class="notification-time"><small>4 minutes ago</small></div>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item">
												<div class="notification">
													<div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
													<div class="notification-time"><small>4 minutes ago</small></div>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item">
												<div class="notification">
													<div class="notification-content"><i class="fa fa-upload bg-orange"></i>Server Rebooted</div>
													<div class="notification-time"><small>4 minutes ago</small></div>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item">
												<div class="notification">
													<div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
													<div class="notification-time"><small>10 minutes ago</small></div>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>view all notifications                                            </strong></a>
										</li>
									</ul>
								</li>
								<!-- Messages                        -->
								<li class="nav-item dropdown">
									<a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-envelope-o"></i><span class="badge bg-orange badge-corner">10</span></a>
									<ul aria-labelledby="notifications" class="dropdown-menu">
										<li>
											<a rel="nofollow" href="#" class="dropdown-item d-flex">
												<div class="msg-profile"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
												<div class="msg-body">
													<h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item d-flex">
												<div class="msg-profile"> <img src="img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
												<div class="msg-body">
													<h3 class="h5">Frank Williams</h3><span>Sent You Message</span>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item d-flex">
												<div class="msg-profile"> <img src="img/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
												<div class="msg-body">
													<h3 class="h5">Ashley Wood</h3><span>Sent You Message</span>
												</div>
											</a>
										</li>
										<li>
											<a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>Read all messages   </strong></a>
										</li>
									</ul>
								</li>
								<!-- Logout    -->
								<li class="nav-item">
									<a href="merchantLogin.jsp" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</header>
			<div class="page-content d-flex align-items-stretch">
				<!-- Side Navbar -->
				<nav class="side-navbar">
					<!-- Sidebar Header-->
					<div class="sidebar-header d-flex align-items-center">
						<div class="avatar">
							<img src="img/20.jpg" alt="..." class="img-fluid rounded-circle">
						</div>
						<s:iterator value="list1">
						<div class="title">
							<h1 class="h4"><s:property value="shopName"/></h1>
							<p><s:property value="addr"/></p>
						</div>
						</s:iterator>
					</div>
					<!-- Sidebar Navidation Menus--><span class="heading">Main</span>
					<ul class="list-unstyled">
						<li class="active">
							<a href="addShops.jsp"> <i class="icon-home"></i>编辑店铺</a>
						</li>
						<li>
							<a href="editShop?"> <i class="fa fa-gears" style="font-size:12px;"></i>管理商品</a>
						</li>
						<li>
							<a href="#"> <i class="icon-grid"></i>店铺评价 </a>
						</li>
						<li>
							<a href="#"> <i class="fa fa-bar-chart"></i>店铺收入状况 </a>
						</li>
					</ul>
				</nav>
				<div class="content-inner">
					<!-- Page Header-->
					<header class="page-header">
						<div class="container-fluid">
							<h2 class="no-margin-bottom">编辑店铺</h2>
						</div>
					</header>
					<!-- Breadcrumb-->
					<div class="breadcrumb-holder container-fluid">
						<ul class="breadcrumb">
							<li class="breadcrumb-item">
								<a href="/CampusOutSourcingSystem">Home</a>
							</li>
							<li class="breadcrumb-item active">编辑店铺 </li>
						</ul>
					</div>
					<!-- Updata/Add info-->
					<div class="forms">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header d-flex align-items-center">
									<h3 class="h4">完善店铺信息</h3>
								</div>
								<div class="card-body">
									<form class="form-horizontal" action="insertShops" method="post" enctype="multipart/form-data">
										<div class="form-group row">
											<label class="col-sm-3 form-control-label">店铺名称</label>
											<div class="col-sm-5">
												<input type="text" class="form-control" placeholder="店铺名称" name="sa.shopName">
											</div>
											<div class="col-sm-4">
												<input type="text" class="form-control" placeholder="类型：美食、快餐、超市、水果、饮料" name="sa.type">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 form-control-label">店铺logo</label>
											<div class="col-sm-9">
												<input type="file" class="form-control-file" style="width: 40%;" name="logo">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-3 form-control-label">店铺地址</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" placeholder="xx餐厅x楼xx号窗口" name="sa.addr">
											</div>
										</div>
										<div class="food-info">
											<div class="form-group row">
												<label class="col-sm-3 form-control-label">添加商品</label>
												<div class="col-sm-9">
													<div class="row">
														<div class="col-md-3">
															<input type="text" placeholder="商品名称" class="form-control" name="gname">
														</div>
														<div class="col-md-4">
															<input type="text" placeholder="商品价格" class="form-control" name="price">
														</div>
													</div>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 form-control-label">商品logo</label>
												<div class="col-sm-9">
													<input type="file" class="form-control-file" style="width: 40%;" name="foodImg">
												</div>
											</div>
										</div>
										<a href="javascript:;" class="add-food">
											<div class="add-food"><i class="fa fa-plus" aria-hidden="true"></i>再添加一个商品</div>
										</a>
										<div class="line"></div>
										<div class="form-group row">
											<div class="col-sm-4 offset-sm-3" style="margin: auto;">
												<button type="reset" class="btn btn-secondary">取消</button>
												<button type="submit" class="btn btn-primary">提交</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- Page Footer-->
					<footer class="main-footer">
						<div class="container-fluid">
							<div class="row end-font">
								<div class="col-sm-6">
									<span>&copy;校园外卖 hhwaimai.com</span>
								</div>
								<div class="col-sm-6 text-right">
									<span><a href="">豫ICP证000001号</a></span>
									<span><a href="">豫ICP备000002号</a></span>
									<span><a href="">食品经营许可证</a></span>
								</div>
							</div>
						</div>
					</footer>
				</div>
			</div>
		</div>
		<!-- JavaScript files-->
		<script src="jquery/jquery.min.js"></script>
		<script src="popper.js/umd/popper.min.js">
		</script>
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="jquery.cookie/jquery.cookie.js">
		</script>
		<script src="chart.js/Chart.min.js"></script>
		<script src="jquery-validation/jquery.validate.min.js"></script>
		<!-- Main File-->
		<script src="js/front.js"></script>
		<script type="text/javascript">
			let addFood = document.querySelector(".add-food");
			let formHorizontal = document.querySelector(".form-horizontal");
			addFood.onclick = function() {
				let foodDiv = $(".food-info").clone();
				formHorizontal.insertBefore(foodDiv[0], addFood);
			}
		</script>
	</body>

</html>