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
	<div class="d-flex flex-column w-auto">
	
		<h4 class="text-danger">Logged In:</h4>
		<h4>${userLog.firstName} ${userLog.lastName}</h4>
		<a class="btn btn-info" href="/logout">Logout</a>
	</div>

<div class="d-flex justify-content-center flex-column align-items-center col-11 w-75">
<h2>${car.model}'s Info</h2>
<a class="btn btn-dark mb-1" href="/dashboard">Home</a>

<%--Edit ------------- Delete--%>
<c:if test="${car.owner.id == userLog.id}">

	<div class="container d-flex flex-row justify-content-center">
		<a href="/edit/serf/${car.id}" class="btn btn-warning">Edit</a>
		<button onclick="location.href=`/delete/serf/${car.id}`" class="btn btn-danger">Delete</button>
	</div>
</c:if>

	<hr/>
</div>
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
			<tr>
				<th scope="row">Owner:</th>	
				<td><a href="/user/show/${car.owner.id}">${car.owner.firstName} ${car.owner.lastName}</a></td>
			</tr>
			<tr>
				
					<th scope="row">Rating:</th>
					<td>
					<c:set var="avg" value="${0}"/>
					<c:forEach items="${car.ratings}" var="x">
					<c:if test="${car.ratings.size() != 0}">
					<c:set var="avg" value="${avg + x.rating}"/>
					</c:if>
					</c:forEach>
					<c:if test="${avg > 0 }">
					<c:set var="avg" value="${avg / car.ratings.size()}"/>
					</c:if>
					${avg}
					</td>
			</tr>
			
		</tbody>
	</table>
	
	<%--Add Ratingggggggg--%>

	<c:set var="userRated" value="false"/>
	<c:forEach items="${car.ratings}" var="x">
	<c:if test="${x.userRating == userLog}">
		<c:set var="userRated" value="true"/>
		<p>You already gave this a rating</p>
	</c:if>
		</c:forEach>


	<c:if test="${userRated == false}">
		<form:form class='card p-3 bg-light' action="/addRating/${car.id}" method="POST" modelAttribute="rating">
			<form:label path="rating">Rate</form:label>
			<form:input type="number" path="rating"/>
			<br/>
			<form:errors path="rating" class="text-danger"/>
			<button>Rate</button>
		</form:form>
	</c:if>
	
	<table class="table table-striped mt-2">
	<thead>
		<tr>
			<th>Name</th>
			<th>Rating</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${car.ratings}" var="x">
		<tr>
			<td>${x.userRating.firstName}</td>

			<td>${x.rating}</td>
			<td>
			<c:choose>
			<c:when test="${userLog == x.userRating}">
				<form action="/removeRating/${x.id}">
					<input type="hidden" name="car" value="${car.id}" />
					<button class="btn btn-danger">Delete</button>
				</form>
			</c:when>
			<c:otherwise>
			<td></td>
			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:forEach>
	</tbody>
	
	</table>
	












<%--Show Many to Many p1--%>	
<h3>Likers:</h3>
 	<ol>
		<c:forEach items="${car.likers}" var="x">
		<li><a href="/user/show/${x.id}">${x.firstName} ${x.lastName}</a></li>
		</c:forEach>
	</ol>	
	


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
</div>
<%--Add One to One if not existing--%>

						<%--If/Else--%>
<div class="container d-flex flex-column justify-content-center align-items-center">
<%--Show Sides--%>
<h3>Accessories:</h3>
 	<ol>
		<c:forEach items="${car.accessories}" var="x">
		<li>${x.name} - ${x.price} - ${x.description}</li>
		</c:forEach>
	</ol>
<c:choose>
<c:when test="${ car.title != null }">
<h2>Tag Details</h2>
	<h4>City:</h4>
	<p>${car.title.city}</p>
	<h4>State:</h4>
	<p>${car.title.state}</p>
	
</c:when>
<c:otherwise>

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

</c:otherwise>
</c:choose>
</div>
<%-- 			<tr>
				
					<th scope="row">Rating:</th>
					<td>
					<c:set var="avg" value="${0}"/>
					<c:forEach items="${car.ratings}" var="x">
					<c:if test="${car.ratings.size() != 0}">
					<c:set var="avg" value="${avg + x.rating}"/>
					</c:if>
					</c:forEach>
					<c:if test="${avg > 0 }">
					<c:set var="avg" value="${avg / car.ratings.size()}"/>
					</c:if>
					${avg}
					</td>
			</tr> --%>


</body>
</html>