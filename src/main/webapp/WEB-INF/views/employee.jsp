<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${employee.firstName }${employee.lastName }</title>
</head>
<body>
	<h1>${employee.firstName} ${employee.lastName }</h1>
	<%-- ${employee} --%>
	<c:if test="${! empty employee}">
		<div class="empCard">
			<table>
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
				<tr>
					<td>${employee.employeeID}</td>
					<td>${employee.firstName}${employee.lastName}</td>
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
				</tr>
			</table>
		</div>
	</c:if>

</body>
</html>
