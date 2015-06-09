<%@page import="java.util.ArrayList"%>
<%@page import="test.*"%>
<%@page import="com.wolfram.*"%>
<%@page import="java.lang.Math"%>
<%@page import="java.util.List"%>
<%@page import="library.model.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page import="library.model.Reponse"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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

					<%!
					List<Resultat> ares;
					List<Reponse> listreponses,listreponsesS;
					int numerateur1 ;//(int) (Math.random() * 10);
					int denominateur1 ;//(int) (Math.random() * 10 + 1);
					int numerateur2 ;//(int) (Math.random() * 10);
					int denominateur2 ;//(int) (Math.random() * 10 + 1);
					int ppcm;
					int[] result;
					Fraction res,simplification,f3,f4;
					Wolframe wolframe, wolframe1, wolframe2;
					%>
					<%
					try{
						ares= new ResultatRessources().getResults(10);
						listreponses = new ArrayList<Reponse>(); listreponsesS = new ArrayList<Reponse>();
						numerateur1 = ares.get(0).getNum1();//(int) (Math.random() * 10);
						denominateur1 = ares.get(0).getDenom1();//(int) (Math.random() * 10 + 1);
						numerateur2 = ares.get(0).getNum2();//(int) (Math.random() * 10);
						denominateur2 = ares.get(0).getDenom2();//(int) (Math.random() * 10 + 1);
						ppcm = Fraction.ppcm(denominateur1, denominateur2);
						f3 = new Fraction(numerateur1 * (ppcm / denominateur1), ppcm);
						f4 = new Fraction(numerateur2 * (ppcm / denominateur2), ppcm);
						res = f3.addition(f4);
						wolframe = new Wolframe("2+2");
						wolframe1 = new Wolframe("2+2");
						wolframe2 = new Wolframe("2+2");
					}
					catch(Exception e){
						
					}
					%>

					<% 
					ReponseFactory reponseDB = (ReponseFactory)session.getAttribute("reponseDB"); 
						if (reponseDB == null) {
				            //get all books from the database class
				            reponseDB = new ReponseFactory();
				            session.setAttribute("reponseDB", reponseDB);
				        }
			        Collection<Reponse> reponse = reponseDB.getBooks(); 
			        for (Iterator<Reponse> iter = reponse.iterator(); iter.hasNext();) {
			            listreponses.add((Reponse) iter.next());
			        }   
			        
			        ReponseFactory reponseDBS = (ReponseFactory)session.getAttribute("reponseDBS"); 
					if (reponseDBS == null) {
			            //get all books from the database class
			            reponseDBS = new ReponseFactory();
			            session.setAttribute("reponseDBS", reponseDBS);
			        }
		        Collection<Reponse> reponseS = reponseDBS.getBooks(); 
		        for (Iterator<Reponse> iter = reponseS.iterator(); iter.hasNext();) {
		            listreponsesS.add((Reponse) iter.next());
		        }  
			        
			        String reponseFacteurd1 = listreponses.get(listreponses.size()-1).getRep1() ;
			        String reponseFacteurd2 = listreponses.get(listreponses.size()-1).getRep2() ;
			        String reponseMCMFinal = listreponses.get(listreponses.size()-1).getMcm() ;
			        String numSimpl1 = listreponsesS.get(listreponsesS.size()-1).getRep1() ;
			        String numSimpl2 = listreponsesS.get(listreponsesS.size()-1).getRep2() ;
			        String numSimplFinal = listreponsesS.get(listreponsesS.size()-1).getMcm() ;
						String rmcm = request.getParameter("mcm");
						if (rmcm == null)
							rmcm = "0"; 

						int mcm = Integer.parseInt(rmcm);

					
						Fraction resultat = new Fraction(numerateur1 + numerateur2,
								denominateur1);
						
					%>

					<div class="panel-heading">Pagina de ejercicio</div>
					<div class="panel-body">
						<div class="col-xs-2">
							<h2 class="text-center"><%=numerateur1%></h2>
							<hr style="width: 100%;" />
							<h2 class="text-center"><%=denominateur1%></h2>
						</div>

						<div class="col-xs-2">
							</br>
							<h3 class="text-center">
								<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
							</h3>
							</br>
						</div>

						<div class="col-xs-2">
							<h2 class="text-center"><%=numerateur2%></h2>
							<hr style="width: 100%;" />
							<h2 class="text-center"><%=denominateur2%></h2>
						</div>

						<div class="col-xs-1">
							</br>
							<h2 class="text-center">=</h2>
							</br>
						</div>

						<div id="suite"></div>

					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">

				<!-- PREMIERE PARTIE DE L'EXERCICE -->
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
							<form name="edit" action="ReponseCreate" method="post">
								<div class="modal-body">
									<div class="container-fluid">

										<%											
											try{
												
											wolframe.changeInput("Factor "+Integer.toString(denominateur1));
											wolframe1.changeInput("Factor "+Integer.toString(denominateur2));
											wolframe2.changeInput("lcm "+Integer.toString(denominateur2)+" "+Integer.toString(denominateur1));
												
											//Si les dénominateur sont égaux, on execute et affiche tout ce qui s'en suit
											if (denominateur1 == denominateur2) {
							
%>
										<div class="col-xs-3 ">
											<h2>
												<%=numerateur1 %>
												+<%=numerateur2 %>
												=
											</h2>
										</div>
										<div class="col-xs-5 ">
											</br>
											<div id="mcmDiv" class="form-group">
												<input type="number" class="form-control" name="mcm"
													id="mcm" placeholder="resultado">
											</div>
										</div>
										<%
												if (mcm == resultat.getNumerateur()) {
%>
										<script type="text/javascript">
											$('#mcm').val(" + mcm + ");
											$('#mcmDiv')
													.addClass('has-success');
											$('#savemcm').show();
										</script>
										<%
												} else if (mcm == 0) {

												} else {
%>
										<script type="text/javascript">
											$('#mcm').val(" + mcm + ");
											$('#mcmDiv').addClass('has-error');
										</script>
										<%											
												}
											
											//Si les dénomintateurs ne sont pas égaux ont affiche tout ce qu'il faut pour résoudre la fraction
											//correctement
											} else {
%>
										<div class="row">
											<div class="col-xs-2">
												<h2><%= denominateur1 %></h2>
											</div>
											<div class="col-xs-1 ">
												<h2>=</h2>
											</div>
											<div class="col-xs-4">
												</br>
												<div id="mcmDiv1" class="form-group">
													<input type="text" class="form-control" name="mcm1"
														id="mcm1" placeholder="resultado">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-2">
												<h2><%= denominateur2 %></h2>
											</div>
											<div class="col-xs-1 ">
												<h2>=</h2>
											</div>
											<div class="col-xs-4">
												</br>
												<div id="mcmDiv2" class="form-group">
													<input type="text" class="form-control" name="mcm2"
														id="mcm2" placeholder="resultado">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xs-2 ">
												<h2>mcm</h2>
											</div>
											<div class="col-xs-1 ">
												<h2>=</h2>
											</div>
											<div class="col-xs-2 ">
												</br>
												<div id="mcmResF" class="form-group">
													<input type="text" class="form-control" name="mcmFinal"
														id="mcmFinal" placeholder="MCM">
												</div>
											</div>
										</div>
										<% 
										//Si l'utilisateur à bien entrer la bonne décomposition dupremier denomintateur 
										//(on campare ceci grace au resultat dela requete de Wolframe) 
										if (new Wolframe(listreponses.get(listreponses.size()-1).getRep1() +"=" +wolframe.recupFacteur()).resultIsTrue().equalsIgnoreCase("true")){ 
%>

										<script type="text/javascript">
											$('#mcm1').val(
										<%=reponseFacteurd1%>
											);
											$('#mcmDiv1').addClass(
													'has-success');
										</script>
										<%										
										}else if (reponseFacteurd1 == "0") { 								
											} else { 
%>
										<script type="text/javascript">
											$('#mcm1').val(
										<%=reponseFacteurd1%>
											);
											$('#mcmDiv1').addClass('has-error');
										</script>
										<%									
											} 
										//Si l'utilisateur à bien entrer la bonne décomposition du deuxieme denomintateur 
										//(on campare ceci grace au resultat dela requete de Wolframe) 
										if (new Wolframe(reponseFacteurd2 +"=" +wolframe1.recupFacteur()).resultIsTrue().equalsIgnoreCase("true")){ 
%>

										<script type="text/javascript">
											$('#mcm2').val(
										<%=reponseFacteurd2%>
											);
											$('#mcmDiv2').addClass(
													'has-success');
										</script>
										<%										
										} else if (reponseFacteurd2 == "0") { 
											} else { 
%>
										<script type="text/javascript">
											$('#mcmDiv2').addClass('has-error');
										</script>
										<%										
													} 

										//Si l'utilisateur à bien entrer le resultat du MCM Final 
										//(on campare ceci grace au resultat dela requete de Wolframe) 
										if (wolframe2.recupMCM().equals(reponseMCMFinal)){ 
%>

										<script type="text/javascript">
											$('#mcmFinal').val(
										<%=reponseMCMFinal%>
											);
											$('#mcmResF').addClass(
													'has-success');
										</script>
										<%										
										} else if (reponseMCMFinal == "0") { 
											} else { 
%>
										<script type="text/javascript">
											$('#mcmResF').addClass('has-error');
										</script>
										<%						
										
										} 
										}
											
											} catch(Exception e){ } 
