<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		
		<style type="text/css">

		</style>
		
<title>FIT Data Warehouse</title>


<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Force IE9 to render in normla mode -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />




<!-- Core stylesheets do not remove -->
<link id="bootstrap" href="css/bootstrap/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="css/bootstrap/bootstrap-theme.css" rel="stylesheet"
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

<meta name="msapplication-TileColor" content="#3399cc" />

<!-- Load modernizr first -->
<script type="text/javascript" src="js/libs/modernizr.js"></script>


</head>
	
<body>
	<!-- loading HighCharts -->
<script src="js/highcharts.js" charset="UTF-8"></script>
<script src="js/modules/exporting.js" charset="UTF-8"></script>



<div id="header">
		<nav class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp"><img
				src="images\logo\ITDW_logo_Small.png"><b></a>
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
						class="image" /> <span class="txt">${sessionScope.username}
					</span><b>(${sessionScope.role})</b>

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
										<script>
										
										</script>
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

					<!-- ------------------------------------------------------------------------ Dashboard ------------------------------------------------------------------------ -->
					<ul>
						<li><a href="index.jsp"><span
								class="icon16 icomoon-icon-stats-up"></span>Dashboard</a>
					</ul>


					<!-- ------------------------------------------------------------------------ Report ------------------------------------------------------------------------ -->
						<ul>
						<li><a href="#"><span
								class="icon16 minia-icon-equalizer-2"></span>Report</a>
							<ul class="sub">
								<li><a href="#"><span class="icon16 icomoon-icon-file"></span>Dimensions</a>
									<ul class="sub">
										
												<span style="margin-left: 1em"><input
											type="checkbox" name="report" value="academic_year"> Academic Year : </span>
												<center>
													<li><input type="text" name="year_start" size="1" maxlength="4"> to : </a><input type="text"
															name="year_start" size="1" maxlength="4"><br></li>
												</center>

												<li> <span style="margin-left: 1em"><input
											type="checkbox" name="report" value="semester">Semester : </span>
													
													<select size="1">
														<option value="0" selected="selected">All</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3(Summer)</option>
												</select></li>
												
												
												<li><span style="margin-left: 1em"><input
											type="checkbox" name="report" value="degree_name">Degree Name : </span>
												
													<select size="1">
														<option value="0" selected="selected">All</option>
														<option value="BA">B.A. (Bachelor of Arts)</option>
														<option value="MA">M.A. (Master of Arts)</option>
														<option value="Ph.D">Ph.D. (Doctor of Philosophy)</option>
												</select></li>
												
												
												<li><span style="margin-left: 1em"><input
											type="checkbox" name="report" value="category">Category : </span>
												
													<select size="1">
														<option value="all" selected="selected">All</option>
														<option value="direct">Direct (สอบตรง)</option>
														<option value="ad">Admissions (แอดมิชชั่น)</option>
														<option value="good grades">Good grades (เรียนดี)</option>
														<option value="talent">talent (ความสามารถพิเศษ)</option>
														<option value="quota handicapped">Quota handicapped (โควต้า น.ศ พิการ)</option>
												</select></li>
												
												<li><span style="margin-left: 1em"><input
											type="checkbox" name="report" value="teacher_name">Teacher : </span>
												
													<select size="1">
														<option value="all" selected="selected">All</option>
														<%
											Class.forName("org.apache.hive.jdbc.HiveDriver");
											int count = 0;
											Connection con = DriverManager.getConnection("jdbc:hive2://161.246.38.15:10000/dw", "itkmitldw",
													"itkmitldw504");
											Statement stmt = con.createStatement();

											String Hivequery = "select teacher_id,teacher_name from dw.teacher";
											System.out.println("Running: " + Hivequery);
											ResultSet res = stmt.executeQuery(Hivequery);
											System.out.println("execute :" + res);
											while (res.next()) {
												count += 1;
												String teacher_id = res.getString(1);
												String teacher_name = res.getString(2);
												request.setAttribute("teacher_id", teacher_id);
												request.setAttribute("teacher_name", teacher_name);
												
												
										%>
														
														<option value=${teacher_id}>${teacher_name}</option>
														
												
												
										<%
											}
										%>
										</select><br></li><br>______________________________
						</li>
						


					</ul>
					<button type="submit" class="btn btn-info center" id="loginBtn">
						<span class="icon16 icomoon-icon-dashboard"></span>Create
						Dashboard> >
					</button>
					</li>

					</ul>


				

					<!-- -------------------------------------------------------------------------Insert Data------------------------------------------------------------------------ -->

					<ui>
					<li><a href="#"><span
							class="icon16 icomoon-icon-cloud-upload"></span>Put/Query Data</a>
						<ul class="sub">
						
							<li><a href="#"><span class="icon16 icomoon-icon-file"></span>Update Data</a>
								<ul class="sub">
									<li><a href="UpdateCSVPersonStatusFact.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Student Status</a></li>
									<li><a href="UpdateCSVTeacherWorkloadFact.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Teacher Workload</a></li>
									
								</ul>	
								
								
							<a href="#"><span class="icon16 icomoon-icon-file"></span>Edit Base</a>
								<ul class="sub">
									<li><a href="InsertCSVStudent.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Student</a></li>
									<li><a href="InsertCSVDate.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Date</a></li>
									<li><a href="InsertCSVCourse.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Course</a></li>
									<li><a href="InsertCSVDegree.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Degree</a></li>
									<li><a href="InsertCSVTeacher.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Teacher</a></li>
									<li><a href="InsertCSVStatus.jsp"><span
											class="icon16 icomoon-icon-arrow-right-3"></span>Status</a>
									
											
								</ul></li>			
							</ul>

				
			
					
					



				</div>
				<!-- Version Website -->
					<b><h6>version 0.3.6 Beta </h6></b>
			</div>
			<!-- End sidenav -->

		</div>
		<!-- End #sidebar -->



		<!--Body content-->
		<div id="content" class="clearfix">
			<div class="contentwrapper">
				<!--Content wrapper-->

				<div class="heading">

					<h3>IT DashBoard</h3>

					<div class="resBtnSearch">
						<a href="#"><span class="icon16 icomoon-icon-search-3"></span></a>
					</div>

					<div class="search">

						<form id="searchform" action="search.html">
							<input type="text" id="tipue_search_input" class="top-search"
								placeholder="Search here ..." /> <input type="submit"
								id="tipue_search_button" class="search-btn" value="" />
						</form>

					</div>
					<!-- End search -->

					<ul class="breadcrumb">
						<li>You are here:</li>
						<li><a href="#" class="tip" title="back to dashboard"> <span
								class="icon16 icomoon-icon-screen-2"></span>
						</a> <span class="divider"> <span
								class="icon16 icomoon-icon-arrow-right-3"></span>
						</span></li>
						<li class="active">IT DashBoard</li>
					</ul>

				</div>
				<!-- End .heading-->

				<!-- Build page from here: Usual with <div class="row-fluid"> -->

				<div class="row">

					<div class="col-xs-7">

						<div class="panel panel-default chart">

							<div class="panel-heading">

								<h4>
									<span class="icon16 icomoon-icon-bars"></span> <span>Student Chart</span>
								</h4>
								<a href="#" class="minimize">Minimize</a>
							</div>
							<div class="panel-body">
									
									<!-- -------------------------Start dashboard1 ------------------------- -->
									  		<div id="StudentPerSemester" style="min-width: 310px; max-width: 800px; height: 390px; margin: 0 auto"></div>
									 <h4>อัตราเฉลี่ยจำนวนนักศึกษาที่ลดลงต่อปีเท่ากับ 6 คน</h4>
									 <h4>อัตราเฉลี่ยจำนวนนักศึกษาที่ลดลงต่อภาคเรียน : ภาคเรียนที่1 : 3 คน	ภาคเรียนที่2 : 7 คน	ภาคเรียนที่3(Summer) : 1 คน</h4>
									<!-- -------------------------End dashboard1 ------------------------- -->
								</div>

							</div>
						</div>


					<div class="col-xs-5">

						<div class="panel panel-default chart">

							<div class="panel-heading">

								<h4>
									<span class="icon16 icomoon-icon-bars"></span> <span>Student Chart</span>
								</h4>
								<a href="#" class="minimize">Minimize</a>
							</div>
							<div class="panel-body">
									
									<!-- -------------------------Start dashboard1 ------------------------- -->
									  		<div id="TotalStatus" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
									 <br><h4>จากนักศึกษาทั้งหมด 100 คน</h4>
									<!-- -------------------------End dashboard1 ------------------------- -->
								</div>

							</div>
						</div>
					
					
					
					</div>
					<!-- End .row -->


		

	<!-- Page end here -->
	



	<script type="text/javascript">
