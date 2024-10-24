
<!DOCTYPE html>
<html>
	<head>
	    <title>Flyaway-Airlines</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Airline
					</li>
				</ol>
			</div>
		</div>
		<div><a href="addFlight.jsp" class="btn btn-success text-white">
                Add New Airline <i class="fa fa-plus"></i>
            </a>
        </div>
        <hr>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i>View Airline
						</div>
					</div>
					<h4 id="msg" class="" style="text-align:center"></h4>
					<div class="panel-body">

						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Airline Name</th>
										<th>Airline No</th>
										<!-- <th>Flight Type</th>
										<th>From</th>
										<th>Departure Time</th>
										<th>To</th>
										<th>Arrival Time</th>
										<th>Total Time</th>
										<th>Km</th> -->
										<th>Action</th>
										
									</tr>
								</thead>
								<tbody id="viewFlightBody">
									
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
        <h5 class="modal-title" id="exampleModalLabel">Edit Airline</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../flight" method="post" >
        	<div class="form-group">
								<label for="" class="col-md-3 control-label">Airline Name</label>
								<div class="col-md-6">
									<input type="text" id="flightName" name="flightName" class="form-control" required>
									<input type="hidden"    name="event" value="updateFlight">
									<input type="hidden"  id="flight"  name="flightId" value="">
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Airline Number</label>
								<div class="col-md-6">
									<input type="text" id="flightNum"  name="flightNum" class="form-control" required>
								</div>
							</div>
				
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="submitFlight" value="Update Flight" class="btn btn-success form-control">
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
			getData();
			function getData(){
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
    					  s2+="<tr>";
    					  s2+="<td>"+data[key].flight_id+"</td>";
    					  s2+="<td>"+data[key].flight_name+"</td>";
    					  s2+="<td>"+data[key].flight_no+"</td>";
    					  s2+="<td><a href='#' class='btn btn-info btn-block flight_Edit' data-id='"+data[key].flight_id+"' id='"+data[key].flight_id+"'>Edit</a>";
    					  s2+="<a href='#' class='btn btn-danger btn-block flight_delete' data-id='"+data[key].flight_id+"' id='"+data[key].flight_id+"'>Delete</a></td></tr>";
    					   
    					}
    				}
    				$('#viewFlightBody').html(s2);
    				console.log("success...")
    	  			
    			},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    	}});
		}	
			 $(document).on('click', '.flight_delete', function() {
				 flight_id = $(this).attr('id');
                	  if (confirm('Are you sure you want to delete this?')) {
               $.ajax({
				    type:'POST',
				    url:'../flight',
					data:{'flight_id':flight_id,'event':'delete_flight'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
  						if(data==true){
	  		  				$('#msg').html("Successfully Deleted!");
	  		  			    $('#msg').addClass('green-text');
		  		  			$('#viewFlightBody').html('');
	  		  				getData();
	  		  			}else{
	  		  				$('#msg').html("Something went wrong on server!");
	  		  				$('#msg').addClass('red-text');
  		  				}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  		  			$('#msg').html(errorThrown);
  		  			$('#msg').addClass('red-text');
  					}
				    });	
                	} //confirm end   
				 });
   });
		</script>
	
			 <script>
					
                 $(document).on('click', '.flight_Edit', function() {
                	 flight_id = $(this).attr('id');
                	$("#editModal").modal("show");
                	
				$.ajax({
				    type:'POST',
				    url:'../flight',
					data:{'flight_id':flight_id,'event':'fatchFlightByflightId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#flight").val(data[0].flight_id);
	    				$("#flightName").val(data[0].flight_name);
	    				$("#flightNum").val(data[0].flight_no);
	    		},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
                 

			</script> 
	</body>
</html>
