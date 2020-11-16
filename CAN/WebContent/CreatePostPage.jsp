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
				
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="Login.css">
		
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-body">
						<form action="CreatePost" method="post">
							<div class="form-group">
								<label for="exampleFormControlInput1">Title</label>
								<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Title" name="postTitle">
							 </div>
							  <div class="form-group">
							    <label for="exampleFormControlTextarea1">Body</label>
							    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Contents...." name="postBody"></textarea>
							  </div>
						  	<div class="form-group">
								<input type="submit" name="submit" value="Create Post" class="btn float-right btn-outline-success">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>