$(function () {
    $('#StudentPerSemester').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'จำนวนนักศึกษาในแต่ละปีการศึกษา'
        },
        subtitle: {
            text: 'Source: IT KMITL Data Warehouse'
        },
        xAxis: {
            categories: ['ปีการศึกษา ', 'ปีการศึกษา ', 'ปีการศึกษา ', 'ปีการศึกษา ', 'ปีการศึกษา '],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'จำนวนนักศึกษา',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' คน'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 250,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'ภาคเรียนที่ 1',
            data: [107, 131, 335, 203, 32]
        }, {
            name: 'ภาคเรียนที่ 2',
            data: [133, 156, 547, 408, 96]
        }, {
            name: 'ภาคเรียนที่ 3(Summer)',
            data: [352, 454, 450, 340, 38]
        }]
    });
});

</script>






<script type="text/javascript">
$(function () {
        $('#TotalStatus').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'สถานะการศึกษาของนักศึกษาทั้งหมด ปีการศึกษา'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true
                        ,format: ' {point.percentage:.1f} %'
                    },
                    showInLegend: true
                }
            },
           // <p style="display:none" id='ttest'>servlet</p>
            series: [{
                name: "Brands",
                colorByPoint: true,
                data: [{
                    name: "Pass (ปกติ)",
                    y: ${chart.countPass},
                    sliced: true,
                    selected: true
                }, {
                    name: "Probation (ภาคทัณฑ์)",
                    y: ${chart.countProbation}
                    
                }, {
                    name: "Retire (รีไทร์)",
                    y: ${chart.countRetire}
                }, {
                    name: "Resign (ลาออก)",
                    y: ${chart.countResign}
                }, {
                    name: "Intermission Leave (รักษาสถานภาพ)",
                    y: ${chart.countIntermission_Leave}
                }, {
                    name: "Graduate (จบการศึกษา)",
                    y: ${chart.countGraduate}
                }]
            }]
        });
    });

</script>	
		
		

<!-- Important plugins put in all pages -->
	
<!-- Important plugins put in all pages -->

	<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="js/libs/jRespond.min.js"></script>

	

	<!-- Misc plugins -->
	<script type="text/javascript"
		src="plugins/misc/nicescroll/jquery.nicescroll.min.js"></script>
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
	<script type="text/javascript" src="plugins/misc/search/tipuesearch.js"></script>

	<!-- Form plugins -->
	<script type="text/javascript"
		src="plugins/forms/uniform/jquery.uniform.min.js"></script>

	<!-- Table plugins -->
	<script type="text/javascript"
		src="plugins/tables/dataTables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="plugins/tables/dataTables/TableTools.min.js"></script>
	<script type="text/javascript"
		src="plugins/tables/dataTables/ZeroClipboard.js"></script>
	<script type="text/javascript"
		src="plugins/tables/responsive-tables/responsive-tables.js"></script>
	<!-- Make tables responsive -->

	<!-- Init plugins -->
	<script type="text/javascript" src="js/main.js"></script>
	<!-- Core js functions -->
	<script type="text/javascript" src="js/datatable.js"></script>
	<!-- Init plugins only for page -->

		
		
		
		
		
	
	

	
	</body>
</html>

