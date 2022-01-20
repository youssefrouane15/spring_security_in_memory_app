<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Luv2code Company home page</title>
</head>
<body>
	<h2>Luv2code Company home page</h2>
	<hr>
	<p>>Welcome to the Luv2code Company home page !!</p>
	
	<hr>
		<!-- display username and role -->
		<p> 
			User: <security:authentication property="principal.username"/>
			<br><br>
			Role(s): <security:authentication property="principal.authorities"/>
		</p>
	
	<!-- add a link to point to /leaders, for the managers -->
	<security:authorize access="hasRole('MANAGER')">
		<hr>
		<p> 
		<a href="${pageContext.request.contextPath}/leaders">Leadership meeting</a> 
		(Only for Manager peeps)
		</p>
	</security:authorize>

	
	<!-- add a link to point to /systems, for admins only -->
	<security:authorize access="hasRole('ADMIN')">
		<hr>
		<p> 
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a> 
			(Only for Admin peeps)
		</p>
	</security:authorize>

	
	<hr>


	<!--  add logout support -->

	<form:form action="${pageContext.request.contextPath}/logout"
		method="POST">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>