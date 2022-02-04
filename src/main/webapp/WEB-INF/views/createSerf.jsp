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
	<div class="d-flex flex-column col-1 w-auto">
	
		<h4 class="text-danger">Logged In:</h4>
		<h4>${userLog.firstName} ${userLog.lastName}</h4>
		<a class="btn btn-info mb-1" href="/logout">Logout</a>
	</div>

<div class="d-flex  flex-column align-items-center col-11 w-75">
<h2>Add Something</h2>
<a class="btn btn-dark mb-1" href="/dashboard">Home</a>

</div>
</div>
	

	<div class="container d-flex flex-column justify-content-center align-items-center mt-2">

	<form:form class='card p-3 bg-light' action="/create/serf" method="POST" modelAttribute="carForm">
	
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

</div>
</body>
</html>