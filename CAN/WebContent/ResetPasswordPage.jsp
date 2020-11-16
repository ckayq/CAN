<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Reset Password</title>
		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" />
		
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>  
	<body style="background-color:blue;">
		<br><br>
		<div class="container">
			<div class="card bg-light">
				<article class="card-body mx-auto" style="max-width: 400px;">
					<h4 class="card-title mt-3 text-center">Reset Password</h4>
					<p class="text-center">Enter account details below to reset password</p>
						
					<p class="divider-text"></p>
					
					<form action="ResetPassword" method="post">
						<h5>${wrongDataMessage}</h5>
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
							 </div>
							 <input name="email" class="form-control" placeholder="Email" type="email">
					    </div> 
					    
					   <div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
					        <input name="firstName" class="form-control" placeholder="First Name" type="text">
					    </div> 
					    
					    <div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
					        <input name="lastName" class="form-control" placeholder="Last Name" type="text">
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
					        <input name="newPassword" class="form-control" placeholder="Enter new password" type="password">
					    </div> 
					                                   
					    <div class="form-group">
					        <input type="submit" name="submit" value="Reset Password" class="btn btn-primary btn-block">
					    </div>      
					    <p class="text-center">Have an account? <a href="LoginPage.jsp">Log In</a> </p>                                                                 
					</form>
				</article>
			</div> 
		</div> 
	</body>
</html>
