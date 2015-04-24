<%@page import="test.Fraction"%>
<%@page import="java.lang.Math"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creacion de un ejercicio</title>
<!-- Bootstrap -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="dist/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="dist/js/jquery.min.js"></script>

<script src="dist/js/bootstrap.min.js"></script>
<script src="js/calcul.js"></script>
</head>
<body>
	<h1 class="text-center">Pagina de Ejercicio</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<%!int numerateur1 = (int) (Math.random() * 10);
					int denominateur1 = (int) (Math.random() * 10 + 1);
					int numerateur2 = (int) (Math.random() * 10);
					int denominateur2 = (int) (Math.random() * 10 + 1);
					int[] result = new int[2];
					Fraction f1 = new Fraction(numerateur1, denominateur1);
					Fraction f2 = new Fraction(numerateur2, denominateur2);%>
					<div class="panel-heading">Pagina de ejercicio</div>
					<div class="panel-body">
						<div class="col-xs-2">
							<h2 class="text-center"><%=f1.getNumerateur()%></h2>
							<hr style="width: 100%;" />
							<h2 class="text-center"><%=f1.getDenominateur()%></h2>
						</div>

						<div class="col-xs-2">
							</br>
							<h3 class="text-center">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
							</h3>
							</br>
						</div>

						<div class="col-xs-2">
							<h2 class="text-center"><%=f2.getNumerateur()%></h2>
							<hr style="width: 100%;" />
							<h2 class="text-center"><%=f2.getDenominateur()%></h2>
						</div>

						<div class="col-xs-1">
							</br>
							<h2 class="text-center">=</h2>
							</br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<%
					String requete1 = request.getParameter("denom1");
					String requete2 = request.getParameter("denom2");
					String requete3 = request.getParameter("num1");
					String requete4 = request.getParameter("num2");

					if (requete1 == null)
						requete1 = "1";
					if (requete2 == null)
						requete2 = "1";
					if (requete3 == null)
						requete3 = "0";
					if (requete4 == null)
						requete4 = "0";

					int denom1 = Integer.parseInt(requete1);
					int denom2 = Integer.parseInt(requete2);
					int num1 = Integer.parseInt(requete3);
					int num2 = Integer.parseInt(requete4);
					int resultat[] = new int[2];
					int simplification[] = new int[2];
					Fraction f1 = new Fraction(num1, denom1);
					Fraction f2 = new Fraction(num2, denom2);
				%>
				<!-- Button trigger modal qui est ici un input -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myModal">Comenzar</button>
				<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Test</h4>
							</div>
							<div class="modal-body">
								<div class="container-fluid">

									<div class="col-xs-2">
										<h3 class="text-center"><%=num1%></h3>
										<hr style="width: 100%; color: black" />
										<h3 class="text-center"><%=denom1%></h3>
									</div>

									<div class="col-xs-1">
										</br>
										<h2 class="text-center">+</h2>
										</br>
									</div>

									<div class="col-xs-2">
										<h3 class="text-center"><%=num2%></h3>
										<hr style="width: 100%; color: black" />
										<h3 class="text-center"><%=denom2%></h3>
									</div>

									<div class="col-xs-1">
										</br>
										<h2 class="text-center">=</h2>
										</br>
									</div>

									<%
										if (denom1 == denom2) {
											Fraction simple = new Fraction(num1 + num2, denom1);
											out.println("<div class=\"col-xs-2\">"
													+ "<h3 class=\"text-center\">" + simple.getNumerateur()
													+ "</h3>" + "<hr style=\"width: 100%;\" />"
													+ "<h3 class=\"text-center\">"
													+ simple.getDenominateur() + "</h3>" + "</div>" +

													"<div class=\"col-xs-1\">" + "</br>"
													+ "<h2 class=\"text-center\">=</h2>" + "</br>"
													+ "</div>");
											
											simplification = new int[]{simple.getNumerateur(),simple.getDenominateur()};
											//Fraction.simplification(simplification);
											if(simple.getNumerateur() != simplification[0] && simple.getDenominateur() != simplification[1]){
												out.println("<div class=\"col-xs-2\">"
														+ "<h3 class=\"text-center\">" + simplification[0]
														+ "</h3>" + "<hr style=\"width: 100%;\" />"
														+ "<h3 class=\"text-center\">"
														+ simplification[1] + "</h3>" + "</div>");
											}
											
										} else {
											int ppcm = Fraction.ppcm(denom1, denom2);
											Fraction f3 = new Fraction(num1 * (ppcm / denom1), ppcm);
											Fraction f4 = new Fraction(num2 * (ppcm / denom2), ppcm);
											out.println("<div class=\"col-xs-2\">"
													+ "<h3 class=\"text-center\">" + f3.getNumerateur()
													+ "</h3>" + "<hr style=\"width: 100%;\" />"
													+ "<h3 class=\"text-center\">" + f3.getDenominateur()
													+ "</h3>" + "</div>" +

													"<div class=\"col-xs-1\">" + "</br>"
													+ "<h2 class=\"text-center\">+</h2>" + "</br>"
													+ "</div>" +

													"<div class=\"col-xs-2\">"
													+ "<h3 class=\"text-center\">" + f4.getNumerateur()
													+ "</h3>" + "<hr style=\"width: 100%;\" />"
													+ "<h3 class=\"text-center\">" + f4.getDenominateur()
													+ "</h3>" + "</div>");

											resultat = f3.addition(f4);
											simplification = new int[]{resultat[0], resultat[1]};
											//Fraction.simplification(simplification);
											if (resultat[0] == simplification[0]
													&& resultat[1] == simplification[1]) {
												out.println("<div class=\"col-xs-1\">" + "</br>"
														+ "<h2 class=\"text-center\">=</h2>" + "</br>"
														+ "</div>" +

														"<div class=\"col-xs-2\">"
														+ "<h3 class=\"text-center\">" + resultat[0]
														+ "</h3>" + "<hr style=\"width: 100%;\" />"
														+ "<h3 class=\"text-center\">" + resultat[1]
														+ "</h3>" + "</div>");
											} else {
												out.println("<div class=\"col-xs-1\">" + "</br>"
														+ "<h2 class=\"text-center\">=</h2>" + "</br>"
														+ "</div>" +

														"<div class=\"col-xs-2\">"
														+ "<h3 class=\"text-center\">" + resultat[0]
														+ "</h3>" + "<hr style=\"width: 100%;\" />"
														+ "<h3 class=\"text-center\">" + resultat[1]
														+ "</h3>" + "</div>" +

														"<div class=\"col-xs-1\">" + "</br>"
														+ "<h2 class=\"text-center\">=</h2>" + "</br>"
														+ "</div>" +

														"<div class=\"col-xs-2\">"
														+ "<h3 class=\"text-center\">" + simplification[0]
														+ "</h3>" + "<hr style=\"width: 100%;\" />"
														+ "<h3 class=\"text-center\">" + simplification[1]
														+ "</h3>" + "</div>");

											}

										}
									%>

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
