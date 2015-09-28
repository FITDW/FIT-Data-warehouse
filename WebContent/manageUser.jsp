<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
h3#green {
	color: green;
}

h3#red {
	color: red;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FIT Data Warehouse</title>
<meta name="author" content="SuggeElson" />
<meta name="description"
	content="Supr admin template - new premium responsive admin template. This template is designed to help you build the site administration without losing valuable time.Template contains all the important functions which must have one backend system.Build on great twitter boostrap framework" />
<meta name="keywords"
	content="admin, admin template, admin theme, responsive, responsive admin, responsive admin template, responsive theme, themeforest, 960 grid system, grid, grid theme, liquid, masonry, jquery, administration, administration template, administration theme, mobile, touch , responsive layout, boostrap, twitter boostrap" />
<meta name="application-name" content="Supr admin template" />

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Force IE9 to render in normla mode -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Le styles -->



<!-- Core stylesheets do not remove -->
<link id="bootstrap" href="css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="css/bootstrap/bootstrap-theme.css" rel="stylesheet"
	type="text/css" />
<link href="css/supr-theme/jquery.ui.supr.css" rel="stylesheet"
	type="text/css" />
<link href="css/icons.css" rel="stylesheet" type="text/css" />

<!-- Plugin stylesheets -->
<link href="plugins/misc/qtip/jquery.qtip.css" rel="stylesheet"
	type="text/css" />

<link href="plugins/forms/uniform/uniform.default.css" type="text/css"
	rel="stylesheet" />

<!-- Main stylesheets -->
<link href="css/main.css" rel="stylesheet" type="text/css" />

<!-- Custom stylesheets ( Put your own changes here ) -->
<link href="css/custom.css" rel="stylesheet" type="text/css" />



<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/apple-touch-icon-144-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/apple-touch-icon-114-precomposed.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/apple-touch-icon-72-precomposed.png" />
<link rel="apple-touch-icon-precomposed"
	href="images/apple-touch-icon-57-precomposed.png" />

<!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
<meta name="application-name" content="Supr" />
<meta name="msapplication-TileColor" content="#3399cc" />

<!-- Load modernizr first -->
<script type="text/javascript" src="js/libs/modernizr.js"></script>

</head>

