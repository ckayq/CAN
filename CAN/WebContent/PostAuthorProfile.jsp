<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDAOImpl" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAOImpl" %>
<%@ page import="like.LikeDAO" %>
<%@ page import="like.LikeDAOImpl" %>

<%
    User userSession = (User) session.getAttribute("currentUser");

    if (userSession == null) {
        response.sendRedirect("LoginPage.jsp");
    }
    
	UserDAO userDAO = new UserDAOImpl();
	
	User user = new User();
	
	String postAuthorEmail = request.getParameter("postAuthorEmail");
	
	System.out.println(postAuthorEmail);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<title>Author Profile</title>
		
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/profile_style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
		
		<script src="https://kit.fontawesome.com/0e28daf7be.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div class="topnav">
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
		<div>
			<div class="profile-header">
				<div class="profile-img">
					<img src="<% out.println(userDAO.getAvatar(postAuthorEmail)); %>" width="200">
				</div>
				<div class="profile-nav-info">
					<h3 class="user-name"> 										
						<% 											
							String firstName = userDAO.getUserFirstName(postAuthorEmail);
							String lastName = userDAO.getUserLastName(postAuthorEmail);
									
							out.println(firstName + " " + lastName); 
						%> 
					</h3>
					<p class="status">
						Status: 
						<%
							String status = userDAO.getUserStatus(postAuthorEmail);
							
							out.println(status); 
						%>
					</p>
				</div>
			</div>
			<div class="main-bd">
				<div class="left-side">
					<div class="profile-side">
						<div class="user-bio">
							<h1>Bio</h1>
							<p class="bio"> 
								<% 										
									user = userDAO.getUserBio(postAuthorEmail);
							
									out.println(user.getBio()); 
								%> 
							</p>
						</div>
						<div class="user-info">
							<h1>User Info</h1>
							<p class="email"> <% out.println(postAuthorEmail); %> </p>
							<p class="phone">									
								<% 											
									user = userDAO.getUserPhoneNumber(postAuthorEmail);
							
									out.println(user.getPhoneNumber()); 
								%>
							</p>
						</div>
					</div>
				</div>
				<div class="right-side">
					<div class="profile-body">	
						<h1 class="spacing" style="color:white">Posts</h1>	
						<div class="row">
							<%
								List<Post> postList = userDAO.getUserPosts(postAuthorEmail);
								
								LikeDAO likeDAO = new LikeDAOImpl();
							
								for(Post post : postList) 
								{ %>
									<div class="holder">
										
									    <div class="post">
									    	<div class="post-head">
												<img src="<%out.println(userDAO.getAvatar(postAuthorEmail)); %>" alt="">
												<i class="far fa-user" > <% out.println(post.getPostAuthorEmail()); %> </i>
												<i class="far calendar"><% out.println(post.getPostCreationDate()); %> </i>
											</div>
									    	<div class="post-review" style="background-color:white;">
										        <h1 class="post-title" > <% out.println(post.getPostTitle()); %> </h1>
										        <p class="preview-text" > <% out.println(post.getPostBody()); %> </p>
										        
									      	</div>
									      	<div class="likes_number">
			      					      	<p class="likes_info" style="color:black; font-family:'Times New Roman', Times, serif">
										      	Likes: <% int likes = likeDAO.countLikesOnPost(post.getPostID(), post.getPostAuthorEmail());
										      				out.println(likes);
										      			%> 
									      	</p>
									      	</div>
		      								<form action="LikePost" method="post">
										      	<button type="submit" class="btn btn-outline-primary btn-sm float-right" value="Like Post">
							    		            <a class="btn btn-outline-primary btn-sm float-right">	
											      		<i class="fa fa-thumbs-o-up"></i> 
										      		</a>
							    		        </button>
										      	<input type="hidden" class="form-control" name="postID" value="<% out.print(post.getPostID()); %>"/>
										      	<input type="hidden" class="form-control" name="postAuthorEmail" value="<% out.println(post.getPostAuthorEmail()); %>"/>
										      	<input type="hidden" class="form-control" name="userWhoLiked" value="<% String email = userSession.getEmail();
																														out.println(email); %>">
									      </form>	
										</div>
									</div>
								<% }
							%>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</body>
</html>
