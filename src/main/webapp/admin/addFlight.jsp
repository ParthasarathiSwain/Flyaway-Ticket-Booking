

<!DOCTYPE html>
<html>
	<head>
		<title>Flyaway-AddAirline </title>
		
		<!--Add CSS Files-->
		<link rel="stylesheet" type="text/css" href="resources/css/adminstyle.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
		<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
  		<script>tinymce.init({ selector:'textarea' });</script>
		
	</head>
	<body>
	<div id="wrapper">
		<%@include file="include/sidepanel.jsp" %>
		<div id="page-wrapper">
			<div class="container-fluid">
		    <div class="row">
			<div class="col-lg-12">
				<br>
				<br>
				<ol class="breadcrumb">
					<li class="active">
						<i class="fa fa-dashboard"></i> Dashboard / View Airline / Add Airline
					</li>
				</ol>
			</div>
		</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-plus"></i> Add Airline
						</div>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="../flight" method="post" >
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Airline Name</label>
								<div class="col-md-6">
									<input type="text" name="flightName" class="form-control" required>
									<input type="hidden" name="event" value="addFlight">
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Airline Number</label>
								<div class="col-md-6">
									<input type="text" name="flightNum" class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="submitFlight" value="Add Airline" class="btn btn-success form-control">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
			</div>
		</div>
	
		
		<!--Add JavaScript Files-->
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/sweetalert.min.js"></script>
	</body>
</html>
