<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AL Employee List</title>
</head>
<body>
<a href="addEmployee.do">Add Employee</a>


	<form action="getEmployeeInfo.do" method="GET">
		<input type="text" name="name"> <input type="submit"
			value="Get Employee By Name">
	</form>

	<c:if test="${! empty employee }">
		<b>Name:</b>${employee.firstname} ${employee.lastname}<br>
		<b>Employee Id:</b> ${employee.empID} <br>
		<b>Job Title:</b> ${employee.jobTitle} <br>
		<b>Department</b> ${employee.department} <br>
		<b>Supervisor:</b> ${employee.supervisor} <br>
		<b>Status</b>	${employee.status} <br>
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
</html>
