<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<link rel="icon" type="image/gif/png"
	href="dist/img/sign-check-icon.png">
<title>Staff | Attendance</title>
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
	<header class="main-header">
		<nav class="navbar navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<a href="#" class="navbar-brand"><b>Staff</b></a>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse">
						<i class="fa fa-bars"></i>
					</button>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="#" onclick="staffHome()">Home <span
								class="sr-only">(current)</span>
						</a></li>
						<li><a href="#" onclick="StaffStudentView()">View
								Students</a></li>
						<li class="active"><a href="#" onclick="studentAttendance()">Students
								Attendance</a></li>

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
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				Attendance Data By <small>Department</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Sudent Attendance Details</li>
			</ol>
		</section>
		<section class="content">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">Attendance</h3>
					</div>
					<div class="box-body">
						<c:set var="count" value="1" scope="page" />
						<c:forEach var="studentList"
							items="${sessionScope.sutudentDataByDepartment }">
							<div class="row">
								<div class="col-lg-2 col-xs-6">
									<div class="checkbox">
										<label><input name="myCheckBoxx" type="checkbox">
											<label><c:out value="${studentList.name }"></c:out></label> </label>
									</div>
								</div>
							</div>
							<c:set var="count" value="${count + 1}" scope="page" />
						</c:forEach>

						<input type="button" onclick="attendanceListSend()" id="signup"
							name="signup" class="btn btn-success" value="Add" />

					</div>
				</div>
			</div>
		</section>
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

	<form id="staffHome" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="staffHome">
	</form>
	<form id="staffStudentView" action="attendance" method="post">
		<input type="hidden" name="hidden" value="pageredirection"> <input
			type="hidden" name="pageredirection" value="staffStudentView">
	</form>

	<form id="logout" action="attendance" method="post">
		<input type="hidden" name="hidden" value="logout">
	</form>

	<script type="text/javascript">
		function logout() {
			document.getElementById("logout").submit();
		}
		function staffHome() {
			document.getElementById("staffHome").submit();
		}
		function StaffStudentView() {
			document.getElementById("staffStudentView").submit();
		}
		function studentAttendance() {
			document.getElementById("studentAttendance").submit();
		}
		function attendanceListSend() {

			var labelValues = $(':checkbox:checked').map(function() {
				return [ $(this).next('label').text() ];
			}).get();

			if (labelValues == null | labelValues.length == 0) {
				alert("Please Select Any Subjects");
			} else {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						alert(this.responseText);
					}
				};
				xhttp.open("GET",
						"attendance?hidden=studentAttendanceList&listValue="
								+ labelValues + "", true);
				xhttp.send();
			}

		}
	</script>
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script
		src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="plugins/fastclick/fastclick.js"></script>
	<script src="dist/js/app.min.js"></script>
</body>
</html>