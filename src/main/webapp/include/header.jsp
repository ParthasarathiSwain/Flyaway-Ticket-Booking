<!--	Start Top-->
<div class="top" style="background-color:#34104b">
<!--		Start Container-->
		<div class="container">
			
			<div class="col-md-6 ">
			
				<h1 class="logotext">Flyaway</h1>
			
				
			</div>
			
			<div class="col-md-6">
<!--				Start Menu-->
				<%
					String username = (String) session.getAttribute("username");
					if(username != "" && username != null){	
				%>
					<ul class="menu">
					<li><span style="color:white">Welcome <b><% out.print(username);%></b></span></li>
					<li><a href="logout.jsp" class="">Logout</a></li>
					
				</ul>
				<% 
					}else{
						%>
					<ul class="menu">
					<li><a href="admin/login.jsp" class="">Admin Login</a></li>
					<li><a href="login.jsp" class="">Login / Register</a></li>
				<%	
					}
			    %>
				</ul>
			</div>
				
		</div>
		
	</div>
	
<!--	Navigation Bar Start-->
	
	<div class="navbar " id="navbar">
		<div class="container">
			<div class="navbar-header">
					<img src="resources/img/flogo.png" alt="logo" class="logo">
				
				
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
					<span class="sr-only">Toggle Navigation</span>
					<i class="fa fa-align-justify"></i>
				</button>
				
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
					<span class="sr-only">Toggle Search</span>
					<i class="fa fa-search"></i>
				</button>
			</div>
			
			<div class="navbar-collapse  collapse" id="navigation">
				<div class="padding-nav">
					 	<ul class="nav navbar-nav navbar-left">
					 		<li class="active">
					 			<a href="index.jsp">Home</a>
					 		</li>
					 		
					 		<li>
					 			<a href="Search.jsp">Search Flight</a>
					 		</li>
					 		<!-- <li>
					 			<a href="#">All Flights</a>
					 		</li>
					 		<li>
					 			<a href="#">Contact Us</a>
					 		</li>
					 		 -->
					 	</ul>
				</div>
				
				
				
				<div class="navbar-collapse collapse right">
					<button type="button" class="btn btn-info navbar-btn" data-toggle="collapse" data-target="#search">
						<span class="sr-only">Toggle Search</span>
						<i class="fa fa-search"></i>
					</button>
				</div>
				
				<div class="collapse clearfix" id="search">
					<form class="navbar-form" method="get" action="result.php">
						<div class="input-group">
							<input class="form-control" type="text" placeholder="Search" name="user_query" required>
							<span class="input-group-btn">
								<button type="submit" value="Search" name="search" class="btn btn-info">
								<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
					
			</div>
			
		</div>
	</div>
		