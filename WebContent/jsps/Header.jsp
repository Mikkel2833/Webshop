<%@ page import="dk.mmj.*"%>
<%@ page
	import="java.lang.Object, java.util.ArrayList, java.sql.ResultSet, java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="txt/html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">  

<title>Mikkels Webshop</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">


<!-- Custom styles for this template -->
<link href="jumbotron.css" rel="stylesheet">

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="Index.jsp">Mikkels Webshop</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="../jsps/Products.jsp">Produkter</a></li>
					<li><a href="../jsps/ProfilePage.jsp">Profil</a></li>
					<li><a href="../jsps/PreviousOrders.jsp">Tidligere Ordre</a></li>
				</ul>

				<%
					if (session.getAttribute("LoggedIn") == null) {
				%>
				<form class="navbar-form navbar-right" role="form"
					action="../jsps/LoginDB.jsp" method="POST">
					<div class="form-group">
						<input type="text" placeholder="Brugernavn" class="form-control"
							name="Username">
					</div>
					<div class="form-group">
						<input type="password" placeholder="Password" class="form-control"
							name="Password">
					</div>
					<button type="submit" class="btn btn-success">Login</button>
					<a href="../jsps/CreateLogin.jsp" class="btn btn-primary">Opret
						Login</a>
				</form>
				<%
					} else {
				%>
				<form class="navbar-form navbar-right" role="form"
					action="../jsps/Logout.jsp">
					<div class="from-group">
						<label style="color: #999999">Du er logget ind</label> 
						<button type="submit" class="btn btn-danger">Log ud</button>
						<a href="ChangePassword.jsp"><button type="button" class="btn btn-info">Skift password</button></a>
					</div>
				</form>
				
				<%
					}
				%>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</div>