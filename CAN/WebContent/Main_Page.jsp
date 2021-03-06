<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List"%>
<%@ page import="user.User" %>
<%@ page import="post.Post" %>
<%@ page import="avatar.Avatar" %>
<%@ page import="post.PostDAOImpl" %>
<%@ page import="like.LikeDAO" %>
<%@ page import="like.LikeDAOImpl" %>
<%@ page import="avatar.AvatarDAO" %>
<%@ page import="avatar.AvatarDAOImpl" %>
<%@ page import="dbConnection.ConnectionProvider" %>
    
<%
    User userSession = (User) session.getAttribute("currentUser");

    if (userSession == null) {
        response.sendRedirect("LoginPage.jsp");
    }
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1" >
		<title>Home</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/main_style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
		<script src="https://kit.fontawesome.com/0e28daf7be.js" crossorigin="anonymous"></script>
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	</head>
	<body style="background:#d8ecf3">
		<div class="topnav" id="myTopnav">
			<nav>
				<input type="checkbox" id="check">
				<label for="check" class="checkbtn">
					<i class="fas fa-bars"></i>
				</label>
				<label class="logo"><a href="Main_Page.jsp"><img src="images/logo.png" height="60"></a></label>
				<ul>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="store_page.jsp">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		
		<div class="spacing">
			<h1> Recent Posts </h1>
			<a href="CreatePostPage.jsp"><button class="button" type="button">Create Post</button></a>
		
		</div><br>
		
		<div class="content clearfix">
			<div class="row">
			
			<%
				PostDAOImpl postDAO = new PostDAOImpl(ConnectionProvider.getConnection());
						
				LikeDAO likeDAO = new LikeDAOImpl();
						
				AvatarDAO avatarDAO = new AvatarDAOImpl();
				
				List<Post> postList = postDAO.getAllPosts();

				for(Post post : postList) 
				{ %>
					
					<div class="holder">
					    <div class="post">
					    	<div class="post-head">
					    		<img src="<% out.println(avatarDAO.getAuthorAvatar(post.getPostAuthorEmail())); %>" alt="images/default.jpg">
					       	    <i class="far calendar"> <% out.println(post.getPostCreationDate()); %> </i>
					       	    
					    		<form action="PostAuthorProfile.jsp" method="post">
					    			<i class="far fa-user" > 
					    				<% out.print(post.getPostAuthorEmail());%>
					    			</i>
					    			<button class="author_btn" name="postAuthorEmail" value="<% out.print(post.getPostAuthorEmail()); %>">See Profile</button>
					    		</form>
					    		
					    	</div>
					    
					    
					      <div class="post-review" style="background-color:white;">
					        <h1 class="post-title"> <% out.println(post.getPostTitle()); %> </h1>
					        
					        <p class="preview-text" > <% out.println(post.getPostBody()); %> </p>
					      </div>
					      
					      <p class="likes_info" style="color:black; font-family:'Times New Roman', Times, serif">
					      	Likes: <% int likes = likeDAO.countLikesOnPost(post.getPostID(), post.getPostAuthorEmail());
					      				out.println(likes);
					      			%> 
					      </p>
					      <form action="LikePost" method="post">
					      	<button type="submit" class="btn btn-outline-primary btn-sm float-right" value="Like Post">
						      		<i class="fa fa-thumbs-o-up"></i> 
		    		        </button>
					      	<input type="hidden" class="form-control" name="postID" value="<% out.print(post.getPostID()); %>"/>
					      	<input type="hidden" class="form-control" name="postAuthorEmail" value="<% out.println(post.getPostAuthorEmail()); %>"/>
					      	<input type="hidden" class="form-control" name="userWhoLiked" value="<% String email = userSession.getEmail();
																									out.println(email); %>">
					      </form>
						</div>
					</div>			
				<% }%>
			</div>
		</div>			
	</body>
</html>
