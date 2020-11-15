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
				<label class="logo">WWW</label>
				<ul>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="#">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		
		<% 
			String email = (String) session.getAttribute("email");
		%>
		
		<h1>
			Hi, ${ message } <% out.println(email); %> 
		</h1>
		
		<div class="content clearfix">
			<div class="main-content">
					<h1 class="recent-post-title">Recent Posts</h1>
					<div class="post">
						<img scr="" alt="">
						<div class="post-review">
							<h1><a href="">Post Title</a></h1>
							<i class="far fa-user">John Hill</i>
							&nbsp;
							<i class="far calendar">Mar 11, 2019</i>
							<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
							<a href="" class="btn read-more">Read More</a>
						</div>
					</div>
					
					<div class="post">
						<img scr="" alt="">
						<div class="post-review">
							<h1><a href="">Post Title</a></h1>
							<i class="far fa-user">John Hill</i>
							&nbsp;
							<i class="far calendar">Mar 11, 2019</i>
							<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
							<a href="" class="btn read-more">Read More</a>
						</div>
					</div>
					
					<div class="post">
						<img scr="" alt="">
						<div class="post-review">
							<h1><a href="">Post Title</a></h1>
							<i class="far fa-user">John Hill</i>
							&nbsp;
							<i class="far calendar">Mar 11, 2019</i>
							<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
							<a href="" class="btn read-more">Read More</a>
						</div>
					</div>
				
			</div>
			<div class="sidebar"></div>
		</div>
		
		
	</body>
</html>