<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
    <%@ page isErrorPage="true"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="bg-success text-white">
		<h2>Welcome ${userLog.firstName}!</h2>
	</div>
	<a href="/logout">Logout</a>
	<div class="d-flex flex-column justify-content-center align-items-center">
		<h1>List</h1>
	</div>
	<div class="container">
	
			<button onclick="location.href=`/newSerfForm`" class="btn btn-success mb-2">Add Car</button>
		<%--<a href="toys/new">Add Toy</a>--%>
		<table class="table table-dark">
			<thead>
			<tr>
				<th>Id</th>
				<th>Make</th>
				<th>Model</th>
				<th>Color</th>
				<th>Year</th>
<!-- 				<th>Likes</th> -->
				<th>Transmission</th>
				<th>Owner</th>
				<th>Registered</th>
				<th>Action</th>
			</tr>
			</thead>
			
			<tbody> <!-- Loop through all dogs -->
			<c:forEach items="${allSerfs}" var="x">
			
			<tr>
				<td>${x.id}</td>

				<td><a href="/serf/show/${x.id}">${x.make}</a></td>
				<td>${x.model}</td>
				
				<td>${x.color}</td>
				<td>${x.year}</td>
<%-- 				<td>${x.likers.size()}</td> --%>
				<td>${x.transmission}</td>


				<td><a href="/user/show/${x.owner.id}">${x.owner.firstName}</a></td>
				
												<%--If/Else--%>
				<c:choose>
					<c:when test="${x.title == null}">
						<td>No</td>
					</c:when>
					<c:otherwise>
						<td>Yes</td>
					</c:otherwise>
				</c:choose>
												<%--If/Else End--%>
				
				<c:if test="${x.owner.id == userLog.id}">
					<td><a href="/delete/serf/${x.id}">Delete</a></td>
				</c:if>
								<%--If/Else--%>
<%-- 			<c:choose>

					If User Created This
					<c:when test="${x.owner.id == userLog.id}">
						<td><a href="/delete/serf/${x.id}">Delete</a></td>
					</c:when>
						
					If User Already Liked This	
					<c:when test="${x.rsvpers.contains(userLog)}">
						<td><a href="/unrsvp/${x.id}">un-RSVP</a></td>
					</c:when>
						
					If User Hasn't Liked This	
					<c:otherwise>
						<td><a href="/rsvp/${x.id}">RSVP</a></td>
					</c:otherwise>
				
				</c:choose> --%>
								<%--If/Else End--%>
				
			</tr>
			
			</c:forEach>
			</tbody>	
		</table>


	</div>
	
					<%--If/Else--%>
				<%--<td>
				<c:choose>
				
				<c:when test="${x.tag != null }">
				Registered
				</c:when>
				
				<c:otherwise>
				Not Registered
				</c:otherwise>
				
				</c:choose>
				</td>--%>
				<%--If/Else End--%>
</body>
</html>