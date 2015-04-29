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
<!-- Include all compiled plugins (below), or include individual 	files as needed -->
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
					<%!int numerateur1 = 3;//(int) (Math.random() * 10);
					int denominateur1 = 4;//(int) (Math.random() * 10 + 1);
					int numerateur2 = 5;//(int) (Math.random() * 10);
					int denominateur2 = 6;//(int) (Math.random() * 10 + 1);
					int[] result = new int[2];
					Fraction f1 = new Fraction(numerateur1, denominateur1);
					Fraction f2 = new Fraction(numerateur2, denominateur2);%>

					<%
						String rmcm = request.getParameter("mcm");
						String rmcm1 = request.getParameter("mcm1");
						String rmcm2 = request.getParameter("mcm2");

						if (rmcm == null)
							rmcm = "0";
						if (rmcm1 == null)
							rmcm1 = "0";
						if (rmcm2 == null)
							rmcm2 = "0";

						int mcm = Integer.parseInt(rmcm);
						//int mcm1 = Integer.parseInt(rmcm1);
						//int mcm2 = Integer.parseInt(rmcm2);
						Fraction resultat = new Fraction(numerateur1 + numerateur2,
								denominateur1);
					%>

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

						<div id="suite" class="col-xs-2"></div>

					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
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
								<h4 class="modal-title" id="myModalLabel">MCD</h4>
							</div>
							<form method="GET">
								<div class="modal-body">
									<div class="container-fluid">

										<%
											if (denominateur1 == denominateur2) {
												//if (denom1 == denom2) {

												out.println("<div class=\"col-xs-3 \">"
														+ "<h2>"
														+ numerateur1
														+ " + "
														+ numerateur2
														+ " = </h2>"
														+ "</div><div class=\"col-xs-5 \"></br><div id=\"mcmDiv\" class=\"form-group\"><input type=\"number\" class=\"form-control\" name=\"mcm\" id=\"mcm\""
														+ "placeholder=\"resultado\"></div>" + "</div>");

												if (mcm == resultat.getNumerateur()) {
													out.println("<script type=\"text/javascript\">" +

													" $('#mcm').val(\"" + mcm + "\");"
															+ " $('#mcmDiv').addClass('has-success');"
															+ "$('#savemcm').show();" +

															"</script>");

												} else if (mcm == 0) {

												} else {
													out.println("<script type=\"text/javascript\">" +

													" $('#mcm').val(\"" + mcm + "\");"
															+ " $('#mcmDiv').addClass('has-error');" +

															"</script>");
												}

											} else {

												out.println("<div class=\"row\"><div class=\"col-xs-2 \">"
														+ "<h2>"
														+ denominateur1
													
														+ " = </h2>"
														+ "</div><div class=\"col-xs-5 \"></br><div id=\"mcmDiv1\" class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"mcm1\" id=\"mcm1\""
														+ "placeholder=\"resultado\"></div>" + "</div></div>");
												out.println("<div class=\"row\"><div class=\"col-xs-2 \">"
														+ "<h2>"
														+ denominateur2
													
														+ " = </h2>"
														+ "</div><div class=\"col-xs-5 \"></br><div id=\"mcmDiv2\" class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"mcm2\" id=\"mcm2\""
														+ "placeholder=\"resultado\"></div>" + "</div></div>");
												out.println("<div class=\"row\"><div class=\"col-xs-3 \">"
														+ "<h2>"
														+ "mcm"
														+ " = </h2>"
														+ "</div><div class=\"col-xs-5 \"></br><input type=\"text\" class=\"form-control\" name=\"mcm2\" id=\"mcm2\""
														+ "placeholder=\"MCM\">" + "</div></div>");
												
												if (rmcm1.equals(Fraction.facteurPrems(denominateur1))) {
													out.println("<script type=\"text/javascript\">" +

													" $('#mcm1').val(\"" + rmcm1+ "\");"
															+ " $('#mcmDiv1').addClass('has-success');"+

															"</script>");

												} else if (rmcm1 == "0") {

												} else {
													out.println("<script type=\"text/javascript\">" +

													" $('#mcm1').val(\"" + rmcm1 + "\");"
															+ " $('#mcmDiv1').addClass('has-error');" +

															"</script>");
												}
												
												if (rmcm2.equals(Fraction.facteurPrems(denominateur2))) {
													out.println("<script type=\"text/javascript\">" +

													" $('#mcm2').val(\"" + rmcm2+ "\");"
															+ " $('#mcmDiv2').addClass('has-success');"+

															"</script>");

												} else if (denominateur2 == 0) {

												} else {
													out.println("<script type=\"text/javascript\">" +

													" $('#mcm2').val(\"" + rmcm2 + "\");"
															+ " $('#mcmDiv2').addClass('has-error');" +

															"</script>");
												}
											}
										%>

									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<input type="submit" class="btn btn-success" value="Valider">
									<button type="button" class="btn btn-primary" id="savemcm"
										onclick="addSimple()">Save changes</button>

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">function addSimple() {
	<%int str = resultat.getNumerateur(), str2 = resultat.getDenominateur();%>
	var html ="<div class=\"col-xs-2\"><h2 class=\"text-center\">" + <%=str%> + "</h2><hr style=\"width: 100%;\" /><h2 class=\"text-center\">" + <%=str2%> +"</h2></div>";
		$("#suite").html(html);
	}
</script>
</html>
