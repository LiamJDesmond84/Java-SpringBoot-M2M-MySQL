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
	 <div class="container d-flex justify-content-center align-items-center justify-content-center">
	 	<h1>Welcome!</h1>
	 </div>
<div class="d-flex">

	 <div class="container d-flex justify-content-center align-items-center">

	    <form:form action="/registerUser" method="post" modelAttribute="newUser">
	        <div class="form-group">
	            <label>First Name:</label>
	            <form:input path="firstName" class="form-control" />
	            <br/>
	            <form:errors path="firstName" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Last Name:</label>
	            <form:input path="lastName" class="form-control" />
	            <br/>
	            <form:errors path="lastName" class="text-danger" />
	            <br/>
	        </div>
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <br/>
	            <form:errors path="email" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <br/>
	            <form:errors path="password" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Confirm Password:</label>
	            <form:password path="confirmPassword" class="form-control" />
	            <br/>
	            <form:errors path="confirmPassword" class="text-danger" />
	        </div>
	        <input type="submit" value="Register" class="btn btn-primary" />
	    </form:form>    
	</div>

	<div class="container d-flex justify-content-center align-items-center">
	    <form:form action="/loginUser" method="post" modelAttribute="newLogin">
	        <div class="form-group">
	            <label>Email:</label>
	            <form:input path="email" class="form-control" />
	            <br/>
	            <form:errors path="email" class="text-danger" />
	        </div>
	        <div class="form-group">
	            <label>Password:</label>
	            <form:password path="password" class="form-control" />
	            <br/>
	            <form:errors path="password" class="text-danger" />
	        </div>
	        <input type="submit" value="Login" class="btn btn-success" />
	    </form:form>
	</div>
</div>
</body>
</html>