<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商家入驻-注册</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/fontastic.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="shortcut icon" href="img/icon.ico">
  </head>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>欢迎您入驻本站！</h1>
                  </div>
                  <p>本站的优惠条件保证让您满意。</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form class="form-validate" action="merchantRegister" method="post">
                    <div class="form-group">
                      <input id="register-username" type="text" name="ua.uname" required data-msg="请输入您的店名" class="input-material">
                      <label for="register-username" class="label-material">用户名</label>
                    </div>
                    <div class="form-group">
                      <input id="register-email" type="tel" name="ua.uid" required data-msg="请输入您的手机号" class="input-material">
                      <label for="register-email" class="label-material">手机号</label>
                    </div>
                    <div class="form-group">
                      <input id="register-password" type="password" name="ua.pswd" required data-msg="请输入您的密码" class="input-material">
                      <label for="register-password" class="label-material">密码</label>
                    </div>
                    <div class="form-group terms-conditions">
                      <input id="register-agree" name="registerAgree" type="checkbox" required value="1" data-msg="Your agreement is required" class="checkbox-template">
                      <label for="register-agree">同意条款和政策</label>
                    </div>
                    <div class="form-group">
                      <button id="regidter" type="submit" name="registerSubmit" class="btn btn-primary">注册</button>
                    </div>
                  </form><small>已经有账号？</small><a href="merchantLogin.jsp" class="signup">登录</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="jquery/jquery.min.js"></script>
    <script src="popper.js/umd/popper.min.js"> </script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="jquery.cookie/jquery.cookie.js"> </script>
    <script src="chart.js/Chart.min.js"></script>
    <script src="jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>