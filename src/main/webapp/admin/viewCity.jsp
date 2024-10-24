<!DOCTYPE html>
<html>
	<head>
		<title> Flyaway-City</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View City
					</li>
				</ol>
			</div>
		</div>
		</div>
		<div><a href="addCity.jsp" class="btn btn-success text-white">
                Add New City <i class="fa fa-plus"></i>
            </a>
        </div>
       <hr>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i> View City
						</div>
					</div>
					<h4 id="msg" class=""style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead >
									<tr >
										<th>City Id</th>
										<th>City Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="cityBody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		
	<hr>
</div>	
</div>	
<!--Edit Modal dept-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit City</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../city" method="post" >
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">City Name</label>
							<div class="col-md-6">
									<input type="text" name="CityName" class="form-control" id="cityName" required>
										<input type="hidden" name="event" value="updateCity">
										<input type="hidden" id="cityId" name="city_id" value="">
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="updateCity" value="Update" class="btn btn-success form-control">
								</div>
							</div>
						</form>
      </div>
    </div>
  </div>
</div>

		<!--Add JavaScript Files-->
		<%@include file="include/Resources.jsp" %>
		<script>
		$(document).ready(function() {
			getData();
			function getData(){
	    	let event = "event=viewCity";
	    	//alert(event);
        	$.ajax({
    			url:"../city",
    			data:event,
    			type:"POST",
    			dataType:"json",
    			success:function(data,textStatus,jqXHR){ 					 
    				console.log(data);
    				let s2="";
    				for (var key in data) {
    					if (data.hasOwnProperty(key)) {
    					  s2+="<tr>";
    					  s2+="<td>"+data[key].city_id+"</td>";
    					  s2+="<td>"+data[key].city_name+"</td>";
    					  s2+="<td><a href='#' class='btn btn-info  city_edit' data-id='"+data[key].city_id+"' id='"+data[key].city_id+"'>Edit</a>";
    					  s2+=" &nbsp;<a href='#' class='btn btn-danger  city_delete' data-id='"+data[key].city_id+"' id='"+data[key].city_id+"'>Delete</a></td></tr>";
    					}
    				}
    				$('#cityBody').html(s2);
    				console.log("success...")
    	  		},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    		}});
			}
        	$(document).on('click', '.city_delete', function() {
				city_id = $(this).attr('id');
            	 if (confirm('Are you sure you want to delete this?')) {
            $.ajax({
			    type:'POST',
			    url:'../city',
				data:{'city_id':city_id,'event':'delete_city'},
				method:'POST',
				dataType:'JSON',
				success:function(data,textStatus,jqXHR){
					console.log(data);
					if(data==true){
  		  				$('#msg').html("Successfully Deleted!");
  		  				$('#cityBody').html('');
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
			 });//delete end
			 
        	});//ready close
		</script>
		
		 

           <script>
				
           </script>  
            <script>
					
                 $(document).on('click', '.city_edit', function() {
                	 city_id = $(this).attr('id');
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../city',
					data:{'city_id':city_id,'event':'fatchCityByCityId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#cityId").val(data[0].city_id);
	    				$("#cityName").val(data[0].city_name);
	    				
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
                 

			</script>
	</body>
</html>
