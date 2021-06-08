<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="it.rdev.rubrica.model.entities.Contact" %>
<%@ page import="it.rdev.rubrica.model.entities.Email" %>
<%@ page import="it.rdev.rubrica.model.entities.Phone" %>
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
<title>Informazioni Contatto</title>
</head>
<body>

	<%  
		Contact co = (Contact) request.getAttribute("contatto");
		Set<Email> em= co.getEmails();
		Set<Phone> ph= co.getPhones();
		
		Iterator emm= em.iterator();
		Iterator phh= ph.iterator();
		int app;
		if(em.size()>ph.size()) app=em.size();
		else app=ph.size();
		
	%>
	
	<h1>Informazioni Contatto</h1>
	<h3><%=co.getName() %> <%=co.getSurname() %> </h3>
	
	<table>
	<thead>
		<tr>
			<td><b>Email</b></td>
			<td><b>Telefono</b></td>
			
		</tr>
	</thead>
	<tbody>
		
	
	<%  while(emm.hasNext() || phh.hasNext() ){  %>
		<tr>
			<td>
			<% if(emm.hasNext()){ %>
			<%=emm.next().toString() %> 
			<%} %>
			</td>
			<td>
			<% if(phh.hasNext()){ %>
			<%=phh.next().toString() %>
			<%} %>
			 </td>
		</tr>
	<%} %>
	
	</tbody>
	</table>
	
	
	
</body>
</html>