<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="headStyles.jsp"%>
<title>Employee Card View</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<h1 class="welcome">${employee.lastName}, ${employee.firstName}</h1>
	<%-- ${employee} --%>
	<c:if test="${! empty employee}">
		<div class="empCard">
			<table class="table table-striped table-hover">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>DOB</th>
					<th>Address ID</th>
					<th>Job Title</th>
					<th>Department ID</th>
					<th>Supervisor</th>
					<th>Salary Level</th>
					<th>Store ID</th>
					<th>Department ID</th>
					<th>Hire Date</th>
					<th>Email</th>
					<th>Status</th>
					<th colspan="2">Actions</th>
				</tr>
				<tr>
					<td>${employee.employeeID}</td>
					<td>${employee.firstName} ${employee.lastName}</td>
					<td>${employee.dob}</td>
					<td>${employee.address.id }</td>
					<td>${employee.jobTitle}</td>
					<td>${employee.departmentID}</td>
					<td>${employee.supervisor}</td>
					<td>${employee.salaryLevel}</td>
					<td>${employee.storeID}</td>
					<td>${employee.departmentID}</td>
					<td>${employee.hireDate}</td>
					<td>${employee.email}</td>
					<td>${employee.status}</td>
					<td>
		<form action="getEmployeeInfo2.do" method="POST">
		<button type="submit" value="${employee.employeeID}" name="id" class="btn btn-warning">Edit</button>
		</form>
		</td> 
		<td>
		<form action="deleteEmployee.do" method="POST">
		<button type="submit" value="${employee.employeeID}" name="empObj" class="btn btn-danger">Delete</button>
		</form>
		</td>
				</tr>
				
			</table>
		</div>
	</c:if>
	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>

</html>
