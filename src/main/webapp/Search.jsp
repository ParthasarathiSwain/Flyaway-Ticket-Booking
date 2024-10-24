<!DOCTYPE html>
<html>
	<head>
	  
		
		<!--Add CSS Files-->
		<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
		<link rel="stylesheet" type="text/css" href="resources/css/adminstyle.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
		
		
	</head>
<body>
<%@include file="include/header.jsp" %>


<br>
<div class="container" style=" margin-bottom:6%;">
	<div id="page-wrapper">
	<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
				<div class="panel-body">
			<form class="form-horizontal" action="#" method="post" id="myform" >
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Source</label>
								<div class="col-md-6">
									<select name="source"  class="form-control" id="chooseCountry" onchange="myFunction()">
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Destination</label>
								<div class="col-md-6">
									<select name="destination"  class="form-control" id="chooseToCountry">
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Date</label>
								<div class="col-md-6">
									<input type="date" name="scdldate" class="form-control" required>
									<input type="hidden" name="event" value="viewAvilableFlight" class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="search" value="Search" class="btn btn-success form-control">
								</div>
							</div>
						</form>
						<br>
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Airlines</th>
										<th>Departure</th>
										<th>Source</th>
										<th>Arrival</th>
										<th>Destination</th>
										<th>Ticket Price</th>
										<th>Available Seats</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="viewFlightList">
									
								</tbody>
							</table>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>		
		<br>
<%@include file="include/footer.jsp" %>
<!--Add JavaScript Files-->
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/sweetalert.min.js"></script>
 <script>
 $("#myform").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"./schedulde",
  				data:f,
  				type:'POST',
  				dataType:'JSON',
  				success:function(data,textStatus,jqXHR){
				console.log(data);
   				 let s2="";
   				for (var key in data) {
   					if (data.hasOwnProperty(key)) {
   					  s2+="<tr>";
   					  s2+="<td>"+data[key].flight_name+"</td>";
   					  s2+="<td>"+data[key].scdl_departure+"</td>";
   					  s2+="<td>"+data[key].scdl_from+"</td>";
   					  s2+="<td>"+data[key].scdl_arrival+"</td>";
   					  s2+="<td>"+data[key].scdl_to+"</td>";
   					  s2+="<td>"+data[key].ticket_price+"</td>";
   					  s2+="<td>"+data[key].total_seats+"</td>";
   					  s2+="<td><a href='booking.jsp?id="+data[key].scdl_id+"' class='btn btn-info ' data-id= id='"+data[key].scdl_id+"'>Book Now</a></td>";
   					  s2+="</tr>";
   					}
   				}
   				$('#viewFlightList').html(s2);
   				console.log("success...")
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log(data);
  					console.log("error...")
  				}
  			});
  		});
  
  </script>
		
		<script>
		$(document).ready(function() {
		
	    	let event = "event=viewCountry";
	    	//alert(event);
        	$.ajax({
    			url:"country",
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
		function myFunction() {
			/* $("#chooseToCountry").prop('disabled',false);
			  var x = document.getElementById("chooseCountry").value;
			  $("#chooseToCountry option[value='"+x+"']").attr("disabled","disabled"); */
			}
		</script>
</body>