%>
										<script type="text/javascript">
											if ($('#mcmResF').hasClass(
													'has-success')
													&& $('#mcmDiv2').hasClass(
															'has-success')
													&& $('#mcmDiv1').hasClass(
															'has-success')) {
												$('#savemcm').val("show");
											}
										</script>
									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<input type="submit" class="btn btn-success">
									<button type="button" class="btn btn-primary" value="hidden"
										id="savemcm" onclick="addSimple()">Save changes</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- DEUXIEME PARTIE DE L'EXERCICE-->
				<!-- Button trigger modal qui est ici un input -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-success btn-lg"
					data-toggle="modal" data-target="#myModalContinuar">Continuar</button>
				<!-- Modal -->
				<div class="modal fade" id="myModalContinuar" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Adición de las
									fracciones a un denominador común.</h4>
							</div>
							<form name="addition" action="ReponseCreate2" method="post">
								<div class="modal-body">
									<div class="container-fluid">
										<div class="row">
											<% 	
										if(denominateur1 != denominateur2){
											
												%>
											<div class="col-xs-3">
												<div id="resDiv1" class="form-group">
													<input type="number" class="form-control" name="resNum1"
														id="resNum1" placeholder="numerador">
													<hr style="width: 100%;" />
													<h3 class="text-center"><%=ppcm%></h3>
												</div>
											</div>

											<div class="col-xs-1">
												</br>
												<h2 class="text-center">+</h2>
												</br>
											</div>

											<div class="col-xs-3">
												<div id="resDiv2" class="form-group">
													<input type="number" class="form-control" name="resNum2"
														id="resNum2" placeholder="numerador">
													<hr style="width: 100%;" />
													<h3 class="text-center"><%=ppcm%></h3>
												</div>
											</div>

											<div class="col-xs-1">
												</br>
												<h2 class="text-center">=</h2>
												</br>
											</div>

											<div class="col-xs-3">
												<div id="resFinal" class="form-group">
													<input type="number" class="form-control" name="numFinal"
														id="numFinal" placeholder="numerador">
													<hr style="width: 100%;" />
													<h3 class="text-center"><%=ppcm%></h3>
												</div>
											</div>
											<%
										}
										//Si l'utilisateur à bien entrer le bon numerateur de la fraction 
										//(on campare ceci grace au resultat dela requete de Wolframe) 
										if(Integer.toString(f3.getNumerateur()).equals(numSimpl1)){
%>

										<script type="text/javascript">
											$('#resNum1').val(
										<%=f3.getNumerateur()%>
											);
											$('#resDiv1').addClass('has-success');
										</script>
										<%										
										} else if (numSimpl1 == "0") { 
											} else { 
%>
										<script type="text/javascript">
											$('#resDiv1').addClass('has-error');
										</script>
										<%						
										
										}
										//Si l'utilisateur à bien entrer le bon numerateur2 de la fraction 
										//(on campare ceci grace au resultat dela requete de Wolframe) 
										if(Integer.toString(f4.getNumerateur()).equals(numSimpl2)){
%>

										<script type="text/javascript">
											$('#resNum2').val(
										<%=f4.getNumerateur()%>
											);
											$('#resDiv2').addClass('has-success');
										</script>
										<%										
										} else if (numSimpl2 == "0") { 
											} else { 
%>
										<script type="text/javascript">
											$('#resDiv2').addClass('has-error');
										</script>
										<%						
										
										}
										//Si l'utilisateur à bien entrer le bon numerateur de la fraction 
										//(on campare ceci grace au resultat dela requete de Wolframe) 
										if(Integer.toString(res.getNumerateur()).equals(numSimplFinal)){
%>

										<script type="text/javascript">
											$('#numFinal').val(
										<%=res.getNumerateur()%>
											);
											$('#resFinal').addClass('has-success');
										</script>
										<%										
										} else if (numSimplFinal == "0") { 
											} else { 
%>
										<script type="text/javascript">
											$('#resFinal').addClass('has-error');
										</script>
<%																
										}
