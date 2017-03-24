<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
    <%@ include file="headStyles.jsp" %>
	
<title>Acoustic Liquidators</title>
</head>
<body>
    <%@ include file="navbar.jsp" %>

	<h1>Acoustic Liquidators Employee Terminal</h1>

<a href="addEmployee.do">Add Employee</a>


<<<<<<< HEAD
	<form action="ListEmployeeInfo.do" method="GET">
		<input type="text" name="name"> <input type="submit"
			value="List Employee By Name">
	</form>

	<c:if test="${! empty employee }">
		
=======
	<form action="getEmployeeInfo.do" method="GET">
		<input type="text" name="name"> <input type="submit"
			value="Get Employee By Name">
	</form>

	<c:if test="${! empty employee }">
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
		<b>Name: </b>${employee.name}<br>
		<b>Address: </b> ${employee.address}<br>
		<b>Department: </b> ${employee.department}<br>
		<b>Salary:</b> ${employee.salary }<br>
<<<<<<< HEAD

=======
			
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
		<br>
		<form action="deleteEmployee.do" method="POST">
			<button type="submit" value="${employee.id}" name="id">Delete</button>
		</form>

		<form action="editPop.do" method="POST">
			<button type="submit" value="${employee.id}" name="id">Edit</button>
		</form>
		<br>
	</c:if>
	
	
	
</body>
<!-- footer code fragment -->
    <%@ include file="footer.jsp" %>

</html>
