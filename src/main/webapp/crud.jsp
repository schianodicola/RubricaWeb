<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.model.entities.Contact" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
table {
	border-collapse:collapse
}
td, th {
	border:1px solid #ddd;
	padding:8px 20px;
}

</style>

<meta charset="ISO-8859-1">
<title>CRUD</title>
</head>

<body>
<div align="center">

<h3>Inserisci Nuovo contatto:</h3>
	<form method="post" action="/RubricaWeb/CrudServlet?action=insert">
		<p>
			Nome: <input type="text" name="name">
		</p>
		<p>
			Cognome: <input type="text" name="surname">
		</p>
		<button type="submit">Aggiungi</button>
	</form>
	
<hr>

	<%  
		List<Contact> contatti = (List<Contact>) request.getAttribute("contatti");
 	%>

 	<h1>Lista Contatti</h1>
 <!-- <form method="post" action="/RubricaWeb/CrudServlet?action=delete">     value="<c:out value="${u.id }" />" -->

	<table>
	<thead>
		<tr>
			<td><b>ID</b></td>
			<td><b>Nome</b></td>
			<td><b>Cognome</b></td>
			<td><b>Contact Info</b></td>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${contatti}" var="u" >
		
		<tr>
			<td><c:out value="${u.id }"></c:out></td>
			<td><c:out value="${u.name }"></c:out></td>
			<td><c:out value="${u.surname }"></c:out></td>
			<!-- <td><c:out value="${u.emails }"></c:out></td> -->
			<td> 
				<a href="/RubricaWeb/CrudServlet?action=info&id=${u.id } "> Info</a> 
			</td>
			<td>
				<a href="/RubricaWeb/CrudServlet?action=delete&id=${u.id } "> Elimina</a>
				<!-- <button type="submit" value="<c:out value="${u.id }" />" > Elimina</button>  -->
			</td>
		</tr>
	</c:forEach>
	</tody>
	</table>

</form>


</div>
</body>
</html>