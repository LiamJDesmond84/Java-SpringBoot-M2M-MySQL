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

	<div class="d-flex justify-content-center flex-column align-items-center bg-success text-white">
<h2>${car.model}'s Info</h2>
<a class="text-white" href="/dashboard">Home</a>
	<hr/>

</div>

<div class="container d-flex flex-row">
<div class="container d-flex flex-column justify-content-center align-items-center">
	<table class="table table-striped mt-2">
		<tbody>
			<tr>
				<th scope="row">Make:</th>
				<td>${car.make}</<td>
			</tr>
			<tr>
				<th scope="row">Model:</th>
				<td>${car.model}</<td>
			</tr>
			<tr>
				<th scope="row">Color:</th>	
				<td>${car.color}</td>
			</tr>
			<tr>
				<th scope="row">Year:</th>	
				<td>${car.year}</td>
			</tr>
			<tr>
				<th scope="row">Transmission:</th>	
				<td>${car.transmission}</td>
			</tr>
		</tbody>
	</table>
	

	
<p><a href="/newSideForm" class="btn btn-primary">Add an accessory</a></p>	
<h3>Accessories:</h3>
 	<ol>
		<c:forEach items="${car.accessories}" var="x">
		<li>${x.name} - ${x.price} - ${x.description}</li>
		</c:forEach>
	</ol>
	
	
	
	<h3>Owner:</h3>
	<p><a href="/user/show/${car.owner.id}">${car.owner.firstName} ${car.owner.lastName}</a></p>
	
	
<c:if test="${car.owner.id == userLog.id}">
	<div class="container d-flex flex-row justify-content-center">
		<a href="/edit/serf/${car.id}" class="btn btn-warning">Edit</a>
		<button onclick="location.href=`/delete/serf/${car.id}`" class="btn btn-danger">Delete</button>
	</div>
</c:if>

<%-- <c:if test="${car.owner.id == userLog.id}">
<form:form action="/edit/serf/proc/${car.id}" method="POST" modelAttribute="car">
		<form:input type="hidden" value="${car.owner.id}" path="owner" />
<br/>

<h3>Edit Details</h3>	
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
		<button>Update Details</button>
</form:form>
</c:if> --%>


</div>


						<%--If/Else--%>
<div class="container d-flex flex-column justify-content-center align-items-center">
<c:choose>
<c:when test="${ car.title != null }">
<h2>Tag Details</h2>
	<h4>City:</h4>
	<p>${car.title.city}</p>
	<h4>State:</h4>
	<p>${car.title.state}</p>
	
</c:when>
<c:otherwise>
<div class="container">
	<h2>Register This Vehicle:</h2>
	<form:form action="/addOneToOne/${car.id}" method="POST" modelAttribute="title">
		<div class="form-group">
			<form:label path="city">City:</form:label>
			<form:errors path="city" class="text-danger" />
			<form:input path="city" />
		</div>
		<br/>
		<div class="form-group">
			<form:label path="state">State:</form:label>
			<form:errors path="state" class="text-danger" />
			<form:input path="state" />
		</div>
		<div class="form-group">
			<form:label path="vin">VIN Number:</form:label>
			<form:errors path="vin" class="text-danger" />
			<form:input path="vin" />
		</div>
		<form:hidden path="car" value="${car.id}"/>
		<br/>
		<button>Add Title to ${car.make} ${car.model}</button>
	</form:form>
</div>
</c:otherwise>
</c:choose>
</div>
						<%-- If/Else End --%>

</div>
</body>
</html>