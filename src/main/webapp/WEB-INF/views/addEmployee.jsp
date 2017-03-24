<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add New Employee</title>
</head>
<body>

	<form action="addEmployee.do" method="POST">
		Employee<br> <br> 
		<hr>
		First Name: <input type="text" name="firstName"><br>
		Last Name: <input type="text" name="lastName"><br>
	    Address:<br>
	    Street:<input type="text" name="street"><br>
		City: <input type="text" name="releaseYear"><br>
		Country: <input type="text" name="country"><br> 
		Phone Number: <input type="text" name="phone"><br>
		DOB: <input type="text" name="dob"><br> 
		Employee ID: <input type="text" name="empId"><br>
		Job Title: <input type="text" name="jobTitle"><br>
		Department: <input type="text" name="department"><br>
		Supervisor: <input type="text" name="supervisor"><br>
		Hire Date: <input type="text" name="hireDate"><br>
		Employment Status: <input type="text" name="status"><br>
		<button type="submit" value="submit">Submit!</button>
	</form>
</body>
</html>