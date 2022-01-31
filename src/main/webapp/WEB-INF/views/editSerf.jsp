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
	<div class="bg-success text-white">
		<h2>Logged In: ${userLog.firstName} ${userLog.lastName}</h2>
		<a class="text-white" href="/logout">Logout</a>
	</div>
	<div class="d-flex justify-content-center flex-column align-items-center bg-success text-white mb-5">
		<h2>Edit:</h2>
		<a class="text-white" href="/dashboard">Home</a>
	</div>

	
	<div class="container d-flex flex-column justify-content-center align-items-center">
	<form:form action="/edit/serf/proc/${car.id}" method="POST" modelAttribute="car">
	<form:input type="hidden" value="${car.owner.id}" path="owner" />

		<div class="form-group">
			<form:label path="make">Make:</form:label>
			<form:errors path="make" class="text-danger" />
			<form:input path="make" />
		</div>
		<div class="form-group">
			<form:label path="model">Model:</form:label>
			<form:errors path="model" class="text-danger" />
			<form:input path="model" />
		</div>
		<div class="form-group">
			<form:label path="color">Color:</form:label>
			<form:errors path="color" class="text-danger" />
			<form:input path="color" />
		</div>
		<div class="form-group">
			<form:label path="year">Year:</form:label>
			<form:errors path="year" class="text-danger" />
			<form:input type="number" path="year" />
		</div>
		<div class="form-group">
			<form:label path="transmission">Transmission:</form:label>
			<form:errors path="transmission" class="text-danger" />
			<form:input path="transmission" />
		</div>
		<br/>

		<button>Edit</button>
		
		<a href="/serf/show/${car.id}" class="btn btn-danger">Back</a>
	</form:form>
	</div>


</body>
</html>