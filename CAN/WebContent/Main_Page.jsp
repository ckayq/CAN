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
		
		<div class="spacing">
			<a href="CreatePostPage.jsp"><button class="button" type="button">Create Post</button></a>
		</div><br>
		<h1 class="spacing"> Recent Posts </h1>
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
					      <div class="card-body" style="background-color:powderblue;">
					        <h5 class="card-title" style="font-size:20px"> <% out.println(post.getPostTitle()); %> </h5>
					        <p class="card-text" style="font-size:24px"> <% out.println(post.getPostBody()); %> </p>
   					        <p class="card-text" style="font-size:12px" style="color:gray;"> Author: <% out.println(post.getPostAuthorEmail()); %> </p>
					        <p class="card-text" style="font-size:12px" style="color:gray;"> Posted on: <% out.println(post.getPostCreationDate()); %> </p>
					      </div>
					      <div class="card-footer">
					      <form action="LikePost" method="post">
					      	<button type="submit" class="btn btn-outline-primary btn-sm float-right" value="Like Post">
		    		            <a href="#!" class="btn btn-outline-primary btn-sm float-right">	
						      		<i class="fa fa-thumbs-o-up"></i> 
						      		
					      		</a>
		    		        </button>
					      	<input type="hidden" class="form-control" name="postID" value="<% out.print(post.getPostID()); %>"/>
					      	<input type="hidden" class="form-control" name="postAuthor" value="<% out.println(post.getPostAuthorEmail()); %>"/>
					      </form>
					      </div>
						</div>
					</div>		
					
				<% }
			%>
			
			</div>
		</div>			
	</body>
</html>