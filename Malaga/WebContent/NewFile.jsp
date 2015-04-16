<%@page import="java.util.Date"%>
<%@page import="java.lang.Math"%>
<%@page import="test.Fraction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Premiere page JSP</title>
<!-- Bootstrap -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="dist/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="dist/js/jquery.min.js"></script>
<script src="dist/js/bootstrap.js"></script>
<script src="dist/js/bootstrap.min.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<body>

	<h3>Matematicas</h3>
	La date courante est :<%=new Date()%>

	<%!int numerateur1 = (int) (Math.random() * 10);
	int denominateur1 = (int) (Math.random() * 10 + 1);
	int numerateur2 = (int) (Math.random() * 10);
	int denominateur2 = (int) (Math.random() * 10 + 1);
	int[] result = new int[2];
	Fraction f1 = new Fraction(numerateur1, denominateur1);
	Fraction f2 = new Fraction(numerateur2, denominateur2);%>

	<div class="container-fluid">
		<div class="col-xs-1">
			<h2 class="text-center"><%=f1.getNumerateur() + "</br>" + f1.getDenominateur()%></h2>
		</div>
		<div class="col-xs-1">
			</br>
			<h2 class="text-center">+</h2>
		</div>

		<div class="col-xs-1">
			<h2 class="text-center"><%=f2.getNumerateur() + "</br>" + f2.getDenominateur()%></h2>
		</div>

		<div class="col-xs-1">
			</br>
			<h2 class="text-center">=</h2>
		</div>

		<div class="col-xs-2">
			</br> <input type="text" class="form-control" id="res1"
				placeholder="numerateur3"> <input type="text"
				class="form-control" id="res2" placeholder="denominateur3">
		</div>

		<% result = f1.addition(f2); %>

	</div>
</body>
</html>