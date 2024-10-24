
<!DOCTYPE html>
<html>
	<head>
		<title>Flyaway-Admin</title>
		
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
						<i class="fa fa-dashboard"></i> Dashboard / View Admin
					</li>
				</ol>
			</div>
		</div>
		</div>
		<div><a href="addAdmin.jsp" class="btn btn-success text-white">
                Add New Admin <i class="fa fa-plus"></i>
            </a>
        </div>
        <hr>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="panel-title">
							<i class="fa fa-list"></i> View Admin
						</div>
					</div>
					<h4 id="msg" class=""style="text-align:center"></h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							
								<thead>
									<tr>
										<th>Id</th>
										<th>Admin Name</th>
										<th>Admin Email</th>
										<th>Admin Password</th>
										<th>Admin PNo</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody id="adminBody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>	
		<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!--Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Admin</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="../admin" method="post">
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Admin Name</label>
							<div class="col-md-6">
									<input type="text" name="adminName" class="form-control" id="adminName" required>
										<input type="hidden" name="event" value="updateAdmin">
										<input type="hidden" id="adminid" name="admin_Id" value="">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Admin Email</label>
								<div class="col-md-6">
									<input type="email" id="adminEmail" name="adminEmail" class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Admin Password</label>
								<div class="col-md-6">
									<input type="text" id="adminPasw" name="adminPass" class="form-control" required>
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label">Admin Phone No</label>
								<div class="col-md-6">
									<input type="text" id="adminPh" name="adminPNo" class="form-control" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="" class="col-md-3 control-label"></label>
								<div class="col-md-6">
									<input type="submit" name="updateadmin" value="Update" class="btn btn-success form-control">
								</div>
							</div>
						</form>
      </div>
    </div>
  </div>
</div>
<!--edit modal end  -->
		<!--Add JavaScript Files-->
		<%@include file="include/Resources.jsp" %>
		
		<script>
		$(document).ready(function() {
			getData();
			function getData(){
	        let event = "event=viewAdmin";
	        	$.ajax({
	    			url:"../admin",
	    			data:event,
	    			type:"POST",
	    			dataType:"json",
	    			success:function(data,textStatus,jqXHR){ 					 
	    				console.log(data);
	    				 let s="";
	    				for (var key in data) {
	    					if (data.hasOwnProperty(key)) {
	    					  s+="<tr>";
	    					  s+="<td>"+data[key].admin_id+"</td>";
	    					  s+="<td>"+data[key].admin_name+"</td>";
	    					  s+="<td>"+data[key].admin_email+"</td>";
	    					  s+="<td>"+data[key].admin_password+"</td>";
	    					/*  s+="<td><img src='admin/admin_img/"+data[key].admin_img+"' style='width:100%;height:100%'></td>"; */
	    					  s+="<td>"+data[key].admin_phnum+"</td>";
	    					  s+="<td><a href='#'class='btn btn-info btn-block admin_edit' data-id='"+data[key].admin_id+"' id='"+data[key].admin_id+"'>Edit</a>";
	    					  s+="<a href='#'class='btn btn-danger btn-block admin_delete' data-id='"+data[key].admin_id+"' id='"+data[key].admin_id+"'>Delete</a></td></tr>";
	    					}
	    				}
	    				$('#adminBody').html(s);
	    				console.log("success...")
	    	  		},
	    		error:function(jqXHR,textStatus,errorThrown){
	    			console.log(jqXHR.responseText);
	    			console.log("error...")
	    			} });
			}
			  $(document).on('click', '.admin_delete', function() {
             	 admin_Id = $(this).attr('id');
             	
             	  if (confirm('Are you sure you want to delete this?')) {
             		  
				$.ajax({
				    type:'POST',
				    url:'../admin',
					data:{'admin_Id':admin_Id,'event':'delete_admin'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						if(data==true){
	  		  				$('#msg').html("Successfully Deleted!");
	  		  			    $('#adminBody').html('');
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
					
                 $(document).on('click', '.admin_edit', function() {
                	admin_Id = $(this).attr('id');
                	$("#editModal").modal("show");
				$.ajax({
				    type:'POST',
				    url:'../admin',
					data:{'admin_Id':admin_Id,'event':'fatchAdminById'},
					method:'POST',
					dataType:'JSON',
					success:function(data,textStatus,jqXHR){
						console.log(data);
						$("#adminid").val(data[0].admin_id);
	    				$("#adminName").val(data[0].admin_name);
	    				$("#adminEmail").val(data[0].admin_email);
	    				$("#adminPasw").val(data[0].admin_password);
	    				$("#adminPh").val(data[0].admin_phnum);
	    		},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...");
  					}
				    });	
                });
           </script>
	</body>
</html>
