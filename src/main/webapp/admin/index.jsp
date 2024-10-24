
<%
if (session.getAttribute("username") == null || session.getAttribute("username").equals(""))
{
	response.sendRedirect("login.jsp");
}

%>

<!DOCTYPE html>
<html>
<head>
	<title>flyawayAdminstrator</title>
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
		<h1 class="page-header dashHead"></h1>
		<ol class="breadcrumb">
			<li class="active">
				<i class="fa fa-dashboard"></i> Welcome to <% out.print(request.getSession().getAttribute("username")); %>
			</li>
		</ol>
	</div>
</div>


<div class="row">
	<div class="col-lg-4 col-md-6">
		<div class="panel panel-green">
			<div class="panel-heading">
				 <div class="row">
				 	<div class="col-xs-3">
				 		<i class="fa fa-shopping-basket fa-3x"></i>
				 	</div>
				 	<div class="col-xs-9 text-right">
				 		<div class="txt-big">
				 		
				 		</div>
				 		<div class="txt-sub">
				 			
				 		</div>	
				 	</div>
				 </div>
			</div>
			<a href="#">
				<div class="panel-footer">
					<span class="pull-left">More</span>
					<span class="pull-right"> <i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>	
	</div>
	<div class="col-lg-4 col-md-6">
		<div class="panel panel-purple">
			<div class="panel-heading">
				 <div class="row">
				 	<div class="col-xs-3">
				 		<i class="fa fa-navicon fa-3x"></i>
				 	</div>
				 	<div class="col-xs-9 text-right">
				 		<div class="txt-big">
				 			<?php
								countProducts();
							?>
				 		</div>
				 		<div class="txt-sub">
				 	
				 		</div>	
				 	</div>
				 </div>
			</div>
			<a href="index.php?viewproducts">
				<div class="panel-footer">
					<span class="pull-left"> More</span>
					<span class="pull-right"> <i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>	
	</div>	
	<div class="col-lg-4 col-md-6">
		<div class="panel panel-red">
			<div class="panel-heading">
				 <div class="row">
				 	<div class="col-xs-3">
				 		<i class="fa fa-dollar fa-3x"></i>
				 	</div>
				 	<div class="col-xs-9 text-right">
				 		<div class="txt-big">
				 			
				 		</div>
				 		<div class="txt-sub">
				 		
				 		</div>	
				 	</div>
				 </div>
			</div>
			<a href="#">
				<div class="panel-footer">
					<span class="pull-left"> More</span>
					<span class="pull-right"> <i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
			</a>
		</div>	
	</div>		
</div>

				
			</div>
		</div>
	</div>
	
	<!--Add JavaScript Files-->
	<%@include file="include/Resources.jsp" %>
	
	
		
</body>
</html>