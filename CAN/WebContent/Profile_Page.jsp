<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
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
				<label class="logo"><a href="Main_Page.jsp">CAN</a></label>
				<ul>
					<li><h3>Hi,</h3></li>
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
					<h3 class="coins" style="color:white">Coins: 10</h3>
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
								<a href="EditAccountDetails.jsp">
									<button class="edit_accountbtn">Edit Account Details</button>
								</a>
							</div>
						</div>
					</div>
					
					<div class="right-side">
						<div class="profile-body">
							<div class="profile-search">
								<input type="text" placeholder="Search..">
							</div>
							
							<div class="profile-posts">
								<div class="holder">
									<div class="post">
										<div class="post-review">
											<i class="far calendar">Mar 11, 2019</i>
											<h1 class="post-title"><a href="">Post Title</a></h1>
											<i class="far fa-user">John Hill</i>
											&nbsp;
											
											<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page
															Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page
															Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page
															Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page
											</p>
											
										</div>
									</div>
									</div>
									
									<div class="holder">
									<div class="post">
										<div class="post-review">
											<i class="far calendar">Mar 11, 2019</i>
											<h1 class="post-title"><a href="">Post Title</a></h1>
											<i class="far fa-user">John Hill</i>
											&nbsp;
											<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
											
										</div>
									</div>
									</div>
									
									<div class="holder">
									<div class="post">
										<div class="post-review">
											<i class="far calendar">Mar 11, 2019</i>
											<h1 class="post-title"><a href="">Post Title</a></h1>
											<i class="far fa-user">John Hill</i>
											&nbsp;
											
											<p class="preview-text">Each post listing will consist of the featured image of the post, the post title, author, date published and a read more button leading to the full post details page</p>
											
										</div>
									</div>
									</div>
							</div>
						</div>
					</div>
				</div>
		</div>	
	</body>
</html>

