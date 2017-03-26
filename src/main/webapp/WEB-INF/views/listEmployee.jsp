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

	
	<form action="getEmployeeInfo.do" method="GET">
		<input type="text" name="id"> <input type="submit"
			value="Get Information By ID">
	</form>
	<div class="empList">
		<table>
			<tr>

				<th>Employee Id</th>
				<th>Name</th>
				<th>Job Title</th>
				<th>Department</th>
				<th>Supervisor</th>
				<th>Status</th>
				<c:if test="${! empty employees}">
					<c:forEach items="${employees}" var="employee">
						<tr>
							<td>${employee.employeeID}</td>
							<td>${employee.firstName} ${employee.lastName}</td>
							<td>${employee.jobTitle}</td>
							<td>${employee.departmentID}</td>
							<td>${employee.supervisor}</td>
							<td>${employee.status}</td>
							<br>
							
	
						<tr>
					</c:forEach>
				</c:if>
		</table>
	</div>

<%@ include file="endBody.jsp"%>


</body>
<%@ include file="footer.jsp"%>

</html>
