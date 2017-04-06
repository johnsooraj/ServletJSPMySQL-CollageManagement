<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script type="text/javascript">
	window.onload = function() {
		var select = document.getElementById('departmentlist');
		while (select.firstChild) {
			select.removeChild(select.firstChild);
		}
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var sessionObject = this.responseText;
				var jsonObj = JSON.parse(sessionObject);
				var select = document.getElementById("departmentlist");
				var length = select.options.length;
				var trannumber = document.getElementById("departmentlist");
				var i = 0;
				var text = "";
				for (i = 0; i < jsonObj.length; i++) {
					var option = document.createElement("option");
					option.text = jsonObj[i];
					trannumber.add(option);
				}
			}
		};
		xhttp.open("GET", "attendance?hidden=ajaxviewdepartmentname", true);
		xhttp.send();
	}
</script>
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
<link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
<link rel="stylesheet" href="plugins/morris/morris.css">
<link rel="stylesheet"
	href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
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
									<li class="active"><a href="#" onclick="addstudent()">Students</a></li>
									<li><a href="#" onclick="addstaff()">Staffs</a></li>
									<li><a href="#" onclick="adddepartment()">Departments</a></li>
									<li><a href="#" onclick="addsubjects()">Subjects</a></li>
									<li class="divider"></li>
									<li><a href="#" onclick="adminhome()">View Time Table</a></li>
									<li class="divider"></li>
									<li><a href="#" onclick="adminhome()">Generate Time
											Table</a></li>
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
						Student Registration <small>College Management</small>
					</h1>
					<ol class="breadcrumb">
						<li class="active"><a href="#"><i class="fa fa-dashboard"></i>
								Home</a></li>
						<li>Other</li>
						<li class="active">add student</li>
					</ol>
				</section>

				<!-- Main content -->
				<section class="content">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Registration</h3>
							</div>
							<form class="form-horizontal" action="attendance" method="post">
								<input type="hidden" value="studentregistration" name="hidden">
								<fieldset>
									<!-- Form Name -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">Name</label>
										<div class="col-md-4">
											<input id="name" name="name" type="text"
												placeholder="Enter your name" class="form-control input-md"
												required="required">
										</div>
									</div>
									<!-- Form Age -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">Age</label>
										<div class="col-md-4">
											<input id="name" name="age" type="text"
												placeholder="Enter your age" class="form-control input-md"
												required="required">
										</div>
									</div>
									<!-- Date -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">Date
											of Birth</label>
										<div class="col-md-4">
											<div class="input-group date">
												<div class="input-group-addon">
													<i class="fa fa-calendar"></i>
												</div>
												<input type="text" name="dateofbirth"
													class="form-control pull-right" id="datepicker">
											</div>
										</div>

										<!-- /.input group -->
									</div>
									<!-- /.form group -->
									<!-- Form Email -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">Email</label>
										<div class="col-md-4">
											<input id="name" name="email" type="email"
												placeholder="Enter your email" class="form-control input-md"
												required="required">
										</div>
									</div>
									<!-- Form phone -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="name">Phone</label>
										<div class="col-md-4">
											<input id="name" name="phone" type="text"
												placeholder="Enter your phone" class="form-control input-md"
												required="required">
										</div>
									</div>

									<!-- Select Basic -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="blood_group">Department</label>
										<div class="col-md-4">
											<select id="departmentlist" name="departmentlist"
												class="form-control">
											</select>
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="street">Street</label>
										<div class="col-md-4">
											<input id="street" name="street" type="text"
												placeholder="Enter your street"
												class="form-control input-md" required="required">
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="area">Address</label>
										<div class="col-md-4">
											<textarea class="form-control" name="address" rows="3"
												placeholder="Enter ..."></textarea>
										</div>
									</div>
									<!-- Password input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="password">Password</label>
										<div class="col-md-4">
											<input id="password" name="password" type="password"
												placeholder="Enter a password" class="form-control input-md"
												required="required">
										</div>
									</div>
									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="street">User
											name</label>
										<div class="col-md-4">
											<input id="password" name="username" type="password"
												placeholder="Enter a username" class="form-control input-md"
												required="required">
										</div>
									</div>
									<!-- Button -->
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
	<script src="plugins/select2/select2.full.min.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
	<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="plugins/iCheck/icheck.min.js"></script>
	<script src="plugins/fastclick/fastclick.js"></script>
	<script src="dist/js/app.min.js"></script>
	<script src="dist/js/demo.js"></script>
	<script>
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();

			//Datemask dd/mm/yyyy
			$("#datemask").inputmask("dd/mm/yyyy", {
				"placeholder" : "dd/mm/yyyy"
			});
			//Datemask2 mm/dd/yyyy
			$("#datemask2").inputmask("mm/dd/yyyy", {
				"placeholder" : "mm/dd/yyyy"
			});
			//Money Euro
			$("[data-mask]").inputmask();

			//Date range picker
			$('#reservation').daterangepicker();
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				format : 'MM/DD/YYYY h:mm A'
			});
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						startDate : moment().subtract(29, 'days'),
						endDate : moment()
					},
					function(start, end) {
						$('#daterange-btn span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'));
					});

			//Date picker
			$('#datepicker').datepicker({
				autoclose : true
			});

			//iCheck for checkbox and radio inputs
			$('input[type="checkbox"].minimal, input[type="radio"].minimal')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-blue',
						radioClass : 'iradio_minimal-blue'
					});
			//Red color scheme for iCheck
			$(
					'input[type="checkbox"].minimal-red, input[type="radio"].minimal-red')
					.iCheck({
						checkboxClass : 'icheckbox_minimal-red',
						radioClass : 'iradio_minimal-red'
					});
			//Flat red color scheme for iCheck
			$('input[type="checkbox"].flat-red, input[type="radio"].flat-red')
					.iCheck({
						checkboxClass : 'icheckbox_flat-green',
						radioClass : 'iradio_flat-green'
					});

			//Colorpicker
			$(".my-colorpicker1").colorpicker();
			//color picker with addon
			$(".my-colorpicker2").colorpicker();

			//Timepicker
			$(".timepicker").timepicker({
				showInputs : false
			});
		});
	</script>
</body>
</html>