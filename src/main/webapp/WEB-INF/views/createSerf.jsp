<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
    <%@ page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container d-flex flex-column justify-content-center align-items-center">
	<h2 class="d-flex justify-content-center flex-column align-items-center bg-success text-white">Add Something...</h2>
	<form:form action="/create/serf" method="POST" modelAttribute="carForm">
	
		<div class="form-group">
			<form:label path="make">Make:</form:label>
			<form:input path="make" />
			<br/>
			<form:errors path="make" class="text-danger" />
		</div>
		<div class="form-group">
			<form:label path="model">Model:</form:label>
			<form:input path="model" />
			<br/>
			<form:errors path="model" class="text-danger" />
		</div>
		<div class="form-group">
			<form:label path="color">Color:</form:label>
			<form:input path="color" />
			<br/>
			<form:errors path="color" class="text-danger" />
		</div>
		<div class="form-group">
			<form:label path="year">Year:</form:label>
			<form:input type="number" path="year" />
			<br/>
			<form:errors path="year" class="text-danger" />
		</div>
		<div class="form-group">
			<form:label path="transmission">Transmission:</form:label>
			<form:input path="transmission" />
			<br/>
			<form:errors path="transmission" class="text-danger" />
		</div>
		<button>Create</button>

	</form:form>
	<a href="/dashboard">Dashboard</a>
</div>
</body>
</html>