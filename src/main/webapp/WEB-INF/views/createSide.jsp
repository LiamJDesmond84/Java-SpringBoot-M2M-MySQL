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
		<a class="btn btn-info" href="/logout">Logout</a>
	</div>
	<div class="d-flex justify-content-center flex-column align-items-center bg-success text-white mb-5">
		<h2>Add Something:</h2>
		<a class="btn btn-dark  mb-2" href="/dashboard">Home</a>
	</div>
	
	
	<div class="container d-flex flex-column justify-content-center align-items-center">
		<h2 class="d-flex justify-content-center flex-column align-items-center bg-success text-white">Add Something</h2>
		<form:form action="/create/side" method="POST" modelAttribute="accessory">
		
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