<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Edit Page</title>
</head>
<body>

<form action="addEmployee.do" method="POST">
	<input type="submit"
			value="Add Employee">
			</form>
			
			
		<div class="empListEdit">
		<table>
			<tr>
				<th>Employee Id</th>
				<th>Name</th>
				<th>DOB</th>
				<th>Address ID</th>
				<th>Job Title</th>
				<th>Department</th>
				<th>Supervisor</th>
				<th>Salary Level</th>
				<th>Store ID</th>
				<th>Department ID</th>
				<th>Hire Date</th>
				<th>Email</th>
				<th>Status</th>
				
		<c:if test="${! empty employees}">
			<c:forEach items="${employees}" var="employee">
				<tr>
							<td>${employee.employeeID}</td>
							<td>${employee.firstName} ${employee.lastName}</td>
							<td>${employee.dob}</td>
							<td>${employee.address_id }</td>
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
		<form action="deleteEmployee.do" method="POST">
		<button type="submit" value="${employee.employeeID}" name="id">Delete</button>
		</form>
		</td>

		<td>
		<form action="editPop.do" method="POST">
		<button type="submit" value="${employee.employeeID}" name="id">Edit</button>
		</form>
		</td> 
						 <tr>
					</c:forEach>
				</c:if>
		</table>
	</div>

</body>
</html>

