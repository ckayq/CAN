<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDAOImpl" %>
<%@ page import="post.Post" %>
<%@ page import="post.PostDAOImpl" %>

<%
    User userSession = (User) session.getAttribute("currentUser");

    if (userSession == null) {
        response.sendRedirect("LoginPage.jsp");
    }
    
	UserDAO userDAO = new UserDAOImpl();
	
	User user = new User();
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<title>My Profile</title>
		
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/profile_style.css">
	</head>
	<body>
		<div class="topnav">
			<nav>
				<input type="checkbox" id="check">
				<label for="check" class="checkbtn">
					<i class="fas fa-bars"></i>
				</label>
				<label class="logo"><a href="Main_Page.jsp">CAN</a></label>
				<ul>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="store_page.jsp">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		<div class="container">
			<h1>${settingsUpdatedMessage}</h1>
			<div class="profile-header">
				<div class="profile-img">
					<img src="images/beaver.jpg" width="200">
				</div>
				<div class="profile-nav-info">
					<h3 class="user-name"> 										
						<% 											
							String firstName = userDAO.getUserFirstName(userSession.getEmail());
							String lastName = userDAO.getUserLastName(userSession.getEmail());
									
							out.println(firstName + " " + lastName); 
						%> 
					</h3>
					<p class="status">Status: Gold</p>
				</div>
				<div class="user-coins">
					<h3 class="coins" style="color:white">
						Coins: 
						<% 
							String coins = userDAO.getUserCoins(userSession.getEmail());
						
							out.println(coins); 
						%> 
					</h3>
				</div>
			</div>
			<div class="main-bd">
				<div class="left-side">
					<div class="profile-side">
						<div class="user-bio">
							<h1>Bio</h1>
							<p class="bio"> 
								<% 										
									user = userDAO.getUserBio(userSession.getEmail());
							
									out.println(user.getBio()); 
								%> 
							</p>
						</div>
							<div class="user-info">
								<h1>User Info</h1>
								<p class="email"> <% out.println(userSession.getEmail()); %> </p>
								<p class="phone">									
									<% 											
										user = userDAO.getUserPhoneNumber(userSession.getEmail());
								
										out.println(user.getPhoneNumber()); 
									%>
								</p>
							</div>
						<div class="profile-btn">
							<a href="CreatePostPage.jsp">
								<button class="createbtn">Create Post</button>	
							</a>
							<a href="EditAccountDetails.jsp">
								<button class="edit_accountbtn">Edit Account Details</button>
							</a>
						</div>
					</div>
				</div>
				<div class="right-side">
					<div class="profile-body">	
						<h1 class="spacing">My Posts</h1>	
						<div class="row">
							<%
								List<Post> postList = userDAO.getUserPosts(userSession.getEmail());
								
								for(Post post : postList) 
								{ %>
									<div class="holder">
									    <div class="post">
									    	<div class="post-review">
												<i class="far calendar"> Posted on: <% out.println(post.getPostCreationDate()); %> </i>
										        <h1 class="post-title" > <% out.println(post.getPostTitle()); %> </h1>
										        <i class="far fa-user" > Author: <% out.println(post.getPostAuthorEmail()); %> </i>
										        &nbsp;
										        <p class="preview-text" > <% out.println(post.getPostBody()); %> </p>
									      	</div>
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

