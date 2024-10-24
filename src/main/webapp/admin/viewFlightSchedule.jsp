
<!DOCTYPE html>
<html>
	<head>
	    <title>Flyaway-FlightSchedule</title>
		
		<!--Add CSS Files-->
		<link rel="stylesheet" type="text/css" href="resources/css/adminstyle.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
		
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View FlightSchedule
					</li>
				</ol>
			</div>
		</div>
		<div><a href="addFlightSchedule.jsp" class="btn btn-success text-white">
                Schedule <i class="fa fa-plus"></i>
            </a>
        </div>
        <hr>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i>View FlightSchedule
						</div>
					</div>
					<h4 id="msg" class="" style="text-align:center"></h4>
					<div class="panel-body">

						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Date</th>
										<th>Airlines</th>
										<th>Source</th>
										<th>Arrival</th>
										<th>Destination</th>
										<th>Departure</th>
										<th>Distance</th>
										<th>Total Time</th>
										<th>Ticket Price</th>
										<th>Total Seats</th>
										<!-- <th>Available Seats</th> -->
										<th>Action</th>
										
										
									</tr>
								</thead>
								<tbody id="viewFlightScheduleBody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		<!--Add JavaScript Files-->
		<!--Edit Modal dept-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit FlightSchedule</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../schedulde" method="post" >
        					<div class="form-group">
								<label for="" class="col-md-3 control-label">Schedule For Date</label>
								<div class="col-md-6">
									<input type="date" name="scdldate" id="scdldate" class="form-control" required>
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
									<input type="datetime-local" name="deptarture" class="form-control" id="setDept" required>
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
									<input type="datetime-local" name="arrival" class="form-control" id="setarival" required>
									<input type="hidden" name="event" value="updateFlightSchedulde">
									<input type="hidden" id="scdl_id" name="scdl_id" value="">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Total Distance</label>
								<div class="col-md-6">
									<input type="text" name="totaldistance" class="form-control" id="tdisance" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Total Time</label>
								<div class="col-md-6">
									<input type="text" name="totalTime" class="form-control" id="totalTime" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Ticket Price</label>
								<div class="col-md-6">
									<input type="text" name="ticketprice" class="form-control" id="ticketprice" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Total Seat</label>
								<div class="col-md-6">
									<input type="text" name="totalseats" class="form-control" id="totalseats" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="addFlightSchedulde" value="Update" class="btn btn-success form-control">
								</div>
							</div>
						</form>
      </div>
    </div>
  </div>
</div>
<!--edit modal end  -->
		
		</div>
		<%@include file="include/Resources.jsp" %>
		
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
			getData();
			function getData(){
	    	let event = "event=viewFlightSche";
	    	//alert(event);
        	$.ajax({
    			url:"../schedulde",
    			data:event,
    			type:"POST",
    			dataType:"json",
    			success:function(data,textStatus,jqXHR){ 					 
    				 let s2="";
    				for (var key in data) {
    					if (data.hasOwnProperty(key)) {
    					  s2+="<tr>";
    					  s2+="<td>"+data[key].scdl_id+"</td>";
    					  s2+="<td>"+data[key].scdl_date+"</td>";
    					  s2+="<td>"+data[key].flight_name+"</td>";
    					  s2+="<td>"+data[key].scdl_from+"</td>";
    					  s2+="<td>"+data[key].scdl_arrival+"</td>";
    					  s2+="<td>"+data[key].scdl_to+"</td>";
    					  s2+="<td>"+data[key].scdl_departure+"</td>";
    					  s2+="<td>"+data[key].scdl_distance+"</td>";
    					  s2+="<td>"+data[key].total_time+"</td>";
    					  s2+="<td>"+data[key].ticket_price+"</td>";
    					  s2+="<td>"+data[key].total_seats+"</td>";
    					  /*   s2+="<td></td>"; */
    					  s2+="<td><a href='#' class='btn btn-info btn-block FlightSchedule_Edit' data-id='"+data[key].scdl_id+"' id='"+data[key].scdl_id+"'>Edit</a>";
    					  s2+="<a href='#' class='btn btn-danger btn-block FlightSchedule_delete' data-id='"+data[key].scdl_id+"' id='"+data[key].scdl_id+"'>Delete</a></td></tr>";
    					   
    					}
    				}
    				$('#viewFlightScheduleBody').html(s2);
    				console.log("success...")
    	  			
    			},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    		}
    		});
			}
			 $(document).on('click', '.FlightSchedule_delete', function() {
				 scdl_id = $(this).attr('id');
                	  if (confirm('Are you sure you want to delete this?')) {
               $.ajax({
				    type:'POST',
				    url:'../schedulde',
					data:{'scdl_id':scdl_id,'event':'delete_flightSchedule'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
  						if(data==true){
	  		  				$('#msg').html("Successfully Deleted!");
  							$('#viewFlightScheduleBody').html('');
  		  					getData();
	  		  			}else{
	  		  				$('#msg').html("Something went wrong on server!");
	  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  		  			$('#msg').html(errorThrown);
  		  			}
				    });	
                	} //confirm end   
				 });
                });
		</script>
		 <script>
					
                 $(document).on('click', '.FlightSchedule_Edit', function() {
                	 scdl_id = $(this).attr('id');
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../schedulde',
					data:{'scdl_id':scdl_id,'event':'fatchFlightSchedule'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#scdl_id").val(data[0].scdl_id);
						$("#chooseFlight").val(data[0].flight_name);
	    				$("#chooseCountry").val(data[0].scdl_from);
	    				$("#setarival").val(data[0].scdl_arrival);
	    				$("#chooseToCountry").val(data[0].scdl_to);
	    				$("#setDept").val(data[0].scdl_departure);
	    				$("#tdisance").val(data[0].scdl_distance);
	    				$("#totalTime").val(data[0].total_time);
	    				$("#ticketprice").val(data[0].ticket_price);
	    				$("#totalseats").val(data[0].total_seats);
	    				$("#scdldate").val(data[0].scdl_date);
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
          </script> 
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
