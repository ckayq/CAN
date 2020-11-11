<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="nav_style.css">
		<link rel="stylesheet" href="main_style.css">
		<script src="https://kit.fontawesome.com/a076d05399.js%22%3E"></script>
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
					<li><a href="LoginPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		<h1>
			Hi, ${message} 
		</h1>
	</body>
</html>
