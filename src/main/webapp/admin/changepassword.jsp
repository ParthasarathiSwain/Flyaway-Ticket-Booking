
<!DOCTYPE html>
<html>
	<head>
		<title> Flyaway-ChangePassword</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / Change Password
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
							<i class="fa fa-plus"></i> Change Password
						</div>
					</div>
					<h4 id="msg" style=" text-align: center;"></h4>
					<div class="panel-body">
						<form class="form-horizontal" action="../admin" id="validate" method="post">
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Old Password</label>
								<div class="col-md-6">
									<input type="text" name="oldPass" class="form-control" id="oldPass" required>
										<input type="hidden" name="event" value="changePassword">
										
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">New Password</label>
								<div class="col-md-6">
									<input type="text" name="newPass" class="form-control" id="newPass" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Confirm Password</label>
								<div class="col-md-6">
									<input type="text" name="confirm" class="form-control" id="confirm" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" id="changepassword"  value="Update" class="btn btn-success form-control">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<hr>
		</div>
		</div>
	
		
		<!--Add JavaScript Files-->
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/sweetalert.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/jquery.validate.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.2/dist/additional-methods.min.js"></script>

		<script type="text/javascript">
		
			$(document).ready(function() {
				jQuery.validator.addMethod("notEqual", function(value, element, param) {
					 return this.optional(element) || value != $(param).val();
					}, "This has to be different...");
		   		$("#validate").validate({
		   			
			      	rules: {
			      		oldPass: 'required',
			      		newPass: {
			            	required: true,
			            	notEqual : "#oldPass",
			         	},
			         	confirm: {
			            	required: true,
			            	equalTo : "#newPass",
			         	},
			      	},
			      	messages: {
			      		oldPass: 'Current Password is required *',
					   	newPass: {
					   		required : 'Confirm Password is required *',
					   		notEqual : 'New password should not match with old one *',
					   		
					   	},
					   	confirm: {
					   		required : 'Confirm Password is required *',
					   		equalTo : 'Password not matching *',
					   		
					   	}
					},
			   });
			});
		</script>
			
	</body>
</html>
