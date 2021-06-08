<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="it.rdev.rubrica.dto.User" %>
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
<title>Home</title>
</head>
<body>
<%-- 	<jsp:useBean id="user" scope="request" class="it.rdev.rubrica.dto.User"> --%>
<%-- 		<jsp:setProperty name="user" property="*"/> --%>
<%-- 	</jsp:useBean> --%>
	
<%-- 	<%=user.getUsername()  + " " + user.getPassword() %> --%>
	<%  
		List<Contact> contatti = (List<Contact>) request.getAttribute("contatti");
 	%>
 	<h1>Lista Contatti</h1>
	<table>
	<thead>
		<tr><td><b>Nome</b></td><td><b>Cognome</b></td></tr>
	</thead>
	<tbody>
	<c:forEach items="${contatti}" var="u">
		<tr>
			<td><c:out value="${u.name }"></c:out></td>
			<td><c:out value="${u.surname }"></c:out></td>
		</tr>
	</c:forEach>
	</tody>
	</table>

	
<br>
<br>
<hr>
<a href="secure/SecureResourceServlet">LOGIN - Risorsa Protetta</a>

</body>
</html>