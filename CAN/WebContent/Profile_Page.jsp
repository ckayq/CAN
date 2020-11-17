<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<title>My Profile</title>
		
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="css/profile_style.css">
		
		<script src="https://kit.fontawesome.com/a076d05399.js%22%3E"></script>
	</head>
	<body>
		<div class="topnav">
			<nav>
				<input type="checkbox" id="check">
				<label for="check" class="checkbtn">
					<i class="fas fa-bars"></i>
				</label>
				<label class="logo"><a href="Main_Page.jsp">WWW</a></label>
				<ul>
					<li><a href="Main_Page.jsp">Home</a></li>
					<li><a href="Profile_Page.jsp">Profile</a></li>
					<li><a href="store_page.jsp">Store</a></li>
					<li><a href="LogoutPage.jsp">Logout</a></li>
				</ul>
			</nav>
		</div>
		
		<div class="container">
			<div class="profile-header">
				<div class="profile-img">
					<img src="images/beaver.jpg" width="200">
				</div>
				<div class="profile-nav-info">
					<h3 class="user-name">Username</h3>
					<p class="status">Status: Gold</p>
				</div>
				<div class="user-coins">
						<h3 class="coins">Coins: 10</h3>
					</div>
			</div>
				<div class="main-bd">
					<div class="left-side">
						<div class="profile-side">
							<div class="user-bio">
								<h1>Bio</h1>
								<p class="bio">Alyssa is a blossoming interior designer who seeks to translate her passion for design into
					 			every space she works on. She approaches each project as a puzzle, and believes her job is to create the 
					 			pieces that blend beauty, function and practicality, reflecting on the best possible look for the budget, 
					 			way of life, and specifics of the location. She has been practicing interior design since 2008 and has a 
					 			Master's of Interior Architecture from NYU. </p>
							</div>
							
							
								<div class="user-info">
									<h1>User Info</h1>
									<p class="email">test@gmail.com</p>
									<p class="phone">(604)1234567</p>
								</div>
							
							
							
							<div class="profile-btn">
								<button class="createbtn">Create Post</button>
								<button class="edit_accountbtn">Edit Account Details</button>
							</div>
						</div>
					</div>
					
					<div class="right-side">
						<div class="profile-body">
							<div class="profile-posts">
								<h1>Your Posts</h1>
								<p>User Personas represent real, living and breathing people who will engage with your product. While individuals 
								featured on a persona are technically hypothetical, the information on the document should not be hypothetical. All 
								sections must be completed based on facts, hard data, and research. Take a look at our examples and follow along with 
								our free template.</p>
							</div>
						</div>
					</div>
				</div>
			
		</div>
		
		
		
		
		
		
		<!--  <div class="row">
			<div class="leftcolumn">
				<div class="card">
					<h2>About Me</h2>
				</div>
				<div class="card">
					<h2>Popular Posts</h2>
				</div>
			</div>
			<div class="rightcolumn">
				<div class="card">
					<h2>Post Title</h2>
					<h5>Post description</h5>
				</div>
			</div>
		</div>-->
	</body>
</html>
