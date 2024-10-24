<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Login into Flyaway - Administrator Panel</title>
    
    <!-- Start - CSS Files Link -->
    <link rel="stylesheet" type="text/css" href="resources/css/adminlogin.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700,900" rel="stylesheet">
    <!-- End - CSS Files Link -->
    
    <!-- Start - JavaScript Files Link -->
    <script type="text/javascript" src="resources/js/jquery.min.js"></script>
    <!-- End - JavaScript Files Link -->
    
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<label for="" class="tab">Log In</label>
		
		<div class="login-form">
			<div class="sign-in-htm">
			 <form method="POST"  id="admin_login">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" name="email" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" name="password" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					
				</div>
				<div class="group">
					<input type="submit" class="button" value="Log In">
				</div>
		 </form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="../index.jsp">Go to Home Page! </a>
				</div>
			</div>
			
		</div>
	</div>
</div>
<script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		
  		$("#admin_login").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"../adminlogin",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  					/* console.log(data);
  					console.log(typeof(data)); */
  					if(parseInt(data.trim())==1){
  		  				alert("login Successful");
  		  			    window.location.href = 'index.jsp'; 
  		  			}else{
  		  				$('#msg').html("Something went wrong on server!")
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					//console.log(jqXHR.responseText);
  					console.log("error...")
  					$('#msg').html("Something went wrong on server!")
  		  		}
  			})
  		})
  	})
  </script>
<!-- End - Signup Box-->
</body>
</html>