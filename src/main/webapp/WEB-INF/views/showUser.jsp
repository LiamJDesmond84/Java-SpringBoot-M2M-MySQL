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
<h2>${user.firstName}'s Info</h2>
<a class="text-white" href="/dashboard">Home</a>
	<hr/>

</div>

<div class="container d-flex flex-row">
<div class="container d-flex flex-column justify-content-center align-items-center">
	<table class="table table-striped mt-2">
		<tbody>
		
			<tr>
				<th scope="row">First Name:</th>
				<td>${user.firstName}</<td>
			</tr>
			<tr>
				<th scope="row">Last Name:</th>
				<td>${user.lastName}</<td>
			</tr>
			<tr>
				<th scope="row">Email:</th>	
				<td>${user.email}</td>
			</tr>

		</tbody>
	</table>
<c:if test="${userLog.id == user.id}">
	<div class="container d-flex flex-row justify-content-center">
		<a href="/edit/user/${user.id}" class="btn btn-warning">Edit User</a>
		<button onclick="location.href=`/delete/user/${user.id}`" class="btn btn-danger">Delete User</button>
	</div>
</c:if>
	
<h3>Cars</h3>
<%-- 		<table class="table table-dark">
			<thead>
			<tr>
				<th>Make</th>
				<th>Model</th>
				<th>Year</th>
				<th>Transmission</th>
				<th>Registered</th>
				<th>Action</th>
			</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${user.cars}" var="x">
			
			<tr>
				<td><a href="/serf/show/${x.id}">${x.make}</a></td>
				<td>${x.model}</td>
				<td>${x.year}</td>
				<td>${x.transmission}</td>

												If/Else
				<c:choose>
					<c:when test="${x.title == null}">
						<td>No</td>
					</c:when>
					<c:otherwise>
						<td>Yes</td>
					</c:otherwise>
				</c:choose>
												If/Else End
				
				<c:if test="${userLog.id == x.owner.id}">
					<td><a href="/delete/serf/${x.id}">Delete</a></td>
				</c:if>
				
			</tr>
			
			</c:forEach>
			</tbody>	
		</table> --%>


	
<%--	<h3>Liked by:</h3>
 	<ol>
		<c:forEach items="${user.rsvpers}" var="x">
		<li>${x.firstName} ${x.lastName}</li>
		</c:forEach>
	</ol> --%>

	



<%-- <c:if test="${user.owner.id == userLog.id}">
<form:form action="/edit/user/proc/${user.id}" method="POST" modelAttribute="user">
		<form:input type="hidden" value="${user.id}" path="user" />
<br/>

<h3>Edit Details</h3>	
		<div class="form-group">
			<form:label path="firstName">Make:</form:label>
			<form:errors path="firstName" class="text-danger" />
			<form:input path="firstName" />
		</div>
		<div class="form-group">
			<form:label path="lastName">Model:</form:label>
			<form:errors path="lastName" class="text-danger" />
			<form:input path="lastName" />
		</div>
		<div class="form-group">
			<form:label path="email">Color:</form:label>
			<form:errors path="coemaillor" class="text-danger" />
			<form:input path="email" />
		</div>
		<button>Update Details</button>
</form:form>
</c:if> --%>


</div>


						<%--If/Else--%>
<%-- <div class="container d-flex flex-column justify-content-center align-items-center">
<c:choose>
<c:when test="${ user.title != null }">
<h2>Tag Details</h2>
	<h4>City:</h4>
	<p>${user.car.make}</p>
	<h4>State:</h4>
	<p>${user.title.state}</p>
	
</c:when>
<c:otherwise>
<div class="container">
	<h2>Register This Vehicle:</h2>
	<form:form action="/addOneToOne/${user.id}" method="POST" modelAttribute="title">
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
		<form:hidden path="user" value="${user.id}"/>
		<br/>
		<button>Add Title to ${user.make} ${user.model}</button>
	</form:form>
</div>
</c:otherwise>
</c:choose>
</div> --%>
						<%-- If/Else End --%>

</div>
</body>
</html>