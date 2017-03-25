<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Current Employee</title>
</head>
<body>
	 <c:if test="${! empty employee}">
		<form action="edit.do" method="POST">
			<br> 
			<input type="hidden" name="id" value="${employee.id}">
			First Name: <input type="text" name="firstName" value="${employee.firstName}"><br>
			Last Name: <input type="text" name="lastName" value="${employee.lastName}"><br>
			Address: <br> 
			City: <input type="text" name="city"value="${employee.city}"><br> 
			Country: <input type="text" name="country" value="${employee.country}"><br>
			Phone Number: <input type="text" name="phone" value="${employee.phone}"><br>
		    DOB: <input type="text" name="dob" value="${employee.dob}"><br>
			Employee ID: <input type="text" name="empID" value="${employee.empId}"><br>
			Job Title: <input type="text" name="length" value="${employee.jobTitle}"><br> 
			Department: <input type="text" name="jobTitle" value="${employee.department}"><br> 
			Supervisor: <input type="text" name="supervisor" value="${employee.supervisor}"><br> 
			Hire Date: <input type="text" name="hireDate" value="${employee.hireDate}"><br> 
			Employment Status: <input type="text" name="status" value="${employee.status}"><br> 
			<select
				name="status">
				<option value="Active">G</option>
				<option value="Inactive">PG</option>
			</select> <br>
			<button type="submit" value="submit">Submit!</button>
		</form>
	</c:if> 
</body>
</html>

