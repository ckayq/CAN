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
				<label class="logo">CAN</label>
				<ul>
					<li><h3 class="username">Hi, ${message} </h3></li>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="#">Store</a></li>
					<li><a href="#">Logout</a></li>
				</ul>
			</nav>
		</div>
		
		
		<div class="content clearfix">
			<div class="main-content">
					<input type="text" placeholder="Search...">
					<h1 class="recent-post-title">Recent Posts</h1>
					
					
					<div class="holder">
					<div class="post">
						<div class="post-review">
							<i class="far calendar">Mar 11, 2019</i>
							<h1 class="post-title"><a href="">Post Title</a></h1>
							<i class="far fa-user">John Hill</i>
							&nbsp;
							
							<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
							
						</div>
					</div>
					</div>
					
					<div class="holder">
					<div class="post">
						<div class="post-review">
							<i class="far calendar">Mar 11, 2019</i>
							<h1 class="post-title"><a href="">Post Title</a></h1>
							<i class="far fa-user">John Hill</i>
							&nbsp;
							<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
							
						</div>
					</div>
					</div>
					
					<div class="holder">
					<div class="post">
						<div class="post-review">
							<i class="far calendar">Mar 11, 2019</i>
							<h1 class="post-title"><a href="">Post Title</a></h1>
							<i class="far fa-user">John Hill</i>
							&nbsp;
							
							<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
							
						</div>
					</div>
					</div>
				
			</div>
			<div class="sidebar"></div>
		</div>
		
		
	</body>
</html>
