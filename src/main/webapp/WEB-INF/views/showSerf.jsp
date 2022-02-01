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


<div class="container d-flex flex-column justify-content-center align-items-center">

	<h3>Make:</h3>
	<p>${car.make}
	<h3>Model:</h3>
	<p>${car.model}</p>
	<h3>Color:</h3>
	<p>${car.color}</p>
	
	<h3>Year:</h3>
	<p>${car.year}</p>
	<h3>Transmission:</h3>
	<p>${car.transmission}</p>
<%-- 	<h3>Toys</h3>
	<ol>
		<c:forEach items="${car.toys}" var="x">
		<li>${x.name} ($${x.price}) - ${x.description}</li>
		</c:forEach>
	</ol> --%>
	<h3>Liked by:</h3>
<%-- 	<ol>
		<c:forEach items="${car.rsvpers}" var="x">
		<li>${x.firstName} ${x.lastName}</li>
		</c:forEach>
	</ol> --%>
	<h3>Owner:</h3>
	<p><a href="/user/show/${car.owner.id}">${car.owner.firstName}</a></p>
	
<c:if test="${car.owner.id == userLog.id}">
<a href="/edit/serf/${car.id}" class="btn btn-warning">Edit</a>
</c:if>
<%--<form:form action="/edit/serf/${car.id}" method="POST" modelAttribute="car">
<c:if test="${car.owner.id == userLog.id}">
<br/>
<h3>Edit Dog</h3>
	
		<div class="form-group">
			<form:label path="name">Name:</form:label>
			<form:errors path="name" />
			<form:input path="name" />
		</div>
		<div class="form-group">
			<form:label path="breed">Breed:</form:label>
			<form:errors path="breed" />
			<form:input path="breed" />
		</div>
		<div class="form-group">
			<form:label path="age">Age:</form:label>
			<form:errors path="age" />
			<form:input path="age" />
		</div>
		<button>Update ${car.name}'s Details</button>
</c:if>
</form:form>--%>
</div>


<div class="container d-flex flex-column justify-content-center align-items-center">
<%--If/Else--%>
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
	<h2>This car needs a Title:</h2>
	<form:form action="/addOneToOne/${car.id}" method="POST" modelAttribute="title">
		<div class="form-group">
			<form:label path="city">City:</form:label>
			<form:errors path="city" />
			<form:input path="city" />
		</div>
		<br/>
		<div class="form-group">
			<form:label path="state">State:</form:label>
			<form:errors path="state" />
			<form:input path="state" />
		</div>
		<div class="form-group">
			<form:label path="vin">VIN Number:</form:label>
			<form:errors path="vin" />
			<form:input path="vin" />
		</div>
		<form:hidden path="car" value="${car.id}"/>
		<br/>
		<button>Add Title to ${car.make} ${car.model}</button>
	</form:form>
</div>
</c:otherwise>
</c:choose>
<%-- If/Else End --%>
</div>

</body>
</html>