<body>

	<!-- loading animation -->
	<div id="qLoverlay"></div>
	<div id="qLbar"></div>

	<div id="header">
		<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp"><img
				src="images\logo\ITDW_logo_Small.png"></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon16 icomoon-icon-arrow-4"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">

			</ul>

			<ul class="nav navbar-right usernav">
				<li class="dropdown">

					<ul class="dropdown-menu">
						<li class="menu">
							<ul class="notif">

							</ul>
						</li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle avatar"
					data-toggle="dropdown"> <img src="images/avatar.png" alt=""
						class="image" /> <span class="txt">${sessionScope.username}</span><b>(${sessionScope.role})</b>
				</a>
					<ul class="dropdown-menu">
						<li class="menu">
							<ul>
								<li><a href="#"><span
										class="icon16 icomoon-icon-user-plus"></span>Change Password</a></li>
										
								<c:if test="${sessionScope.role=='Admin'}">

									<li><a href="manageUser.jsp"><span
											class="icon16 icomoon-icon-plus"></span>Manage User</a></li>

								</c:if>
								<li><a href="logoutServlet"  onclick="return confirm('Are you sure you want to Logout?');"><span
										class="icomoon-icon-exit"></span>Logout</a></li>

							</ul>
						</li>
					</ul></li>


			</ul>
		</div>
		<!-- /.nav-collapse --> </nav>
		<!-- /navbar -->

	</div>
	<!-- End #header -->

	<div id="wrapper">

		<!--Responsive navigation button-->
		<div class="resBtn">
			<a href="#"><span class="icon16 minia-icon-list-3"></span></a>
		</div>

		<!--Sidebar collapse button-->
		<div class="collapseBtn leftbar">
			<a href="#" class="tipR" title="Hide sidebar"><span
				class="icon12 minia-icon-layout"></span></a>
		</div>

		<!--Sidebar background-->
		<div id="sidebarbg"></div>
		<!--Sidebar content-->
		<div id="sidebar">

			<div class="sidenav">

				<div class="sidebar-widget" style="margin: -1px 0 0 0;">
					<h5 class="title" style="margin-bottom: 0">Navigation</h5>
				</div>
				<!-- End .sidenav-widget -->

				<div class="mainnav">

					<ul>
						<li><a href="index.jsp"><span
								class="icon16 icomoon-icon-stats-up"></span>Dashboard</a>
					</ul>


					<!-- ------------------------------------------------------------------------ Dashboard ------------------------------------------------------------------------ -->
					<ul>
						<li><a href="#"><span
								class="icon16 minia-icon-equalizer-2"></span>Report</a>
							<ul class="sub">
								<li><a href="#"><span class="icon16 icomoon-icon-file"></span>Dimensions</a>
									<ul class="sub">
										<li><a href="#"><span
												class="icon16 icomoon-icon-arrow-right-3"></span><input
												type="checkbox" name="date_table" value="date">Date</a>

											<ul class="sub">


												<li></span> Academic Year : </a></li>
												<center>
													<li><input type="text" name="year_start" size="1"
														maxlength="4"> to : </a><input type="text"
															name="year_start" size="1" maxlength="4"><br></li>
												</center>

												<li></span> Semester : </a> <select size="1">
														<option value="0" selected="selected">All</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3(Summer)</option>
												</select></li>

											</ul></li>


										<li><a href="#"><span
												class="icon16 icomoon-icon-arrow-right-3"></span><input
												type="checkbox" name="date_table" value="degree">Degree</a>
											<ul class="sub">

												<li></span> Degree Name : </a> <select size="1">
														<option value="0" selected="selected">All</option>
														<option value="BA">B.A. (Bachelor of Arts)</option>
														<option value="MA">M.A. (Master of Arts)</option>
														<option value="Ph.D">Ph.D. (Doctor of Philosophy)</option>
												</select></li>

												<li></span> Major : </a> <select size="1">
														<option value="all" selected="selected">All</option>
														<option value="se">Software Engineering
															(วิศวกรรมซอฟต์แวร์)</option>
														<option value="nt">Network and System Technology
															(เทคโนโลยีเครือข่ายและระบบ)</option>
														<option value="mg">Multimedia and Game
															Development)Philosophy (การพัฒนาสื่อประสมและเกม)</option>
														<option value="bi">Business Intelligence
															(อัจฉริยะทางธุรกิจ)</option>
												</select></li></li>

									</ul></li>
								<li><a href="#"><span
										class="icon16 icomoon-icon-arrow-right-3"></span><input
										type="checkbox" name="date_table" value="student">Student</a>
									<ul class="sub">

										<li></span>Student ID : </a> <input type="text" name="student_id"
											size="6" maxlength="8"></li>

										<li>Category : </a> <select size="1">
												<option value="all" selected="selected">All</option>
												<option value="direct">Direct (สอบตรง)</option>
												<option value="ad">Admissions (แอดมิชชั่น)</option>
												<option value="good grades">Good grades (เรียนดี)</option>
												<option value="talent">talent (ความสามารถพิเศษ)</option>
												<option value="quota handicapped">Quota handicapped
													(โควต้า น.ศ พิการ)</option>
										</select></li></li>


								<li>Graduate From : </a> <select size="1">
										<option value="has_the_words" selected="selected">Has
											the words (มีคำว่า)</option>
										<option value="start_the_word">Start the word
											(เริ่มต้นด้วย)</option>
								</select> School : <input type="text" name="graduate_from" size="20.8"
									maxlength="50"></li>


								<li>Graduate GPA : </a>
									<center>
										<li><input type="text" name="year_start" size="1"
											maxlength="4"> to : </a><input type="text"
												name="year_start" size="1" maxlength="4"><br></li>
									</center></li>


							</ul></li>
						</li>


						<li><a href="#"><span
								class="icon16 icomoon-icon-arrow-right-3"></span><input
								type="checkbox" name="date_table" value="course">Course</a>

							<ul class="sub">

								<li></span>Course ID : </a> <input type="text" name="course_id"
									size="6" maxlength="8"></li>


								<li>Course Name : </a> <input type="text" name="course_name"
									size="14" maxlength="50" height="5"></li>

								<li>Class : </a> <input type="text" name="class" size="1"></li>

								<li>Credit : </a> <select size="1">
										<option value="all" selected="selected">All</option>
										<option value="1">1</option>
										<option value="3">3</option>
										<option value="6">6</option>
										<option value="9">9</option>
								</select>

								</li>


								<li>Number of Student : </a> <input type="text"
									name="number_of_student" size="1" maxlength="3"></li>


								<li>Instuctor : </a>
								<center>
										<li><input type="text" name="year_start" size="22.5"
											maxlength="50">
									</center>
							</ul></li>

						<li><a href="#"><span
								class="icon16 icomoon-icon-arrow-right-3"></span><input
								type="checkbox" name="date_table" value="person_status">Person
									Status</a>
							<ul class="sub">
								<li>Status : <select size="1">
										<option value="all">All Status (ทุกสถานะ)</option>
										<option value="register">Register (ลงทะเบียน)</option>
										<option value="pass">Pass (ผ่าน - ปกติ)</option>
										<option value="probation">Probation (ภาคทัณฑ์)</option>
										<option value="retire">Retire (รีไทร์)</option>
										<option value="resign">Resign (ลาออก)</option>
										<option value="lntermisson_leave">Intermission Leave
											(รักษาสถานภาพ)</option>
										<option value="graduate">Graduate (จบการศึกษา)</option>
										<option value="Balance">Student Balance
											(นนักศึกษาคงเหลือ)</option>
								</select>
								</li>
							</ul></li>

					</ul>
					<button type="submit" class="btn btn-info center" id="loginBtn">
						<span class="icon16 icomoon-icon-dashboard"></span>Create
						Dashboard> >
					</button>
					</li>

					</ul>


					<!-- -------------------------------------------------------------------------Query table------------------------------------------------------------------------ -->

					<li><a href="dashboard.html"><span
							class="icon16 icomoon-icon-table-2"></span>Query table</a>
						<ul class="sub">
							<li><a href="#"><span class="icon16 icomoon-icon-file"></span>Dimensions</a>
								<ul class="sub">
									<li><a href="#"><span
											class="icon16 icomoon-icon-arrow-right-3"></span><input
											type="checkbox" name="date_table" value="date">Date</a>

										<ul class="sub">


											<li></span> Academic Year : </a></li>
											<center>
												<li><input type="text" name="year_start" size="1"
													maxlength="4"> to : </a><input type="text"
														name="year_start" size="1" maxlength="4"><br></li>
											</center>

											<li></span> Semester : </a> <select size="1">
													<option value="0" selected="selected">All</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3(Summer)</option>
											</select></li>

										</ul></li>


									<li><a href="#"><span
											class="icon16 icomoon-icon-arrow-right-3"></span><input
											type="checkbox" name="date_table" value="degree">Degree</a>
										<ul class="sub">

											<li></span> Degree Name : </a> <select size="1">
													<option value="0" selected="selected">All</option>
													<option value="BA">B.A. (Bachelor of Arts)</option>
													<option value="MA">M.A. (Master of Arts)</option>
													<option value="Ph.D">Ph.D. (Doctor of Philosophy)</option>
											</select></li>

											<li></span> Major : </a> <select size="1">
													<option value="all" selected="selected">All</option>
													<option value="se">Software Engineering
														(วิศวกรรมซอฟต์แวร์)</option>
													<option value="nt">Network and System Technology
														(เทคโนโลยีเครือข่ายและระบบ)</option>
													<option value="mg">Multimedia and Game
														Development)Philosophy (การพัฒนาสื่อประสมและเกม)</option>
													<option value="bi">Business Intelligence
														(อัจฉริยะทางธุรกิจ)</option>
											</select></li></li>

								</ul></li>
							<li><a href="#"><span
									class="icon16 icomoon-icon-arrow-right-3"></span><input
									type="checkbox" name="date_table" value="student">Student</a>
								<ul class="sub">

									<li></span>Student ID : </a> <input type="text" name="student_id"
										size="6" maxlength="8"></li>

									<li>Category : </a> <select size="1">
											<option value="all" selected="selected">All</option>
											<option value="direct">Direct (สอบตรง)</option>
											<option value="ad">Admissions (แอดมิชชั่น)</option>
											<option value="good grades">Good grades (เรียนดี)</option>
											<option value="talent">talent (ความสามารถพิเศษ)</option>
											<option value="quota handicapped">Quota handicapped
												(โควต้า น.ศ พิการ)</option>
									</select></li></li>


							<li>Graduate From : </a> <select size="1">
									<option value="has_the_words" selected="selected">Has
										the words (มีคำว่า)</option>
									<option value="start_the_word">Start the word
										(เริ่มต้นด้วย)</option>
							</select> School : <input type="text" name="graduate_from" size="20.8"
								maxlength="50"></li>


							<li>Graduate GPA : </a>
								<center>
									<li><input type="text" name="year_start" size="1"
										maxlength="4"> to : </a><input type="text"
											name="year_start" size="1" maxlength="4"><br></li>
								</center></li>


						</ul></li>
					</li>


					<li><a href="#"><span
							class="icon16 icomoon-icon-arrow-right-3"></span><input
							type="checkbox" name="date_table" value="course">Course</a>

						<ul class="sub">

							<li>type="checkbox" name="course" value="course_id"></span>Course ID : </a> <input type="text" name="course_id"
								size="6" maxlength="8"></li>


							<li>Course Name : </a> <input type="text" name="course_name"
								size="14" maxlength="50" height="5"></li>

							<li>Class : </a> <input type="text" name="class" size="1"></li>

							<li>Credit : </a> <select size="1">
									<option value="all" selected="selected">All</option>
									<option value="1">1</option>
									<option value="3">3</option>
									<option value="6">6</option>
									<option value="9">9</option>
							</select>

							</li>


							<li>Number of Student : </a> <input type="text"
								name="number_of_student" size="1" maxlength="3"></li>


							<li>Instuctor : </a>
							<center>
									<li><input type="text" name="year_start" size="22.5"
										maxlength="50">
								</center>
						</ul></li>

					<li><a href="#"><span
							class="icon16 icomoon-icon-arrow-right-3"></span>PersonStatus</a>
						<ul class="sub">
							<li>Status : <select size="1">
									<option value="all">All Status (ทุกสถานะ)</option>
									<option value="register">Register (ลงทะเบียน)</option>
									<option value="pass">Pass (ผ่าน - ปกติ)</option>
									<option value="probation">Probation (ภาคทัณฑ์)</option>
									<option value="retire">Retire (รีไทร์)</option>
									<option value="resign">Resign (ลาออก)</option>
									<option value="lntermisson_leave">Intermission Leave
										(รักษาสถานภาพ)</option>
									<option value="graduate">Graduate (จบการศึกษา)</option>
									<option value="Balance">Student Balance
										(นนักศึกษาคงเหลือ)</option>
							</select>
							</li>
						</ul></li>

					</ul>
					<button type="submit" class="btn btn-info center" id="loginBtn">
						<span class="icon16 icomoon-icon-search-3"></span>Query Data> >
					</button>
					</li>

					</ul>




					<!-- -------------------------------------------------------------------------Insert Data------------------------------------------------------------------------ -->

					<ui>
					<li><a href="#"><span
							class="icon16 icomoon-icon-cloud-upload"></span>Insert Data</a>
						<ul class="sub">
							<li><a href="#"><span class="icon16 icomoon-icon-file"></span>Choose
									Table</a>
								<ul class="sub">
									<li><a href="InsertCSVDate.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Date</a></li>
									<li><a href="InsertCSVDegree.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Degree</a></li>
									<li><a href="InsertCSVStudent.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Student</a></li>
									<li><a href="InsertCSVCourse.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Course</a></li></li>
									<li><a href="InsertCSVTeacher.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Teacher</a></li></li>		
									<li><a href="InsertCSVPerson_Status.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Person Status</a></li></li>
						</ul>
							</li>

					</ul>



					</ul>
					</li>
					</ul>

					</li>
					</ui>





				</div>
			</div>
			<!-- End sidenav -->

		</div>
		<!-- End #sidebar -->



		<!--Body content-->
		<div id="content" class="clearfix">
			<div class="contentwrapper">
				<!--Content wrapper-->

				<div class="heading">

					<h3>Add Staff Account</h3>

					<div class="resBtnSearch">
						<a href="#"><span class="icon16 icomoon-icon-search-3"></span></a>
					</div>

					<div class="search"></div>
					<!-- End search -->

					<ul class="breadcrumb">
						<li>You are here:</li>
						<li><a href="#" class="tip" title="back to dashboard"> <span
								class="icon16 icomoon-icon-screen-2"></span>
						</a> <span class="divider"> <span
								class="icon16 icomoon-icon-arrow-right-3"></span>
						</span></li>
						<li class="active">Manage User</li>
					</ul>

				</div>
				<!-- End .heading-->

				<!-- Build page from here: Usual with <div class="row-fluid"></div> -->

				<div class="row">
					<!-- ------------------------- dashboard1 ------------------------- -->
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									<span class="icon16 icomoon-icon-equalizer-2"></span> <span>Staff User</span>
									

								</h4>
								<a href="#" class="minimize">Minimize</a>
							</div>
							<p id="showLoading"></p>
							<div class="panel-body noPad">
								<table class="table table-bordered" id="checkAll">
									<thead>
										<tr>
											<th>#</th>
											<th>Name</th>
											<th>UserName</th>
											<th>Password</th>
											<th>Role</th>
					
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<%
												Class.forName("org.apache.hive.jdbc.HiveDriver");
												int count = 0;
												Connection con = DriverManager.getConnection("jdbc:hive2://161.246.38.15:10000/dw", "itkmitldw",
														"itkmitldw504");
												Statement stmt = con.createStatement();
												
												String Hivequery = "select * from dw.staff_account";
												System.out.println("Running: " + Hivequery );
												ResultSet res = stmt.executeQuery(Hivequery );
												System.out.println("execute :"+res);
												while (res.next()) {
													count += 1;
													String name = res.getString(1);
													String username = res.getString(2);
													String password = res.getString(3);
													String role = res.getString(4);
													request.setAttribute("count", count);
													request.setAttribute("name", name);
													request.setAttribute("username", username);
													request.setAttribute("password", password);
													request.setAttribute("role", role);
											%>

											<tr>
												<td>${count}</td>
												<td>${name}</td>
												<td>${username}</td>
												<td>${password}</td>
												<td>${role}</td>
												
												<td>
													<div class="controls center">
													  
													<%-- 	<form name="manageUser"  action="editUser" method="post">
															<button name="edituser"	value="${username}" title="Edit" onclick="LoadingFunction()" >
															<span class="icon12 icomoon-icon-pencil"></span> </button>
														</form>
															
													 	 <span style="margin-left:0.1em"></span>  --%>
													  
														<form name="manageUser"  action="delUser" method="post">
															<button name="deleteuser"  value="${username}" title="Delete"   onclick="res= confirm('Are you sure you want to detete Username : ${username}?'); if(res){ LoadingFunction(); }return res;"  >
															<span class="icon12 icomoon-icon-remove"  ></span></button>
														</form></div>
													
												</td>
											</tr>
											<tr>

												<%
													
													}
												%>
											
								
										</tbody>
								</table>
								
							</div>
									
						</div>
						<!-- End .panel -->
								
							
					</div>
					<!-- End .span6 -->


					<div class="col-lg-4">

						<div class="panel panel-default chart">

							<div class="panel-heading">

								<h4>
									<span class="icomoon-icon-pencil-3"></span> <span>Add
										Staff Account</span>
								</h4>
								<a href="#" class="minimize">Minimize</a>
							</div>
							<div class="panel-body">

								<div style="height: 450px; width: 100%;">
									<!-- ------------------------- dashboard1R ------------------------- -->
									<form class="form-horizontal" action="addUser" method="post">
										<div class="form-group">

											<div class="col-lg-11">
												Name :<input type="text" class="form-control"
													name="name_add">
											</div>
											<br />
											<div class="col-lg-11">
												Username :<input type="text" class="form-control"
													name="username_add">
											</div>
											<br />

											<div class="col-lg-11">
												Password :<input type="password" class="form-control"
													name="password_add">
											</div>
											<br />

											<div class="col-lg-11">
											<br/>
												role :<select name="role_add" size="1">
													<option value="Admin">Admin (ผู้ดูแลระบบ)</option>
													<option value="User">User (ผู้ใช้งาน)</option>
												</select>
												
														
												
												
												<%
													request.setAttribute("AddisFail", "");
												%>
												<div align="right">
													<br />
													<button class="btn btn-primary" type="submit"
														onclick="LoadingFunction()">Add Staff Account ></button>
														
												</div>
												<c:choose>
													<c:when test="${AddisFail=='false'}">
														<h3 id="green">Add Staff Account Success!</h3>
													</c:when>
													<c:when test="${DelisFail=='false'}">
														<h3 id="green">Delete Staff Account Success!</h3>
													</c:when>
													<c:when test="${AddisFail=='true'}">
														<h3 id="red">Add Staff Account Fail, Please try again!</h3>
													</c:when>
													<c:when test="${DelisFail=='true'}">
														<h3 id="red">Delete Staff Account Fail, Please try again!</h3>
													</c:when>
													<c:otherwise>

													</c:otherwise>
												</c:choose>

												<!-- Loading.....(Wait Insert User) -->
												<script>
													function LoadingFunction() {
														document
																.getElementById("showLoading").innerHTML = "<center><h3>Waiting..a moment</h3> <br/><img src='images/loading.gif'></center";
													}
												</script>

																
											</div>

										</div>

									</form>

								</div>


							</div>
						</div>

					</div>
					<!-- End .panel -->

				</div>
				<!-- End .span6 -->



			</div>
			<!-- End .row -->





			<!-- Page end here -->

			<!-- Le javascript
    ================================================== -->
			<!-- Important plugins put in all pages -->
			<script type="text/javascript"
				src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript"
				src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
			<script type="text/javascript"
				src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
			<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
			<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
			<script type="text/javascript" src="js/libs/jRespond.min.js"></script>


			<!-- Misc plugins -->
			<script type="text/javascript"
				src="plugins/misc/qtip/jquery.qtip.min.js"></script>
			<!-- Custom tooltip plugin -->
			<script type="text/javascript"
				src="plugins/misc/totop/jquery.ui.totop.min.js"></script>

			<!-- Search plugin -->
			<script type="text/javascript"
				src="plugins/misc/search/tipuesearch_set.js"></script>
			<script type="text/javascript"
				src="plugins/misc/search/tipuesearch_data.js"></script>
			<!-- JSON for searched results -->
			<script type="text/javascript"
				src="plugins/misc/search/tipuesearch.js"></script>

			<!-- Form plugins -->
			<script type="text/javascript"
				src="plugins/forms/uniform/jquery.uniform.min.js"></script>

			<!-- Init plugins -->
			<script type="text/javascript" src="js/main.js"></script>
			<!-- Core js functions -->
			<script type="text/javascript" src="js/charts.js"></script>
			<!-- Init plugins only for page -->
</body>
</html>
