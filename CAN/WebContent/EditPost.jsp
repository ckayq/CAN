<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@ page import="user.User" %>
<%@ page import="post.Post" %>
    
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
		<title>Edit Post</title>

		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/main_style.css">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		
		<script src="https://kit.fontawesome.com/a076d05399.js%22%3E"></script>
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	</head>
	<body style="background-color:powderblue;">
	
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
	
		<div class="container">
			<div class="row">
			    
			    <div class="col-md-8 col-md-offset-2">
			        
			        <h3>${emptyInputMessage}</h3>
			        
		    		<h1>Edit post</h1>
		    		<p><%
						String postID = request.getParameter("edit");
						%>
						</p>
		    		<form action="ManagePost" method="post">
		    		    <div class="form-group">
		    		        <label for="title">Title <span class="require">*</span></label>
		    		        <input type="text" class="form-control" name="postTitle" maxlength="15"/>
		    		    </div>
		    		    
		    		    <div class="form-group">
		    		        <label for="description">Body <span class="require">*</span></label>
		    		        <textarea rows="5" class="form-control" name="postBody" maxlength="150"></textarea>
		    		    </div>
		    		    
		    		    <div class="form-group">
		    		        <p><span class="require">*</span> - required fields</p>
		    		    </div>
		    		    <input type="hidden" name ="postID" value="<% out.print(postID); %>">
		    		    
		    		    <div class="form-group">
		    		        <button type="submit" class="btn btn-primary" value="Update Post">
		    		            Update
		    		        </button>
		    		    </div>  
		    		</form>
		    		<button class="btn btn-default" onclick="location.href='Profile_Page.jsp'">
		    		      Cancel
		    		</button>
				</div>
			</div>
		</div>
	</body>
</html>