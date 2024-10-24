
<!DOCTYPE html>
<html>
	<head>
		<title>flyaway-addFlightSchedulde</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View FlightSchedulde / Add FlightSchedulde
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
							<i class="fa fa-plus"></i> Add FlightSchedulde
						</div>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" action="../schedulde" method="post" >
						<div class="form-group">
								<label for="" class="col-md-3 control-label">Schedule For Date</label>
								<div class="col-md-6">
									<input type="date" name="scdldate" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
									<label for="" class="col-md-3 control-label">Airlines</label>
									<div class="col-md-6">
										<select name="fname"  class="form-control" id="chooseFlight">
										</select>
									</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Source</label>
								<div class="col-md-6">
									<select name="from"  class="form-control" id="chooseCountry">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Set Departure</label>
								<div class="col-md-6">
									<input type="datetime-local" name="deptarture" class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Destination</label>
								<div class="col-md-6">
									<select name="to"  class="form-control" id="chooseToCountry">
										
									
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Set Arrival</label>
								<div class="col-md-6">
									<input type="datetime-local" name="arrival" class="form-control" required>
									<input type="hidden" name="event" value="addFlightSchedulde">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Total Distance</label>
								<div class="col-md-6">
									<input type="text" name="totaldistance" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Total Time</label>
								<div class="col-md-6">
									<input type="text" name="totalTime" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Ticket Price</label>
								<div class="col-md-6">
									<input type="text" name="ticketprice" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Total Seat</label>
								<div class="col-md-6">
									<input type="text" name="totalseats" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="addFlightSchedulde" value="Schedule" class="btn btn-success form-control">
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
		
		<script>
		$(document).ready(function() {
		
	    	let event = "event=viewCountry";
	    	//alert(event);
        	$.ajax({
    			url:"../country",
    			data:event,
    			type:"POST",
    			dataType:"json",
    			success:function(data,textStatus,jqXHR){ 					 
    				console.log(data);
    				let s2="";
    				for (var key in data) {
    					if (data.hasOwnProperty(key)) {
    					  
    					  s2+="<option value='"+data[key].country_name+"'>"+data[key].country_name+"</option>";
    					}
    				}
    				$('#chooseCountry').html(s2);
    				$('#chooseToCountry').html(s2);
    				console.log("success...")
    	  		},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    		}});});
		</script>
		<script>
		 $(document).ready(function() {
			let event = "event=viewFlight";
	    	//alert(event);
        	$.ajax({
    			url:"../flight",
    			data:event,
    			type:"POST",
    			dataType:"json",
    			success:function(data,textStatus,jqXHR){ 					 
    				console.log(data);
    				
    				 let s2="";
    				for (var key in data) {
    					if (data.hasOwnProperty(key)) {
    						 s2+="<option value='"+data[key].flight_name+"'>"+data[key].flight_name+"</option>";
    					}
    				}
    				$('#chooseFlight').html(s2);
    				console.log("success...")
    	  			
    			},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    	}});});
	</script>
	</body>
</html>
