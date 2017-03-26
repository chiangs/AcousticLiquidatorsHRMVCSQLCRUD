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
	<h1>This is where all the Employee info by id will go</h1>
	<%-- ${employee} --%>
	<div class="empCard">
		<table>
			<c:if test="${! empty employees}">
				<c:forEach items="${employees}" var="employee">
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
				</c:forEach>
			</c:if>
		</table>
	</div>

</body>
</html>