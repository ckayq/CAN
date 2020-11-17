<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List"%>
<%@ page import="user.User" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAOImpl" %>
<%@ page import="like.LikeDAO" %>
<%@ page import="like.LikeDAOImpl" %>
<%@ page import="dbConnection.ConnectionProvider" %>
    
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
		<title>Home</title>
		
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/main_style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
		<script src="https://kit.fontawesome.com/0e28daf7be.js" crossorigin="anonymous"></script>
		
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/like.js" type="text/javascript"></script>
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
			<div class="row">
			
			<%
				PostDAOImpl postDAO = new PostDAOImpl(ConnectionProvider.getConnection());
						
				LikeDAO likeDAO = new LikeDAOImpl(ConnectionProvider.getConnection());
				
				List<Post> postList = postDAO.getAllPosts();
				
				for(Post post : postList) 
				{ %>
					
					<div class="col-sm-3 mt-4">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title"> <% out.println(post.getPostTitle()); %> </h5>
					        <p class="card-text"> <% out.println(post.getPostBody()); %> </p>
					        <p class="card-text"> Author: <% out.println(post.getPostAuthorEmail()); %> </p>
					        <p class="card-text"> Posted on: <% out.println(post.getPostCreationDate()); %> </p>
					      </div>
					      <div class="card-footer">
					      	<a href="#!" class="btn btn-outline-primary btn-sm float-right" onclick="doLike('<% out.print(post.getPostID()); %>', '<% out.print(user.getEmail()); %>')">	
					      		<i class="fa fa-thumbs-o-up"></i> 
					      		<span class="like-counter"><% likeDAO.countLikesOnPost(post.getPostID()); %></span>
					      	</a>
					      </div>
						</div>
					</div>		
					
				<% }
			%>
			
			</div>
		</div>			
	</body>
</html>