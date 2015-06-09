<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<%@page import="library.model.ReponseFactory"%>
<%@page import="library.model.Reponse"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>


<html>
<head>

<title>Reponse list page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

</head>

<%
        ReponseFactory reponseDB = (ReponseFactory)session.getAttribute("reponseDB");
		ReponseFactory reponseDBS = (ReponseFactory)session.getAttribute("reponseDBS");
		Collection reponseS = reponseDBS.getBooks();
        Collection reponse = reponseDB.getBooks();                  
  %>
<body>
	<table border="1">
		<tbody>
			<tr>
				<td><b>Rep1</b></td>
				<td><b>Rep2</b></td>
				<td><b>Mcm</b></td>
			</tr>
<%
      for (Iterator iter = reponse.iterator(); iter.hasNext();) {
            Reponse element = (Reponse) iter.next();
%>
			<tr>
				<td><%= element.getRep1() %></td>
				<td><%= element.getRep2() %></td>
				<td><%= element.getMcm() %></td>
			</tr>
<%              
        }
%>
		</tbody>
		
			<table border="1">
		<tbody>
			<tr>
				<td><b>Reponse num1</b></td>
				<td><b>Reponse num2</b></td>
				<td><b>Reponse numFinal</b></td>
			</tr>
<%
      for (Iterator iter = reponseS.iterator(); iter.hasNext();) {
            Reponse element = (Reponse) iter.next();
%>
			<tr>
				<td><%= element.getRep1() %></td>
				<td><%= element.getRep2() %></td>
				<td><%= element.getMcm() %></td>
			</tr>
<%              
        }
%>
		</tbody>
	</table>
	<br>

</body>
</html>
