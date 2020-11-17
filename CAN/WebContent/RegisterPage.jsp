<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<title>Registration</title>
		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
		
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>	
	<body style="background-color:lightblue;">
	<br><br>
		<div class="container">
			<div class="card bg-light">
				<article class="card-body mx-auto" style="max-width: 400px;">
					<h4 class="card-title mt-3 text-center">Create Account</h4>
					<p class="text-center">Get started with your free account</p>	
					<p class="divider-text">
				    </p>
					<form action="Registration" method="post">
						<div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
							 </div>
					        <input name="email" class="form-control" placeholder="Email address" type="email">
					    </div>
						<div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
					        <input name="firstName" class="form-control" placeholder="First name" type="text">
					    </div> 
					    <div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
					        <input name="lastName" class="form-control" placeholder="Last name" type="text">
					    </div>
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
							</div>
					
					    	<input name="phoneNumber" class="form-control" placeholder="Phone number" type="text">
					    </div>
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
							</div>
					        <input name="password" class="form-control" placeholder="Create password" type="password">
					    </div> <!-- form-group// -->                                      
					    <div class="form-group">
					        <button type="submit" name="submit" value="Register" class="btn btn-primary btn-block">Create Account</button>
					    </div> <!-- form-group// -->      
					    <p class="text-center">Have an account? <a href="LoginPage.jsp">Log In</a> </p>                                                                 
					</form>
				</article>
			</div>
		</div> 
	</body>
</html>
