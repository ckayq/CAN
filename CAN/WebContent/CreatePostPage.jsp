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
		<title>Create Post</title>

		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/main_style.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
			    
			    <div class="col-md-8 col-md-offset-2">
			        
			        <h3>${ emptyEntryMessage }</h3>
			        
		    		<h1>Create post</h1>
		    		
		    		<form action="CreatePost" method="post">
		
		    		    
		    		    <div class="form-group">
		    		        <label for="title">Title <span class="require">*</span></label>
		    		        <input type="text" class="form-control" name="postTitle" />
		    		    </div>
		    		    
		    		    <div class="form-group">
		    		        <label for="description">Body <span class="require">*</span></label>
		    		        <textarea rows="5" class="form-control" name="postBody" ></textarea>
		    		    </div>
		    		    
		    		    <div class="form-group">
		    		        <p><span class="require">*</span> - required fields</p>
		    		    </div>
		    		    
		    		    <div class="form-group">
		    		        <button type="submit" class="btn btn-primary" value="Create Post">
		    		            Create
		    		        </button>
		    		        <button class="btn btn-default">
		    		            Cancel
		    		        </button>
		    		    </div>
		    		    
		    		</form>
				</div>
				
			</div>
		</div>
	</body>
</html>