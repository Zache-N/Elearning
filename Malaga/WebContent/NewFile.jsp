<%@page import="java.util.Date"%>
<%@page import="java.lang.Math"%>
<%@page import="test.Fraction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
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
<script src="js/calcul.js"></script>

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
			</br>
			<form action="NewFile.jsp">
				<input type="number" class="form-control" name="resu1" id="res1"
					placeholder="numerateur"> <input type="number"
					class="form-control" name="resu2" id="res2"
					placeholder="denominateur"> <input type="submit"
					class="btn btn-success" value="Valider">
			</form>
		</div>



		<%
			result = f1.addition(f2);
			String requete1 = request.getParameter("resu1");
			String requete2 = request.getParameter("resu2");

			if (requete1 == null || requete2 == null) {
				requete1 = "0";
				requete2 = "0";
			}
			int resu1 = Integer.parseInt(requete1);
			int resu2 = Integer.parseInt(requete2);
			if (result[0] == resu1 && result[1] == resu2) {
				out.println("<div class=\"col-xs-1\">" + "<h2>" + result[0]
						+ "</br>" + result[1] + "</h2>" + "</div>");
				//out.println("</br><div id=success></div>");
				
				f1.simplification(result);
				if(result[0] == resu1 && result[1] == resu2){
					out.println("</br><div id=simplification></div>");
				}else{
					out.println("<div class=\"col-xs-1\"></br><h2 class=\"text-center\">" + "=" + "</h2></div>");
					out.println("<div class=\"col-xs-2\"></br><form action=\"NewFile.jsp\"><input type=\"number\" class=\"form-control\" name=\"simp1\" id=\"simp1\"placeholder=\"numerateur\"> <input type=\"number\"class=\"form-control\" name=\"simp2\" id=\"simp2\"placeholder=\"denominateur\"> <input type=\"submit\"class=\"btn btn-success value=\"Valider\"></form></div>");
					out.println("<div class=\"col-xs-1\"></br><h2 class=\"text-center\">" + "=" + "</h2></div>");
					out.println("<div class=\"col-xs-1\">" + "<h2>" + result[0]
							+ "</br>" + result[1] + "</h2>" + "</div>");
					out.println("</br><div id=simplification></div>");
				}
			} else {
				if(requete1 != "0" || requete2 != "0")
				out.println("</br><div id=wrong></div>");
			}
		%>
	</div>
	<script>$(document).ready(success());</script>
	<script>$(document).ready(wrong());</script>
	<script>$(document).ready(simplification());</script>
</body>
</html>