<!DOCTYPE html>
<html>
	<head>
		<title> Flyaway-Country</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Country
					</li>
				</ol>
			</div>
		</div>
		</div>
		<div><a href="addCountry.jsp" class="btn btn-success text-white">
                Add New Country <i class="fa fa-plus"></i>
            </a>
        </div>
       <hr>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i> View Country
						</div>
					</div>
					<h4 id="msg" class=""style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead >
									<tr >
										<th>Country Id</th>
										<th>Country Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="countryBody">
									
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
        <h5 class="modal-title" id="exampleModalLabel">Edit country</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../country" method="post" >
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Country Name</label>
							<div class="col-md-6">
									<input type="text" name="countryName" class="form-control" id="countryName" required>
										<input type="hidden" name="event" value="updateCountry">
										<input type="hidden" id="countryId" name="country_id" value="">
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="updateCountry" value="Update" class="btn btn-success form-control">
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
    					  s2+="<tr>";
    					  s2+="<td>"+data[key].country_id+"</td>";
    					  s2+="<td>"+data[key].country_name+"</td>";
    					  s2+="<td><a href='#' class='btn btn-info  country_edit' data-id='"+data[key].country_id+"' id='"+data[key].country_id+"'>Edit</a>";
    					  s2+=" &nbsp;<a href='#' class='btn btn-danger  country_delete' data-id='"+data[key].country_id+"' id='"+data[key].country_id+"'>Delete</a></td></tr>";
    					}
    				}
    				$('#countryBody').html(s2);
    				console.log("success...")
    	  		},
    		error:function(jqXHR,textStatus,errorThrown){
    			console.log(jqXHR.responseText);
    				console.log("error...")
    		}});
			}//funtion getData() end
			$(document).on('click', '.country_delete', function() {
				country_id = $(this).attr('id');
                if (confirm('Are you sure you want to delete this?')) {
                $.ajax({
				    type:'POST',
				    url:'../country',
					data:{'country_id':country_id,'event':'delete_country'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
  						if(data==true){
	  		  				$('#msg').html("Successfully Deleted!");
	  		  				$('#countryBody').html('');
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
				 });//delete End
			});//ready close
		
		</script>
		  
            <script>
				 $(document).on('click', '.country_edit', function() {
                	country_id = $(this).attr('id');
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../country',
					data:{'country_id':country_id,'event':'fatchCountryByCounId'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						$("#countryId").val(data[0].country_id);
	    				$("#countryName").val(data[0].country_name);
	    				
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                	   
				 });
            </script>
	</body>
</html>
