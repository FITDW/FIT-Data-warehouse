<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>FIT Data Warehouse Login</title>
	
    <style>


	body {
		margin: 0;
		padding: 0;
		background: #fff;
		color: #fff;
		font-family: Arial;
		font-size: 12px;
	}
	h3{
		color: red;
	}
	
	.body {
		position: absolute;
		top: -20px;
		left: -20px;
		right: -20px;
		bottom: -20px;
		width: auto;
		height: auto;
		background-image: url(images/bg/itkmitlbg.jpg);
		background-size: cover;
		-webkit-filter: blur(5px);
		z-index: 0;
	}
	.grad {
		position: absolute;
		top: -20px;
		left: -20px;
		right: -40px;
		bottom: -40px;
		width: auto;
		height: auto;
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0,0,0,0)), color-stop(100%, rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
		z-index: 1;
		opacity: 0.7;
	}
	
	.header div {
		float: left;
		color: #fff;
		font-family: 'Exo', sans-serif;
		font-size: 35px;
		font-weight: 200;
	}
	.header div span {
		color: #5379fa !important;
	}
	.login {
		position: absolute;
		top: calc(50% - 75px);
		left: calc(50% - 180px);
		
		height: 150px;
		width: 350px;
		padding: 10px;
		z-index: 2;
	}
	.loginlogo {
		position: absolute;
		top: calc(50% - 250px);
		left: calc(50% - 180px);
		height: 150px;
		width: 350px;
		padding: 10px;
		z-index: 2;
	}
	
	.login input[type=text] {
		width: 310px;
		height: 35px;
		padding-left: 45px;
		background: transparent;
		border: 2px solid #fff;
		border-radius: 2px;
		color: #fff;
		font-family: 'Exo', sans-serif;
		font-size: 20px;
		font-weight: 400;
		
	}
	.login input[type=password] {
		width: 310px;
		height: 35px;
		padding-left: 45px;
		background: transparent;
		border: 2px solid #fff;
		border-radius: 2px;
		color: #fff;
		font-family: 'Exo', sans-serif;
		font-size: 20px;
		font-weight: 400;
		
	}
	.login input[type=submit] {
		width: 357px;
		height: 35px;
		background: #72b5e6;
		border: 2px solid #fff;
		cursor: pointer;
		border-radius: 2px;
		color: #fff;
		font-family: 'Exo', sans-serif;
		font-size: 16px;
		font-weight: 400;
		padding: 6px;
		
	}
	.login input[type=submit]:hover {
		
		opacity: 0.8;
	}
	.login input[type=submit]:active {
		
		opacity: 0.6;
	}
	.login input[type=text]:focus {
		outline: none;
		padding-left: 45px;
		border: 2px solid #e2f1fa;
	}
	.login input[type=password]:focus {
		outline: none;
		padding-left: 45px;
		border: 2px solid #e2f1fa;		    
	}
	.login input[type=submit]:focus {
		outline: none;
		
	}

	::-webkit-input-placeholder {
		 padding-left:0px;
		 color: rgb(255,255,255);
	}

	::-moz-input-placeholder {
		 padding-left:0px;
		 color: rgb(255,255,255);
	}
	.iconuser{
	background: url(images/icon/icon_user.png) no-repeat;
	padding: 0px 4px 4px 0px;
	}
	.iconpass{
	background: url(images/icon/icon_password.png) no-repeat;
	padding: 0px 4px 4px 0px;
	}
	
	
</style>

</head>
<body>

<div class="body"></div>
<div class="grad"></div>
<div class="header">  </div>
<br>
<div class="login-container">
<div class="loginlogo"><img src="images/logo/ITDW_logo.png" width="350" height="160"></div>
<form name="loginform"  action="loginServlet" method="post">
	<div class="login">
	  <div class="iconuser">
      <input type="text" placeholder="username" id="username" name="txt_username">
      </div>
      <br>
      <div class="iconpass">
      <input type="password" placeholder="password" id="password" name="txt_password" >
      </div>
      <br>
      
        <c:if test="${sessionScope.loginStatus=='false'}">
			<h3>Invalid User ID or Password.Try again</h3>
		</c:if>     	
  <input type="submit" value="Login" >
  
	</div>
</div>

</form>


</body>
</html>
