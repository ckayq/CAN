<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@ page import="user.User" %>
<%@ page import="post.Post" %>
    
<%

    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("LoginPage.jsp");
    }

	String userName = user.getFirstName();
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home Page</title>
		
		<link rel="stylesheet" href="nav_style.css">
		<link rel="stylesheet" href="main_style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
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
					<li><a href="store_page.jsp">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		
		<div class="container">
			<div class="row">
				<h1>
					Hi, <% out.println(userName); %>
				</h1>
				<li><a href="CreatePostPage.jsp">Create Post</a></li>
			</div>
		</div>
		
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