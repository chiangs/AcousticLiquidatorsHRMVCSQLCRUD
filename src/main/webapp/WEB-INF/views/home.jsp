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


	<form action="getEmployeeInfo.do" method="GET">
		<input type="text" name="name"> <input type="submit"
			value="Get Employee By Name">
	</form>

	<c:if test="${! empty employee }">
		<b>Name: </b>${employee.name}<br>
		<b>Address: </b> ${employee.address}<br>
		<b>Department: </b> ${employee.department}<br>
		<b>Salary:</b> ${employee.salary }<br>
			
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
