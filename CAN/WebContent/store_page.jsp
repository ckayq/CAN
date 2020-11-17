<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Store Page</title>

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
			<label class="logo">WWW</label>
			<ul>
				<li><a href="Main_Page.jsp">Home</a></li>
				<li><a href="Profile_Page.jsp">Profile</a></li>
				<li><a href="store_page.jsp">Store</a></li>
				<li><a href="LogoutPage.jsp">Logout</a></li>
			</ul>
		</nav>
	</div>
		
	<h2>Store <b>Page</b></h2><br>
	
	<div class="container" style="background-color:white;">
		<div class="row" >
			<div class="col-md-12" >
				<h1> Avatars </h1>
				<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>   
	
				<div class="carousel-inner">
					<div class="item active">
						<div class="row">
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/amoung.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Amoung Us</h4>
										<p class="item-price"> <span>$369.00</span></p>
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/beaver.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Eh! Beaver</h4>
										<p class="item-price"> <span>$23.99</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>		
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/fall.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Fall Guys</h4>
										<p class="item-price"> <span>$649.00</span></p>
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>								
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/ghost.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Spooky Ghost</h4>
										<p class="item-price"> <span>$250.00</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/mario.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Its a me Mario</h4>
										<p class="item-price"> <span>$269.00</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/penguin.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Penguin</h4>
										<p class="item-price"> <span>$869.00</span></p>
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/pikachu.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Pika Pikachu</h4>
										<p class="item-price"> <span>$99.00</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/skull.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Skull</h4>
										<p class="item-price"> <span>$69.00</span></p>
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>						
						</div>
					</div>
				</div>
				<a class="carousel-control left" href="#myCarousel" data-slide="prev">
					<i class="fa fa-angle-left"></i>
				</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next">
					<i class="fa fa-angle-right"></i>
				</a>
			</div>
			</div>
		</div>
	</div>
	
	<br><br>

	
	<div class="container" style="background-color:white;">
		<div class="row">
			<div class="col-md-12">
				<h1> Status </h1>
				<div id="myCarousel2" class="carousel slide" data-ride="carousel" data-interval="0">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel2" data-slide-to="1"></li>
				</ol>   
	
				<div class="carousel-inner">
					<div class="item active">
						<div class="row">
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/bronze.jpg" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Bronze</h4>
										<p class="item-price"> <span>$369.00</span></p>
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/silver.JPG" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Silver</h4>
										<p class="item-price"> <span>$23.99</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>		
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/gold.JPG" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Gold</h4>
										<p class="item-price"> <span>$649.00</span></p>
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>								
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/platinum.JPG" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Platinum</h4>
										<p class="item-price"> <span>$250.00</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-sm-3">
								<div class="thumb-wrapper">
									<div class="img-box">
										<img src="images/diamond.JPG" class="img-responsive" alt="">
									</div>
									<div class="thumb-content">
										<h4>Diamond</h4>
										<p class="item-price"> <span>$269.00</span></p>
	
	
										<a href="#" class="btn btn-primary">Buy</a>
									</div>						
								</div>
							</div>						
						</div>
					</div>
				</div>
				<a class="carousel-control left" href="#myCarousel2" data-slide="prev">
					<i class="fa fa-angle-left"></i>
				</a>
				<a class="carousel-control right" href="#myCarousel2" data-slide="next">
					<i class="fa fa-angle-right"></i>
				</a>
			</div>
			</div>
		</div>
	</div>
	<br><br>
</body>
</html>                                		                             		