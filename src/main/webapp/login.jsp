<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="resources/css/login.css">
	
<meta charset="ISO-8859-1">
<title>login</title>
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Log In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Register</label>
		<div class="login-form">
			<div class="sign-in-htm">
			<form action="" method="post" id="form1">
				<div class="group">
					<label for="user" class="label">Email</label>
					<input id="user" name="email" type="text" class="input" required>
					<input type="hidden" name="event" value="loginCustomer">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" name="pass" type="password" class="input" data-type="password" required>
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Log In">
				</div>
			</form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="#forgot"></a>
				</div>
			</div>
			<div class="sign-up-htm">
			<h4 id="msg"></h4>
			<form action="" method="post" id="form2" >
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" name="uname" type="text" class="input" required>
					<input type="hidden" name="event" value="registerCustomer">
				</div>
				<div class="group">
					<label for="phone" class="label">Mobile No</label>
					<input id="phone" name="mobileno"  type="text" class="input" required >
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" name="password" type="password" class="input" data-type="password" required>
				</div>
				<div class="group">
					<label for="cpass" class="label">Repeat Password</label>
					<input id="cpass" name="cpass"  type="password" class="input" data-type="password" required>
				</div>
				<div class="group">
					<label for="email" class="label">Email Address</label>
					<input id="email" name="emailid"  type="email" class="input" required>
				</div>
				<div class="group">
					<label for="address" class="label"> Address</label>
					<textarea id="address" name="addrs" type="text" class="input" required></textarea>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Register" >
				</div>
			</form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<label for="tab-1"><a>Already Member?</a></label>
				</div>
			</div>
		</div>
	</div>
</div>
	
<!--Add JavaScript Files-->
	<script src="resources/js/jquery.min.js"></script>	
	<script src="resources/js/bootstrap.min.js"></script>
	
<script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		
  		$("#form2").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"customer",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  				
  					if(data=='true'){
  		  				$('#msg').html("Successfully Registred!")
  		  			}else{
  		  				$('#msg').html("Something Wrong !")
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...")
  					$('#msg').html("Something went wrong on server!")
  		  		  				}
  			})
  		})
  	})
  </script>
  <script>
  	$(document).ready(function(){
  		console.log("page is ready .....")
  		
  		$("#form1").on('submit',function(event){
  			event.preventDefault();
			var f=$(this).serialize();
			
  			$.ajax({
  				url:"customer",
  				data:f,
  				type:'POST',
  				success:function(data,textStatus,jqXHR){
  				
  					if(data=='true'){
  						alert('login successfully !');
  						window.location.href = 'index.jsp';
  		  			}else{
  		  				alert('login Failed !');
  		  			}
  				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log("error...")
					alert('login Failed !');
  		  		  				}
  			})
  		})
  	})
  </script>
</body>
</html>