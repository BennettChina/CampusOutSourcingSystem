<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>黄淮校园外卖Admin</title>
		<link rel="stylesheet" href="css/materialdesignicons.min.css">
		<link rel="stylesheet" href="css/vendor.bundle.base.css">
		<link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="css/style.css">
		<link rel="shortcut icon" href="img/icon.ico" />
	</head>

	<body>
		<div class="container-scroller">
			<!-- 顶部导航-->
			<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
				<div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
					黄淮校园外卖
				</div>
				<div class="navbar-menu-wrapper d-flex align-items-stretch">
					<div class="search-field d-none d-md-block">
						<form class="d-flex align-items-center h-100" action="searchShops" method="post">
							<div class="input-group">
								<div class="input-group-prepend bg-transparent">
									<i class="fa fa-search search-field" aria-hidden="true"></i>
								</div>
								<input type="search" class="form-control bg-transparent border-0" placeholder="搜索商家" name="sa.shopName">
							</div>
						</form>
					</div>
					<ul class="navbar-nav navbar-nav-right">
						<li class="nav-item nav-logout d-none d-lg-block">
							<a class="nav-link" href="masterLogin.jsp" title="退出系统">
								<i class="fa fa-power-off" aria-hidden="true"></i>
							</a>
						</li>
					</ul>
					<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
				</div>
			</nav>
			<!-- 顶部以下内容 -->
			<div class="container-fluid page-body-wrapper">
				<!-- 左边列表-->
				<nav class="sidebar sidebar-offcanvas" id="sidebar">
					<ul class="nav">
						<li class="nav-item nav-profile">
							<a href="#" class="nav-link">
								<div class="nav-profile-text d-flex flex-column">
									<span class="font-weight-bold mb-2"><s:property value="username"/></span>
									<span class="text-secondary text-small">admin</span>
								</div>
								<i class="fa fa-check-circle" aria-hidden="true" style="margin-left: 117px;color: #1bcfb4;"></i>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="reviewShops?">
								<span class="menu-title">审核商家</span>
								<i class="fa fa-home" aria-hidden="true" style="margin-left: 117px;"></i>
							</a>
						</li>
						<li class="nav-item" style="background-color:lavender;">
							<a class="nav-link" href="reviewGoods?">
								<span class="menu-title" >审核商品</span>
								<i class="fa fa-gears" aria-hidden="true" style="margin-left: 117px;font-size:12px;"></i>
							</a>
						</li>
					</ul>
				</nav>
				<!-- 内容 -->
				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">待审核商品</h4>
										<table class="table table-striped">
											<thead>
												<tr>
													<th>
														商品名
													</th>
													<th>
														图片
													</th>
													<th>
														价格
													</th>
													<th>
														状态
													</th>
													<th>
														通过审核
													</th>
													<th>
														删除商品
													</th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="list">
													<tr>
														<td>
															<s:property value="gname"/>
														</td>
														<td class="py-1">
															<img src="<s:property value="foodImg"/>" alt="image" />
														</td>
														<td>
															<s:property value="price"/>
														</td>
														<td>
															<s:property value="state"/>
														</td>
														<td>
															<a href="allowGood?gid=<s:property value="gid"/>">准许</a>
														</td>
														<td>
															<a href="deleteGood?gid=<s:property value="gid"/>">删除</a>
														</td>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							<div class="col-lg-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">已推荐商品</h4>
										<table class="table table-striped">
											<thead>
												<tr>
													<th>
														商品名
													</th>
													<th>
														图片
													</th>
													<th>
														价格
													</th>
													<th>
														状态
													</th>
													<th>
														移除推荐
													</th>
													<th>
														删除商品
													</th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="goods">
													<tr>
														<td>
															<s:property value="gname"/>
														</td>
														<td class="py-1">
															<img src="<s:property value="foodImg"/>" alt="image" />
														</td>
														<td>
															<s:property value="price"/>
														</td>
														<td>
															<s:property value="state"/>
														</td>
														<td>
															<a href="remove?gid=<s:property value="gid"/>">移除</a>
														</td>
														<td>
															<a href="deleteGood?gid=<s:property value="gid"/>">删除</a>
														</td>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							
							<!-- 底部内容 -->
							<footer class="footer">
								<div class="d-sm-flex justify-content-center justify-content-sm-between">
									<span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2019 <a href="#" target="_blank">黄淮校园外卖</a></span>
								</div>
							</footer>
							<!-- partial -->
						</div>
						<!-- main-panel ends -->
					</div>
					<!-- page-body-wrapper ends -->
				</div>
	<!-- js模块 -->
	<script src="js/vendor.bundle.base.js"></script>
	<script src="js/vendor.bundle.addons.js"></script>
	<script src="js/off-canvas.js"></script>
	<script src="js/misc.js"></script>
	</body>
</html>