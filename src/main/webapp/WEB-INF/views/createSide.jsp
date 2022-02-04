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
	<div class="d-flex flex-row align-items-center bg-success text-white">
	<div class="d-flex flex-column w-auto">
	
		<h4 class="text-danger">Logged In:</h4>
		<h4>${userLog.firstName} ${userLog.lastName}</h4>
		<a class="btn btn-info mb-1" href="/logout">Logout</a>
	</div>

<div class="d-flex justify-content-center flex-column align-items-center col-11 w-75">
<h2>Add Something</h2>
<a class="btn btn-dark mb-1" href="/dashboard">Home</a>

</div>
</div>
	
	
	<div class="container d-flex flex-column justify-content-center align-items-center">

		<form:form class='card p-3 bg-light' action="/create/side" method="POST" modelAttribute="accessory">
		
			<div class="form-group">
				<form:label path="name">Name:</form:label>
				<form:input path="name" />
				<br/>
				<form:errors path="name" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="price">Price:</form:label>
				<form:input path="price" />
				<br/>
				<form:errors path="price" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="description">Description:</form:label>
				<form:input path="description" />
				<br/>
				<form:errors path="description" class="text-danger" />
			</div>
			
			<form:label path="mainOwner">Car:</form:label>
		 	<form:select path="mainOwner">
	 			<c:forEach items="${everything}" var="x">
	 				<form:option value="${x.id}">${x.make} ${x.model}</form:option>
	 			</c:forEach>
		 	</form:select>
		 	<form:input type="hidden" value="${x.id}" path="mainOwner" />
	
			<button>Create</button>
	
		</form:form>

	</div>
</body>
</html>