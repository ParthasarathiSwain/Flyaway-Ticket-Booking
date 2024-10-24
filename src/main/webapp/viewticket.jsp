<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket</title>
<!--Add CSS Files-->
		
		<link rel="stylesheet" type="text/css" href="resources/css/ticket.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js">
</head>
<body>

<!-- <br><br>

		<div class="container" >
			<div id="page-wrapper">
			<h1 style="text-align:center;color:Blue;">Your Ticket</h1>
				<div class="row">
					<div class="col-lg-12">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Booking ID</th>
										<th>Name</th>
										<th>Email</th>
										<th>Airlines</th>
										<th>Departure</th>
										<th>Arrival</th>
										<th>Source</th>
										<th>Destination</th>
										<th>Total Distance</th>
										<th>Total Person</th>
										<th>Class</th>
										<th>BookingDate</th>
										<th>Ticket Fare</th>
									</tr>
								</thead>
								<tbody id="viewTickets">
									
								</tbody>
							</table>
							
						</div>
						
					</div>
				</div>
				<br>
				
						
						
					</div>
				</div> -->
				
				
<!-- new ticket start -->


<div class="ticket" id="ticket">
	<div id="barBig">
		<!-- <img src="https://www.incimages.com/uploaded_files/image/1024x576/*Barcode_32896.jpg" alt="Bar Code"> -->
	</div>
	<div id="mainInfo">
		<div class="passenger-info-container">
		<div class="passenger-info">
				<span>ID</span>
				<span class="details" id="bookingId"></span>
			</div>
			<div class="passenger-info" >
				<span>Name </span>
				<span class="details" id="cusName"></span>
			</div>
			<div class="passenger-info">
				<span>Flight Name</span>
				<span class="details" id="flightName"></span>
			</div>
			<div class="passenger-info">
				<span>Booking Date</span>
				<span class="details" id="bookingDate"></span>
			</div>
			<div class="passenger-info">
				<span>Seat</span>
				<span class="details">8C</span>
			</div>
		</div>
		<h1 class="destination" id="scdl_from"></h1>
			<img src="https://i.pinimg.com/originals/e9/0a/29/e90a299a041b7d37cdafc6eb2905e9d6.png" alt="Destination">
			<h1 class="destination" id="scdl_to"></h1>
		<div class="flight-info-container">
			<div class="flight-info">
				<span>Gate</span>
				<span>D 12</span>
			</div>
			<div class="flight-info">
				<span>Class</span>
				<span id="class"></span>
			</div>
			<div class="flight-info">
				<span>Departure Time</span>
				<span id="departure"></span>
			</div>
			<div class="flight-info">
				<span>Arrival Time</span>
				<span id="arrival"></span>
			</div>
			<div class="flight-info">
				<span>Bookinh Fare</span>
				<span id="bookingfare"></span>
			</div>
		</div>
		<p class="note">Gate closes 20 minutes before departure</p>
	</div>
	<div id="circles">
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
		<div class="circle"></div>
	</div>
	<div id="sideInfo">
		<img src="https://www.incimages.com/uploaded_files/image/1024x576/*Barcode_32896.jpg" alt="Small Bar" id="barSmall">
		<div class="details-container">
			<div class="flight-details">
				<div>
					<span>Name</span>
					<span id="name2"></span>
				</div>
				<div>
					<span>Flight Name</span>
					<span id="fname2"></span>
				</div>
				<div>
					<span>Date</span>
					<span id="date2">11/7/21</span>
				</div>
				<div>
					<span>Seat</span>
					<span>8C</span>
				</div>
			</div>
			<div class="destination-details">
				<h5 id="scdl_from2"></h5>
				<img src="https://i.pinimg.com/originals/e9/0a/29/e90a299a041b7d37cdafc6eb2905e9d6.png" alt="Destination">
				<h5  id="scdl_to2"></h5>
			</div>
		</div>
	</div>
</div>
			<!-- new ticket end -->
		
		<br>
		
<!--Add JavaScript Files-->
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/sweetalert.min.js"></script>
		

		
	
		
		
		<script>
		$(document).ready(function() {
		
	    	let event = "event=viewTicket";
	    	//alert(event);
        	$.ajax({
    			url:"./booking",
    			data:event,
    			type:"POST",
    			dataType:"JSON",
    			success:function(data,textStatus,jqXHR){
    			
    				$('#cusName').html(data[0][0]);				/*cusName */
    				$('#flightName').html(data[0][2]);			/*flight_name */
    				$('#bookingDate').html(data[0][10]);		/*booking_date */
    				$('#bookingId').html(data[0][8]);			/*booking_id */
    				$('#scdl_from').html(data[0][5]);			/*scdl_from */
    				$('#scdl_to').html(data[0][6]);				/*scdl_to */
    				$('#departure').html(data[0][3]);			/*scdl_departure */
    				$('#arrival').html(data[0][4]);				/*scdl_arrival */
    				$('#class').html(data[0][12]);				/*booking_class */
    				$('#bookingfare').html(data[0][9]);
    				
    				
    				$('#name2').html(data[0][0]);				/*cusName */
    				$('#fname2').html(data[0][2]);				/*flight_name */
    				$('#date2').html(data[0][10]);				/*booking_date */
    				$('#scdl_from2').html(data[0][5]);			/*scdl_from */
    				$('#scdl_to2').html(data[0][6]);			/*scdl_to */
    			//	alert(data[0][0])
    			//	let s2="";
    			//	for (var key in data) {
    					
    				//	if (data.hasOwnProperty(key)) {
    				//	alert(data[0][0])	$("#cusname").val(data[0][0]);
    				//	  s2+="<tr>";
    				//	  s2+="<td>"+data[0][0]+"</td>";				/*cusName */
    				//	  s2+="<td>"+data[0][8]+"</td>";				/*booking_id */
    					 
   	   				//	  s2+="<td>"+data[0][1]+"</td>";				/*email */
   	   				//	  s2+="<td>"+data[0][2]+"</td>";				/*flight_name */
   	   				//	  s2+="<td>"+data[0][3]+"</td>";				/*scdl_departure */
   	   				//	  s2+="<td>"+data[0][4]+"</td>";				/*scdl_arrival */
   	   				//	  s2+="<td>"+data[0][5]+"</td>";				/*scdl_from */
   	   				//	  s2+="<td>"+data[0][6]+"</td>";				/*scdl_to */
   	   				//	  s2+="<td>"+data[0][7]+"</td>";				/*scdl_distance */
   	   				// 	  s2+="<td>"+data[0][11]+"</td>";				/*total_person */
	   				//	  s2+="<td>"+data[0][12]+"</td>";				/*booking_class */
	   				//	  s2+="<td>"+data[0][10]+"</td>";				/*booking_date */
	   				//	  s2+="<td>"+data[0][9]+"</td>"; 			/*booking_fare */
   	   				//	  s2+="</tr>";
    					
    				//	}
    				//}
    			//	$('#viewTickets').html(s2);
    				
    				console.log("success...")
    	  		},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    		}
    	  });
       });
		</script>
</body>
</html>
