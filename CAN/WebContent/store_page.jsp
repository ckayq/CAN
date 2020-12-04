<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ page import="java.util.List"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDAOImpl" %>
<%@ page import="image.Image" %>
<%@ page import="image.ImageDAOImpl" %>
<%@ page import="dbConnection.ConnectionProvider" %>
 
 <%
    User userSession = (User) session.getAttribute("currentUser");

    if (userSession == null) {
        response.sendRedirect("LoginPage.jsp");
    }
    
	UserDAO userDAO = new UserDAOImpl();
	
	User user = new User();
%>
 
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Store</title>
	
		<link rel="stylesheet" href="css/store_page.css">
		<link rel="stylesheet" href="css/nav_style.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body style="background-color:lightgrey;">
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
			
		<h2>Store</h2>
		<br>
		<div class="container" style="background-color:white;">
						<h5> ${avatarBoughtMessage} </h5>
						<h5> ${notEnoughCoinsMessage} </h5>	
						<h5> ${alreadyHasProductMessage} </h5>
				<div class="row" >
					<div class="col-md-12" >
						<h1> Avatar </h1>
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>   
			
						<div class="carousel-inner">
							<div class="item active">
		
							<div class="row">
							<%
							ImageDAOImpl imageDAO = new ImageDAOImpl();
						
							List<Image> imageList = imageDAO.getAllImage();
							
							for(Image image : imageList)
							{ %>
							<% if(image.getImageID() < 9) { %>
									<div class="col-sm-3">
										<div class="thumb-wrapper">
											<div class="img-box">
												<img src="<% out.print(image.getImageURL()); %>" class="img-responsive" alt="">
											</div>
											<div class="thumb-content">
												<h4><% out.print(image.getProductName());%></h4>
												<p class="item-price"> Price: <span><% out.print(String.valueOf(image.getUnitPrice())); %></span> coins</p>
												<form action="Buy" method="post">
													<input type="hidden" name="avatarID" value="<% out.println(image.getImageID()); %>">
													<input type="hidden" name="avatarPrice" value="<% out.println(image.getUnitPrice()); %>">
													<input type="hidden" name="avatarURL" value="<% out.println(image.getImageURL()); %>">
													<input type="hidden" name="email" value="
																							<% String email = userSession.getEmail();
																								out.println(email); %>">
													<input type="hidden" name="userCoins" value="
																								<% String coins = userDAO.getUserCoins(userSession.getEmail());
																									out.println(coins);  %>">
											        <input type="submit" name="buyAvatar" value="Buy" class="btn btn-primary btn-block">
												</form>
											</div>						
										</div>
									</div>
									<% } %>
						<% } %>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<br><br>
		
		<div class="container" style="background-color:white;">
						<h5> ${statusBoughtMessage} </h5>
						<h5> ${notEnoughCoinsMessage} </h5>	
						<h5> ${alreadyHasProductMessage} </h5>
				<div class="row" >
					<div class="col-md-12" >
						<h1> Status </h1>
						<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>   
			
						<div class="carousel-inner">
							<div class="item active">					
							<div class="row">
								<%
									for(Image image : imageList)
									{ %>
										<% if(image.getImageID() == 9 || image.getImageID() == 10 || image.getImageID() == 11 || 
												image.getImageID() == 12 || image.getImageID() == 13) { %>
											<div class="col-sm-3">
												<div class="thumb-wrapper">
													<div class="img-box">
														<img src="<% out.print(image.getImageURL()); %>" class="img-responsive" alt="">
													</div>
													<div class="thumb-content">
														<h4><% out.print(image.getProductName());%></h4>
														<p class="item-price"> <span><%out.println(image.getUnitPrice()); %></span> coins</p>
														<form action="Buy" method="post">
															<input type="hidden" name="statusID" value="<% out.println(image.getImageID()); %>">
															<input type="hidden" name="statusPrice" value="<% out.println(image.getUnitPrice()); %>">
															<input type="hidden" name="statusURL" value="<% out.println(image.getImageURL()); %>">
															<input type="hidden" name="email" value="
																									<% String email = userSession.getEmail();
																										out.println(email); %>">
															<input type="hidden" name="userCoins" value="
																										<% String coins = userDAO.getUserCoins(userSession.getEmail());
																											out.println(coins);  %>">
													        <input type="submit" name="buyStatus" value="Buy" class="btn btn-primary btn-block">
														</form>
													</div>						
												</div>
											</div>
											<% } %>
									<% } 
									%>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</body>
</html>                                		                             		