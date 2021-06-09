<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="it.rdev.rubrica.model.entities.Contact" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Contact</title>
</head>
<body>

<%  
		Contact co = (Contact) request.getAttribute("contatto");
%>

<h3>Modifica Contatto:</h3>
	<form method="post" action="/RubricaWeb/UpCoServlet?action=update">
		<p>
			ID:<input type="text" name="id" value="<%=co.getId() %>" readonly>
		</p>
		<p>
			Nome: <input type="text" name="name">
		</p>
		<p>
			Cognome: <input type="text" name="surname">
		</p>
		<p>
			Email1: <input type="text" name="email" value="0">
		</p>
		<p>
			Email2: <input type="text" name="email" value="0">
		</p>
		<p>
			Telefono1: <input type="text" name="telefono" value="0">
		</p>
		<p>
			Telefono2: <input type="text" name="telefono" value="0">
		</p>
		<button type="submit">Applica Modifiche</button>
	</form>

</body>
</html>