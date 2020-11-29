<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@ page import="user.User" %>
    
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
		
		<title>My Profile</title>
		
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/profile_style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
		<script src="https://kit.fontawesome.com/a076d05399.js"></script>
	</head>
	<body>
		<div class="topnav">
			<nav>
				<input type="checkbox" id="check">
				<label for="check" class="checkbtn">
					<i class="fas fa-bars"></i>
				</label>
				<label class="logo"><a href="Main_Page.jsp">WWW</a></label>
				<ul>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="store_page.jsp">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6" style="border: 1px solid black;">
					<h1>Image</h1>
				</div>
				<div class="col-md-4 offset-md-2" style="border: 1px solid black;">
					<h1>
						<% out.println(user.getEmail()); %>
						<% out.println(user.getPhoneNumber()); %>
						<% out.println(user.getFirstName()); %>
						<% out.println(user.getLastName()); %>
						<% out.println(user.getBio()); %>
						<% out.println(user.getCoins()); %>
						<% out.println(user.getPassword()); %>
					</h1>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="leftcolumn col col-md-12">
				<div class="card">
					<h2>About Me</h2>
				</div>
				<div class="card">
					<h2>Popular Posts</h2>
				</div>
			</div>
			<div class="rightcolumn">
				<div class="card">
					<h2>Post Title</h2>
					<h5>Post description</h5>
				</div>
			</div>
		</div>
	</body>
</html>