%>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-success">
											<button type="button" class="btn btn-primary" value="hidden"
												id="savemcm" onclick="addSimple()">Save changes</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- TROISIEME PARTIE DE L'EXERCICE-->
				<!-- Button trigger modal qui est ici un input -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-success btn-lg"
					data-toggle="modal" data-target="#myModalSimplification">Simplification</button>
				<!-- Modal -->
				<div class="modal fade" id="myModalSimplification" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Simplificación de la fracción calcula previamente</h4>
							</div>
							<form name="simplification" action="ReponseCreate2" method="post">
								<div class="modal-body">
									<div class="container-fluid">
										<div class="row">
											<div class="row">
											<div class="col-xs-2">
												<h2><%= res.getNumerateur() %></h2>
											</div>
											<div class="col-xs-1 ">
												<h2>=</h2>
											</div>
											<div class="col-xs-5">
												</br>
												<div id="mcmDiv1" class="form-group">
													<input type="text" class="form-control" name="mcm1"
														id="mcm1" placeholder="factorización en factores primos">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-2">
												<h2><%= res.getDenominateur() %></h2>
											</div>
											<div class="col-xs-1 ">
												<h2>=</h2>
											</div>
											<div class="col-xs-5">
												</br>
												<div id="mcmDiv2" class="form-group">
													<input type="text" class="form-control" name="mcm2"
														id="mcm2" placeholder="factorización en factores primos">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-xs-2 ">
												<h2>mcd</h2>
											</div>
											<div class="col-xs-1 ">
												<h2>=</h2>
											</div>
											<div class="col-xs-2 ">
												</br>
												<div id="mcmResF" class="form-group">
													<input type="text" class="form-control" name="mcmFinal"
														id="mcmFinal" placeholder="MCM">
												</div>
											</div>
										</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-success">
											<button type="button" class="btn btn-primary" value="hidden"
												id="savemcm" onclick="addSimple()">Save changes</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function addSimple() {
	 <%int str = res.getNumerateur(), str2 = res.getDenominateur();%>
	var html = "<div class=\"col-xs-2\"><h2 class=\"text-center\">"
				+
<%=str%>
	+ "</h2><hr style=\"width: 100%\" /><h2 class=\"text-center\">"
				+
<%=str2%>
	+ "</h2></div>";
		$("#suite").html(html);
	}
	if ($('#savemcm').val() == "hidden") {
		$('#savemcm').hide();
	} else {
		$('#savemcm').show();
	}
</script>
</html>
