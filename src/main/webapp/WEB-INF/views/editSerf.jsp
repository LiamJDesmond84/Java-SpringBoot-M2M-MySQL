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

	<div class="d-flex flex-row align-items-center bg-success text-white">
	<div class="d-flex justify-content-center flex-column">
	
		<h4>Logged In:</h4>
		<h4>${userLog.firstName} ${userLog.lastName}</h4>
		<a class="btn btn-info" href="/logout">Logout</a>
	</div>

<div class="d-flex justify-content-center flex-column align-items-center col-11">
<h2>Edit</h2>
<a class="btn btn-dark" href="/dashboard">Home</a>
	<hr class="border border-dark" style="width: 600px;"/>

	<hr/>
</div>
</div>

	
	<div class="container d-flex flex-column justify-content-center align-items-center">
	<form:form class='card p-3 bg-light' action="/edit/serf/proc/${car.id}" method="POST" modelAttribute="car">
	<form:input type="hidden" value="${car.owner.id}" path="owner" />

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
		<br/>
			<form:label path="transmission">Transmission:</form:label>
			<form:input path="transmission" />
			<form:errors path="transmission" class="text-danger" />
		</div>
		<br/>
		<c:if test="${car.owner.id == userLog.id}">
			<div class="container d-flex flex-row justify-content-center">
				<button class="btn btn-warning">Update</button>
				<a href="/delete/serf/${car.id}" class="btn btn-danger">Delete</a>
			</div>
		</c:if>	
	</form:form>
	<hr class="border border-dark" style="width: 600px;"/>

			<a href="/serf/show/${car.id}" class="btn btn-primary">Back</a>
			

	</div>


</body>
</html>