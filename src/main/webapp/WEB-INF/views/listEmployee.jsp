<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="headStyles.jsp"%>
<title>AL Employee List</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<div class="listEmp">
		<form action="getEmployeeInfo.do" method="GET">
			<div class="form-group">
				<input type="text" class="form-control" name="id"
					placeholder="Enter Employee ID#"> <input type="submit"
					class="btn btn-primary" value="Get Information!">
			</div>
		</form>

		<table class="table table-striped table-hover">
			<tr>
				<th>Employee Id</th>
				<th>Job Title</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Department</th>
				<th>Supervisor</th>
				<th>Status</th>
				<th colspan="2">Actions</th>
				<c:if test="${! empty employees}">
					<c:forEach items="${employees}" var="employee">
						<tr>
							<td>${employee.employeeID}</td>
							<td>${employee.jobTitle}</td>
							<td>${employee.firstName}</td>
							<td>${employee.lastName}</td>
							<td>${employee.departmentID}</td>
							<td>${employee.supervisor}</td>
							<td>${employee.status}</td>
							
		<td>
		<form action="editPop.do" method="POST">
		<button type="submit" value="${employee.employeeID}" name="id" class="btn btn-warning">Edit</button>
		</form>
		</td> 
		<td>
		<form action="deleteEmployee.do" method="POST">
		<button type="submit" value="${employee.employeeID}" name="empObj" class="btn btn-danger">Delete</button>
		</form>
		</td>
	
						<tr>
					</c:forEach>
				</c:if>
		</table>
	</div>

	<%@ include file="endBody.jsp"%>
</body>
<%@ include file="footer.jsp"%>

</html>
