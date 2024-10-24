<%
if (session.getAttribute("username") == null || session.getAttribute("username").equals(""))
{
	response.sendRedirect("login.jsp");
}%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<!--Add CSS Files-->
	    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
		<link rel="stylesheet" type="text/css" href="resources/css/adminstyle.css">
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<link rel="stylesheet"  type="text/css" href="resources/font-awesome/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
		<style type="text/css">
			#submit{
			position: absolute;
            left: 92%;!important
			}
			
		</style>
</head>
<body>
<%@include file="include/header.jsp" %>
<br>
		<div class="container" style=" margin-bottom:7%;">
			<div id="page-wrapper">
			<!-- <h1 style="text-align:center;color:green;">Booking</h1><br> -->
				<div class="row">
					<div class="col-lg-12">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Airlines</th>
										<th>Departure</th>
										<th>Source</th>
										<th>Arrival</th>
										<th>Destination</th>
									</tr>
								</thead>
								<tbody id="viewFlightList">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-lg-12">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Class</th>
										<th>Total Person</th>
										<th>Date</th>
										<th>Ticket Price</th>
									</tr>
								</thead>
								<form action = "./booking" method = "POST" id="myform">
								<tbody >
								 
									<tr>
										<td>
											<div class="form-check">
  												<input class="form-check-input" type="radio" name="option" id="a1" value="First"  >
  												<label class="form-check-label" for="a1">
   												 First Class
									 			 </label>
											</div>
										
											<div class="form-check">
  												<input class="form-check-input" type="radio" name="option" id="a2" value="Business" checked>
  												<label class="form-check-label" for="a2">
   												 Business Class
									 			 </label>
											</div>
											<div class="form-check">
  												<input class="form-check-input" type="radio" name="option" id="a3" value="Economy" >
  												<label class="form-check-label" for="a3">
   												 Economy Class
									 			 </label>
											</div>
										</td>
									
										<td><input type="number"  min="1" max="5"  value="1" id="personNo" name="totalperson" required><spam>Max 5 Person Allowed</spam></td>
										<td><input type="date" name="date" required></td>
										<td id="price" ></td>
										<input type="hidden" id="hnd_total_price" name="totalPrice"/>
										<input type="hidden" id="hnd_price"/>
										<input type="hidden" name="event" value="ticketbooking"/>
										<input type="hidden" id="scdlid" name="sc_id" />
									</tr>
									
								</tbody>
							</table>													
						<div>
							<button type="submit"  class="btn btn-primary" id="submit" >Proceed</button>
						</div>
						<br>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<%@include file="include/footer.jsp" %>
		<!--Add JavaScript Files-->
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/sweetalert.min.js"></script>
		 
  	<script type="text/javascript">
		$(document).ready(function() {
			
	        	let scdl_id='<%=Integer.parseInt(request.getParameter("id"))%>';
	        	$.ajax({
	    			url:"./schedulde",
	    			data:{'scdl_id':scdl_id,'event':'getScheduleFlight'},
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				let s2="";
	    				
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    						let ticketprice=data[key].ticket_price;
	    						$('#price').html(ticketprice);
	    						$('#hnd_price').val(ticketprice);
	    						$('#hnd_total_price').val(ticketprice);
	    						$('#scdlid').val(scdl_id);
	    						  s2+="<tr>";
	    	   					  s2+="<td>"+data[key].flight_name+"</td>";
	    	   					  s2+="<td>"+data[key].scdl_departure+"</td>";
	    	   					  s2+="<td>"+data[key].scdl_from+"</td>";
	    	   					  s2+="<td>"+data[key].scdl_arrival+"</td>";
	    	   					  s2+="<td>"+data[key].scdl_to+"</td>";
	    	   					  s2+="</tr>";
	    	   					
	    					}
	    				}
	    				$('#viewFlightList').html(s2);
	    				
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    				console.log("error...")
	    			}
	    	});
	        	$('#personNo').change(function () {
	        		var pn=$(this).val();
	        		var price=$('#hnd_price').val();
	        		total_amount(pn,price);
	        		
	        	});
	        	 $('#personNo').keyup(function () {
	        		 var pn=$(this).val();
	        		 var price=$('#hnd_price').val();
	        		 total_amount(pn,price);
	        		 
	        	 });
	        	 function total_amount(pn,price){
	        		 total=parseInt(pn)*parseInt(price);
	        		 $('#price').text(total);
	        		 $('#hnd_total_price').val(total);
	        	 }
		});
	   </script>

</body>
</html>