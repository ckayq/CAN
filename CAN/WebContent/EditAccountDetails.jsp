<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>    
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDAOImpl" %>
<%@ page import="avatar.Avatar" %>
<%@ page import="avatar.AvatarDAOImpl" %>
<%@ page import="dbConnection.ConnectionProvider" %>
  
<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("LoginPage.jsp");
    }

%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<title>Update Account Details</title>
		
		<link rel="stylesheet" href="css/nav_style.css">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" />
		
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>  
	<body style="background-color:lightblue;">
			<div class="topnav">
			<nav>
				<input type="checkbox" id="check">
				<label for="check" class="checkbtn">
					<i class="fas fa-bars"></i>
				</label>
				<label class="logo"><a href="Main_Page.jsp"><img src="images/logo.png" height="58"></a></label>
				<ul>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="store_page.jsp">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		<br><br>
		<div class="container">
			<div class="card bg-light">
				<article class="card-body mx-auto" style="max-width: 400px;">
					<h5>${emptyInputMessage}</h5>
					<h4 class="card-title mt-3 text-center">Update Account Details</h4>
					<p class="text-center">Update account details below</p>
					<p class="divider-text"></p>
					<form action="UpdateAccountDetails" method="post">
					   <div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
					        <input name="firstName" class="form-control" placeholder="First Name" type="text" maxlength="20">
					    </div> 
					    <div class="form-group input-group">
							<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
							 </div>
					        <input name="lastName" class="form-control" placeholder="Last Name" type="text" maxlength="20">
					    </div> 
					    <div class="form-group">
   		    		        <label for="description">Bio</label>
		    		        <textarea rows="5" class="form-control" name="bio" maxlength="255"></textarea>
		    		    </div>
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
							</div>
					    	<input name="phoneNumber" class="form-control" placeholder="Phone number" type="text" maxlength="10">
					    </div> 
					    <div class="form-group input-group">
					    	<div class="input-group-prepend">
							    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
							</div>
					        <input name="newPassword" class="form-control" placeholder="Enter new password" type="password" maxlength="20"> 
					    </div>  
					    <div class="form-group">
   		    		        <label for="ChangeAvatar">Change Avatar</label>
		    		          <select name="ChangeAvatar" id="cars">
							
   						<%
							AvatarDAOImpl avatarDAO = new AvatarDAOImpl();
   							
   		    		        List<Avatar> avatarList = avatarDAO.getAllAvatar(user.getEmail());
   									
   							for(Avatar avatar : avatarList) 
   							{ %>
							    <option value="<%out.println(avatar.getAvatar());%>"> <% out.println(avatar.getAvatar());%> </option>
								<% }
							%>
							  </select>
		    		    </div>                     
					    <div class="form-group">
					        <input type="submit" name="submit" value="Update" class="btn btn-primary btn-block">
					    </div> 
					 	<input type="hidden" class="form-control" name="email" value="<% out.print(user.getEmail()); %>"/>                                                               
					</form>
				</article>
			</div> 
		</div> 
	</body>
</html>