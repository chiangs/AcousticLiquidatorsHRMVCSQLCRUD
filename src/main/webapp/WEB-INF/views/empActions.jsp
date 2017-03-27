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
	<div class="container-fluid">

		<!-- Add Form -->
		<div class="formContent">
			<div class="row">
				<div class="col-xs-12 col-md-4 col-lg-4">
				<div class="well">
					<form action="addEmployee.do" method="POST">
						<h2>Add Form</h2>
						<hr>
						First Name: <input class="form-control" type="text" name="firstName"><br>
						Last Name: <input class="form-control" type="text" name="lastName"><br>
						Street:<input class="form-control" type="text" name="street"><br>
						DOB: <input class="form-control" type="text" name="dob"><br> Job Title: <input class="form-control" 
							type="text" name="jobTitle"><br> Salary Level: <input class="form-control" 
							type="text" name="salaryLevel"><br> Department ID: <input class="form-control" 
							type="text" name="departmentID"><br> Supervisor: <input class="form-control" 
							type="text" name="supervisor"><br> Hire Date: <input class="form-control" 
							type="text" name="hireDate"><br> Email: <input class="form-control" 
							type="text" name="email"><br>
						<!--  <button type="submit" value="submit">Submit!</button>-->
						<button type="submit" value="submit" class="btn btn-primary">Add!</button>
					</form>
				</div>
				</div>

				<!-- Edit Form -->
				<div class="col-xs-12 col-md-4 col-lg-4">
				<div class="well">
					<h2>Edit Form</h2>

					<form action="getEmployeeInfo2.do" method="POST">
						<input type="text" class="form-control" name="id"
							placeholder="Enter Employee ID#"> <input type="submit"
							class="btn btn-primary" value="Get Information!">
					</form>

					<c:if test="${! empty employee}">
						<form action="update.do" method="POST">
							<br> <input type="hidden" name="employeeID"
								value="${employee.employeeID }"> 
								First Name: <input class="form-control"	type="text" name="firstName" value="${employee.firstName}"><br>
								Last Name: <input class="form-control" type="text" name="lastName"
								value="${employee.lastName}"> 
								<input type="hidden" name="address_id" value="${employee.address.id}"><br>
								DOB: <input class="form-control" type="text" name="dob" value="${employee.dob}"><br> 
								Job Title: <input class="form-control" type="text" name="jobTitle"
								value="${employee.jobTitle}"><br> 
								Salary Level:<select class="form-control" 
								name="salaryLevel" value="${employee.salaryLevel}">
								<option value="6">$1,000,000 +</option>
								<option value="5">$90,000 +</option>
								<option value="4">$60,000 +</option>
								<option value="3">$45,000 +</option>
								<option value="2">$35,000 +</option>
								<option value="1">$18,000 +</option>
							</select> <br> Store ID: <select class="form-control" name="storeID">
								<option value="1">Union Station Store</option>
								<option value="2">RiNo District Store</option>
							</select><br> Department:<select class="form-control" name="departmentID">
								<option value="1">Executive Member</option>
								<option value="2">General Manager</option>
								<option value="3">Store Manager</option>
								<option value="4">Assistant Store Manager</option>
								<option value="5">Full Time Employee</option>
								<option value="6">Part Time Employee</option>
							</select><br> Supervisor:<select class="form-control" name="supervisor">
								<option value="6">Union Store Manager</option>
								<option value="7">Union Assistant Manager</option>
								<option value="8">RiNo Store Manager</option>
								<option value="9">RiNo Assistant Manager</option>
							</select><br> Hire Date:<input class="form-control" type="text" name="hireDate" value=""><br>
							Email:<input class="form-control" type="text" name="email" value=""><br>
							Status:<select class="form-control" name="status">
								<option value="1">Active</option>
								<option value="0">Inactive</option>
							</select>
							<button type="submit" value="submit" class="btn btn-warning">Submit!</button>
						</form>
						<br>
						
						<form action="updateAddress.do" method="POST">
							Address:
								<input class="form-control" type="hidden" name="id"
									value="${employee.address.id}">
								Street Address<input class="form-control" type="text" name="address"
									value="${employee.address.address}">
								City<input class="form-control" type="text" name="city"
									value="${employee.address.city}">
								State<input class="form-control" type="text" name="state_province"
									value="${employee.address.state_province}">
								Postal Code<input class="form-control" type="text" name="postal_code"
									value="${employee.address.postal_code}">
								Country<input class="form-control" type="text" name="country_id"
									value="${employee.address.country_id}">
							<button type="submit" value="submit" class="btn btn-warning" >Submit!</button>
						</form>
					</c:if>

				</div>
				</div>


				<!-- Delete Form -->
				<div class="col-xs-12 col-md-4 col-lg-4">
				<div class="well">
					<div class="deleteForm">
						<h2>Delete Form</h2>
						<form action="deleteEmployee.do" method="POST">
							<select class="form-control" name="empObj">
								<c:forEach var="item" items="${employees}">
									<option value="${item.employeeID}">${item.employeeID}-
										${item.firstName} ${item.lastName}</option>
								</c:forEach>
							</select>
							<button type="submit" value="${item.employeeID}" name="empObj2"
								class="btn btn-danger">Delete</button>
							<br>
						</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="endBody.jsp"%>

</body>
<%@ include file="footer.jsp"%>
</html>