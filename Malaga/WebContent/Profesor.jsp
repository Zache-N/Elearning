<%@page import="test.Fraction"%>
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
	<h1 class="text-center">Ejercicio</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">Pagina de ejercicio</div>
					<form method="GET">
						<div class="panel-body">
							<div class="col-xs-2">
								<input type="number" class="form-control" name="num1" id="num1"
									placeholder="numerador">
								<hr style="width: 100%;" />
								<input type="number" class="form-control" name="denom1"
									id="denom1" placeholder="denominador" min="1"
									onkeyup="if($('#dIgual').is(':checked')=== true) document.getElementById('denom2').value = this.value;">
							</div>

							<div class="col-xs-2">
								</br>
								<h3 class="text-center">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</h3>
								</br>
							</div>

							<div class="col-xs-2">
								<input type="number" class="form-control" name="num2" id="num2"
									placeholder="numerador">
								<hr style="width: 100%;" />
								<input type="number" class="form-control" name="denom2" min="1"
									max="" id="denom2" placeholder="denominador"
									onkeyup="if($('#dIgual').is(':checked')=== true) document.getElementById('denom1').value = this.value;">
							</div>
							<input type="submit" class="btn btn-success" value="Valider">
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">Optiones</div>
					<div class="panel-body">
						<div class="checkbox">
							<label> <input type="checkbox" value="" id="dIgual">Denominador
								igual
							</label>
						</div>

						Nombre de : <label class="radio-inline"> <input
							type="radio" name="inlineRadioOptions" id="inlineRadio1"
							value="option1"> 1
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio2" value="option2">
							2
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio3" value="option3">
							3
						</label>
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
					Fraction res;
					Fraction simplification;
				%>
				<!-- Button trigger modal qui est ici un input -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myModal">Tester</button>
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
								<h4 class="modal-title" id="myModalLabel">Resolución de la
									adición</h4>
							</div>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="row">

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
										
										out.println("<script type=\"text/javascript\">" +
													" $('#num1').val(\"" + num1 + "\");"  + " $('#num2').val(\"" + num2 + "\");"  + " $('#denom1').val(\"" + denom1 + "\");"
															 + " $('#denom2').val(\"" + denom2 + "\");" +
															"</script>");
											if (denom1 == denom2) {
												Fraction simple = new Fraction(num1 + num2, denom1);
												out.println("<div class=\"col-xs-3\">"
														+ "<h3 class=\"text-center\">" + simple.getNumerateur()
														+ "</h3>" + "<hr style=\"width: 100%;\" />"
														+ "<h3 class=\"text-center\">"
														+ simple.getDenominateur() + "</h3>" + "</div>" +

														"<div class=\"col-xs-1\">" + "</br>"
														+ "<h2 class=\"text-center\">=</h2>" + "</br>"
														+ "</div>");
												simplification = new Fraction(simple.getNumerateur(),
														simple.getDenominateur());
												Fraction.simplification(simplification);
												if (simple.getNumerateur() != simplification.getNumerateur()
														&& simple.getDenominateur() != simplification
																.getDenominateur()) {
													out.println("<div class=\"col-xs-2\">"
															+ "<h3 class=\"text-center\">"
															+ simplification.getNumerateur() + "</h3>"
															+ "<hr style=\"width: 100%;\" />"
															+ "<h3 class=\"text-center\">"
															+ simplification.getDenominateur() + "</h3>"
															+ "</div>");
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

												res = f3.addition(f4);
												simplification = new Fraction(res.getNumerateur(),
														res.getDenominateur());
												Fraction.simplification(simplification);
												if (res.getNumerateur() == simplification.getNumerateur()
														&& res.getDenominateur() == simplification
																.getDenominateur()) {
													out.println("<div class=\"col-xs-1\">" + "</br>"
															+ "<h2 class=\"text-center\">=</h2>" + "</br>"
															+ "</div>" +

															"<div class=\"col-xs-2\">"
															+ "<h3 class=\"text-center\">"
															+ res.getNumerateur() + "</h3>"
															+ "<hr style=\"width: 100%;\" />"
															+ "<h3 class=\"text-center\">"
															+ res.getDenominateur() + "</h3>" + "</div>");
												} else {
													out.println("<div class=\"col-xs-1\">" + "</br>"
															+ "<h2 class=\"text-center\">=</h2>" + "</br>"
															+ "</div>" +

															"<div class=\"col-xs-2\">"
															+ "<h3 class=\"text-center\">"
															+ res.getNumerateur() + "</h3>"
															+ "<hr style=\"width: 100%;\" />"
															+ "<h3 class=\"text-center\">"
															+ res.getDenominateur() + "</h3>" + "</div>" +

															"<div class=\"col-xs-1\">" + "</br>"
															+ "<h2 class=\"text-center\">=</h2>" + "</br>"
															+ "</div>" +

															"<div class=\"col-xs-2\">"
															+ "<h3 class=\"text-center\">"
															+ simplification.getNumerateur() + "</h3>"
															+ "<hr style=\"width: 100%;\" />"
															+ "<h3 class=\"text-center\">"
															+ simplification.getDenominateur() + "</h3>"
															+ "</div>");

												}

											}
										%>

									</div>
									<div class="row">
										<div class="container">
											<h2>
												<%=denom1%>
												=
												<%=Fraction.facteurPrems(denom1)%>
											</h2>
										</div>
									</div>

									<div class="row">
										<div class="container">
											<h2>
												<%=denom2%>
												=
												<%=Fraction.facteurPrems(denom2)%>
											</h2>
										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" onclick="validate()"
									class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
