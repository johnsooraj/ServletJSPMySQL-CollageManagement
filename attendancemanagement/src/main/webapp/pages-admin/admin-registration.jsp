<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<link rel="icon" type="image/gif/png"
	href="dist/img/sign-check-icon.png">
<title>Administrator | Home</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
</head>
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="#" class="navbar-brand"><b>Administrator</b></a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse pull-left"
						id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="#" onclick="adminhome()">Home <span
									class="sr-only">(current)</span>
							</a></li>
							<li><a href="#" onclick="studentview()">Students</a></li>
							<li><a href="#" onclick="staffview()">Staffs</a></li>
							<li><a href="#" onclick="departmentview()">Departments</a></li>
							<li class="active dropdown"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">Other <span
									class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" onclick="addstudent()">Students</a></li>
									<li><a href="#" onclick="addstaff()">Staffs</a></li>
									<li><a href="#" onclick="adddepartment()">Departments</a></li>
									<li><a href="#" onclick="addsubjects()">Subjects</a></li>
									<li class="divider"></li>
									<li><a href="#" onclick="viewTimeTable()">View Time
											Table</a></li>
									<li class="divider"></li>
									<li><a href="#" onclick="generateTimeTable()">Generate
											Time Table</a></li>
									<li><a href="#" onclick="adminregister()">Admin
											Registration</a></li>
								</ul></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#" onclick="logout()"><span
									class="fa fa-fw fa-unlock"></span> Log out</a></li>
						</ul>
						<form class="navbar-form navbar-left" role="search">
							<div class="form-group">
								<input type="text" class="form-control" id="navbar-search-input"
									placeholder="Search">
							</div>
						</form>
					</div>
				</div>
			</nav>
		</header>
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>
						Administrator Registration <small>College Management</small>
					</h1>
				</section>

				<!-- Main content -->
				<section class="content">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Registration</h3>
							</div>
							<form class="form-horizontal" action="attendance" method="post">
								<input type="hidden" value="adminRegister" name="hidden">
								<fieldset>
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">User
											name</label>
										<div class="col-md-4">
											<input id="name" name="username" type="text"
												placeholder="Enter username" class="form-control input-md"
												required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">Password</label>
										<div class="col-md-4">
											<input id="name" name="password" type="password"
												placeholder="Enter password" class="form-control input-md"
												required="required">
										</div>
									</div>
									<input id="name" name="type" type="hidden" value="admin"
										class="form-control input-md" required="required">
									<div class="form-group">
										<label class="col-md-4 control-label" for="signup"></label>
										<div class="col-md-4">
											<input type="submit" id="signup" name="signup"
												class="btn btn-success" value="Add" />
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</section>
			</div>
		</div>
		<footer class="main-footer">
			<div class="container">
				<div class="pull-right hidden-xs">
					<b>MyCollege</b> 2.3.6
				</div>
				<strong>Copyright &copy; 2014-2016 <a
					href="http://almsaeedstudio.com">Create by Students</a>.
				</strong> All rights reserved.
			</div>
			<!-- /.container -->
		</footer>
	</div>
	<form id="adminhome" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="adminhome">
	</form>
	<form id="studentview" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="studentview">
	</form>
	<form id="staffview" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="staffview">
	</form>
	<form id="departmentview" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="departmentview">
	</form>
	<form id="addstudent" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="addstudent">
	</form>
	<form id="addstaff" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="addstaff">
	</form>
	<form id="adddepartment" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="adddepartment">
	</form>
	<form id="viewtimetable" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="viewtimetable">
	</form>
	<form id="generatetimetable" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="generatetimetable">
	</form>
	<form id="adminregister" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="adminregister">
	</form>
	<form id="addsubjects" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="addsubjects">
	</form>

	<form id="viewTimeTable" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="viewtimetable">
	</form>
	<form id="generateTimeTable" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="generatetimetable">
	</form>

	<form id="logout" action="attendance" method="post">
		<input type="hidden" name="hidden" value="logout">
	</form>

	<script type="text/javascript">
		function logout() {
			document.getElementById("logout").submit();
		}
		function viewTimeTable() {
			document.getElementById("viewTimeTable").submit();
		}
		function generateTimeTable() {
			document.getElementById("generateTimeTable").submit();
		}
		function adminhome() {
			document.getElementById("adminhome").submit();
		}
		function studentview() {
			document.getElementById("studentview").submit();
		}
		function staffview() {
			document.getElementById("staffview").submit();
		}
		function departmentview() {
			document.getElementById("departmentview").submit();
		}
		function addstudent() {
			document.getElementById("addstudent").submit();
		}
		function addstaff() {
			document.getElementById("addstaff").submit();
		}
		function adddepartment() {
			document.getElementById("adddepartment").submit();
		}
		function viewtimetable() {
			document.getElementById("viewtimetable").submit();
		}
		function generatetimetable() {
			document.getElementById("generatetimetable").submit();
		}
		function adminregister() {
			document.getElementById("adminregister").submit();
		}
		function addsubjects() {
			document.getElementById("addsubjects").submit();
		}
	</script>
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="plugins/fastclick/fastclick.js"></script>
	<script src="dist/js/app.min.js"></script>
	<script src="dist/js/demo.js"></script>
</body>
</html>