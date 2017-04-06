<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script type="text/javascript">
	window.onload = function() {
		var select = document.getElementById('departmentName');
		while (select.firstChild) {
			select.removeChild(select.firstChild);
		}
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var sessionObject = this.responseText;
				var jsonObj = JSON.parse(sessionObject);
				var select = document.getElementById("departmentName");
				var length = select.options.length;
				var trannumber = document.getElementById("departmentName");
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
<link rel="stylesheet"
	href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<style type="text/css">
#smallBox {
	height: 120px;
}
</style>
</head>
<body class="hold-transition skin-blue layout-top-nav">
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
				<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="#" onclick="adminhome()">Home <span
								class="sr-only">(current)</span>
						</a></li>
						<li><a href="#" onclick="studentview()">Students</a></li>
						<li><a href="#" onclick="staffview()">Staffs</a></li>
						<li><a href="#" onclick="departmentview()">Departments</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Other <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#" onclick="addstudent()">Students</a></li>
								<li><a href="#" onclick="addstaff()">Staffs</a></li>
								<li><a href="#" onclick="adddepartment()">Departments</a></li>
								<li><a href="#" onclick="addsubjects()">Subjects</a></li>
								<li class="divider"></li>
								<li><a href="#" onclick="viewTimeTable()">View Time
										Table</a></li>
								<li class="divider"></li>
								<li class="active"><a href="#"
									onclick="generateTimeTable()">Generate Time Table</a></li>
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
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				View Staff Details By <small>Department</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Staff Details</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-3">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Options</h3>
						</div>
						<div class="box-body">
							<div class="row">
								<div class="col-lg-12 col-xs-12">
									<div class="form-group">
										<div class="col-md-12">
											<select id="departmentName" name="semersterlist"
												class="form-control">
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<br>
							</div>
							<div class="row">
								<div class="col-lg-12 col-xs-12">
									<div class="form-group">
										<div class="col-md-12">
											<select onchange="generatesubjecttext()" id="semersterlist"
												class="form-control">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<br>
							</div>
							<div class="row">
								<div class="col-lg-12 col-xs-12">
									<div id="newCheckBox"></div>
								</div>
							</div>
							<div class="row">
								<br>
							</div>
							<div class="row">
								<label class="col-md-6 control-label"></label>
								<div class="col-lg-12 col-xs-12">
									<button type="button" onclick="generateTimetable();"
										class="btn btn-block btn-primary">Generate</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div id="printableArea" class="col-md-9">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Time Table</h3>
							<a href="#" onclick="printDiv('printableArea')"
								class="btn btn-default"><i class="fa fa-print"></i> Print</a>
						</div>
						<div class="box-body">
							<div class="row">
								<br>
							</div>
							<div class="row">
								<p id="randomNumber"></p>
								<div id="addSubjectByDay">
									<div class="col-lg-2 col-xs-6">
										<div id="smallBox" class="small-box bg-aqua">
											<div class="inner">
												<h4
													style="margin-top: 30%; font-family: cursive; font-size: 22px;">
													<b>Monday</b>
												</h4>
											</div>
										</div>
										<div id="smallBox" class="small-box bg-blue">
											<div class="inner">
												<h4
													style="margin-top: 30%; font-family: cursive; font-size: 22px;">
													<b>Tuesday</b>
												</h4>
											</div>
										</div>
										<div id="smallBox" class="small-box bg-teal">
											<div class="inner">
												<h4
													style="margin-top: 30%; font-family: cursive; font-size: 22px;">
													<b>Wednesday</b>
												</h4>
											</div>
										</div>
										<div id="smallBox" class="small-box bg-aqua">
											<div class="inner">
												<h4
													style="margin-top: 30%; font-family: cursive; font-size: 22px;">
													<b>Thursday</b>
												</h4>
											</div>
										</div>
										<div id="smallBox" class="small-box bg-blue">
											<div class="inner">
												<h4
													style="margin-top: 30%; font-family: cursive; font-size: 22px;">
													<b>Friday</b>
												</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /. box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.content -->
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
	<form id="sendSubjectList" action="attendance" method="post">
		<input type="hidden" name="hidden" value="sendSubjectList">
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

		function generatesubjecttext() {

			var value1 = document.getElementById("departmentName");
			var departmentName = value1.options[value1.selectedIndex].text;

			var value2 = document.getElementById("semersterlist");
			var semesterNumber = value2.options[value2.selectedIndex].text;

			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {

					var sessionObject = this.responseText;
					var jsonObj = JSON.parse(sessionObject);
					//createTable(jsonObj);
					//alert(jsonObj);
					for (i = 0; i < jsonObj.length; i++) {
						var presentfield = document
								.getElementById('newCheckBox');
						var newdiv = document.createElement("div");
						newdiv.innerHTML = '<div class="checkbox"><label><input name="myCheckBoxx" type="checkbox"><label>'
								+ jsonObj[i]['subject_name']
								+ '</label></label></div>';
						presentfield.appendChild(newdiv);
					}
				}
			};
			xhttp
					.open(
							"GET",
							"attendance?hidden=liveajaxresponse&liveajaxdepartmentid=getSubjectsBySemester&departmentName="
									+ departmentName
									+ "&semsterNumber="
									+ semesterNumber + "", true);
			xhttp.send();
		}

		function generateTimetable() {

			var labelValues = $(':checkbox:checked').map(function() {
				return [ $(this).next('label').text() ];
			}).get();

			if (labelValues == null | labelValues.length == 0) {
				alert("Please Select Any Subjects");
			} else {
				createTable(labelValues);
			}
		}

		var count = 0;
		var arryOfSubjects = [];
		function createTable(jsonObj) {
			var dayInAWeek = 5;

			var randomArrayValues = [];

			//so for loop should run dayInAWeek
			if (count < 1) {
				count++;
				for (var i = 0; i < dayInAWeek; i++) {

					var randomOne = jsonObj[Math.floor(Math.random()
							* jsonObj.length)];
					var randomTwo = jsonObj[Math.floor(Math.random()
							* jsonObj.length)];
					var randomThree = jsonObj[Math.floor(Math.random()
							* jsonObj.length)];
					var randomFour = jsonObj[Math.floor(Math.random()
							* jsonObj.length)];
					var randomFive = jsonObj[Math.floor(Math.random()
							* jsonObj.length)];

					randomArrayValues.push(randomOne);
					randomArrayValues.push(randomTwo);
					randomArrayValues.push(randomThree);
					randomArrayValues.push(randomFour);
					randomArrayValues.push(randomFive);
					arryOfSubjects.push(randomOne);
					arryOfSubjects.push(randomTwo);
					arryOfSubjects.push(randomThree);
					arryOfSubjects.push(randomFour);
					arryOfSubjects.push(randomFive);

					var periodNumber = i + 1;

					var presentfield = document
							.getElementById('addSubjectByDay');
					var newdiv = document.createElement("div");
					newdiv.innerHTML = '<div id="SubjectCreation" class="col-lg-2 col-xs-6">'
							+ '<div id="smallBox" class="small-box bg-aqua">'
							+ '<div class="inner">'
							+ '<h4'
							+ 'style="margin-top: 10%; font-family: cursive; font-size: 12px;">'
							+ '<b>'
							+ periodNumber
							+ '</b>'
							+ '<p>'
							+ randomOne
							+ '</p>'
							+ '</h4>'
							+ '</div>'
							+ '</div>'
							+ '<div id="smallBox" class="small-box bg-blue">'
							+ '<div class="inner">'
							+ '<h4'
							+ 'style="margin-top: 30%; font-family: cursive; font-size: 22px;">'
							+ '<b>'
							+ periodNumber
							+ '</b>'
							+ '<p>'
							+ randomTwo
							+ '</p>'
							+ '</h4>'
							+ '</div>'
							+ '</div>'
							+ '<div id="smallBox" class="small-box bg-teal">'
							+ '<div class="inner">'
							+ '<h4'
							+ 'style="margin-top: 30%; font-family: cursive; font-size: 22px;">'
							+ '<b>'
							+ periodNumber
							+ '</b>'
							+ '<p>'
							+ randomThree
							+ '</p>'
							+ '</h4>'
							+ '</div>'
							+ '</div>'
							+ '<div id="smallBox" class="small-box bg-aqua">'
							+ '<div class="inner">'
							+ '<h4'
							+ 'style="margin-top: 30%; font-family: cursive; font-size: 22px;">'
							+ '<b>'
							+ periodNumber
							+ '</b>'
							+ '<p>'
							+ randomFour
							+ '</p>'
							+ '</h4>'
							+ '</div>'
							+ '</div>'
							+ '<div id="smallBox" class="small-box bg-blue">'
							+ '<div class="inner">'
							+ '<h4'
							+ 'style="margin-top: 30%; font-family: cursive; font-size: 22px;">'
							+ '<b>'
							+ periodNumber
							+ '</b>'
							+ '<p>'
							+ randomFive
							+ '</p>'
							+ '</h4>'
							+ '</div>'
							+ '</div>' + '</div>';
					presentfield.appendChild(newdiv);
				}
			}
		}
		function printDiv(divName) {
			var printContents = document.getElementById(divName).innerHTML;
			var originalContents = document.body.innerHTML;

			document.body.innerHTML = printContents;

			window.print();

			document.body.innerHTML = originalContents;
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