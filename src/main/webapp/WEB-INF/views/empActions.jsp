<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="headStyles.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Actions</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- Add Form -->
	<div class="col-xs-12 col-md-4 col-lg-4">
		<form action="addEmployee.do" method="POST">
			<h2>Add Form</h2>
			<hr>
			First Name: <input type="text" name="firstName"><br>
			Last Name: <input type="text" name="lastName"><br>
			Address:<br> Street:<input type="text" name="street"><br>
			DOB: <input type="text" name="dob"><br> Job Title: <input
				type="text" name="jobTitle"><br> Salary Level: <input
				type="text" name="salaryLevel"><br> Department ID: <input
				type="text" name="departmentID"><br> Supervisor: <input
				type="text" name="supervisor"><br> Hire Date: <input
				type="text" name="hireDate"><br> Email: <input
				type="text" name="email"><br>
			<!--  <button type="submit" value="submit">Submit!</button>-->
			<button type="submit" value="submit" class="btn btn-primary">Add!</button>
		</form>
	</div>

	<!-- Edit Form -->
	<div class="col-xs-12 col-md-4 col-lg-4">
		<h2>Edit Form</h2>

		<form action="getEmployeeInfo.do" method="GET">
			<input type="text" class="form-control" name="id"
				placeholder="Enter Employee ID#"> <input type="submit"
				class="btn btn-primary" value="Get Information!">
		</form>

	</div>


	<!-- Delete Form -->
	<div class="col-xs-12 col-md-4 col-lg-4">
		<h2>Delete Form</h2>
		<form action="deleteEmployee.do" method="POST">
			<select name="empObj">
				<c:forEach var="item" items="${employees}">
					<option value="${item.employeeID}">${item.employeeID} - ${item.firstName} ${item.lastName}</option>
				</c:forEach>
				</select>
			<button type="submit" value="${item.employeeID}" name="empObj2" class="btn btn-danger">Delete</button>
		</form>
	</div>
	<%@ include file="endBody.jsp"%>

</body>
<%@ include file="footer.jsp"%>
</html>