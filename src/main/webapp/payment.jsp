<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment</title>
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
<% int total=Integer.parseInt(request.getParameter("total")); %>

<%@include file="include/header.jsp" %>
<div class="container" style=" margin-bottom:13.5%;">
			<div id="page-wrapper">
			<h1 style="text-align:center;color:green;">Payment Details</h1><br>
				<div class="row">
				<div class="col-lg-12">
						<div class="table-responsive">
							<table class="table table-bordered table-striped">
							<form action = "./booking" method = "POST" id="myform">
								<thead>
									<tr>
										<th>Card Holder Name</th>
										<th>Card Number</th>
										<th>Expiration Date</th>
										<th>CVV Code</th>
										
									</tr>
								</thead>
								<tbody >
									<tr>
										<td><input type="text" name="hname" required></td>
										<td><input type="text" name="cnum" required></td>
										<td><input type="date" name="exdate" required></td>
										<td><input type="text" name="cvv" required></td>
										<input type="hidden" name="event" value="addpayment">
									</tr>
								</tbody>
							</table>
							<div><h1  style="border:2px solid black">Total Price : <% out.print(total);%></h1></div><br>
							<div>
								<button type="submit" name="" id="submit" class="btn btn-success">Submit</button>
							</div>
							
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
			<%@include file="include/footer.jsp" %>
		<!--Add JavaScript Files-->
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/bootstrap.min.js"></script>
		<script src="resources/js/sweetalert.min.js"></script>
</body>
</html>