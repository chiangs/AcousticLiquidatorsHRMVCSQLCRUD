<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="headStyles.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${employee.lastName}, ${employee.firstName}</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>


<h1>${employee.lastName}, ${employee.firstName}</h1>
	<div class="empListEdit">


		<form action="getEmployeeInfo.do" method="GET">
			<div class="form-group">
				<input type="text" class="form-control" name="id"
					placeholder="Enter Employee ID#"> <input type="submit"
					class="btn btn-primary" value="Get Information!">
			</div>
		</form>
		
		<form action="editPop.do" method="POST">
			<button type="submit" value="${employee.id}" name="id">Edit</button>
		</form>
		<br>

	<c:if test="${! empty employees}">
		<form action="edit.do" method="POST">
			<br> <input type="hidden" name="id" value="${employee.employeeID}">
			First Name: <input type="text" name="title" value="${employee.firstName}"><br>
			Last Name: <input type="text" name="description"value="${employee.lastName}"><br> 
			Address: <ul>
			         <li>Street Address<input type="text" name="address" value="${employee.address }"></li>
			         <li>City<input type="text" name="city" value="${employee.address }"></li>
			         <li>State<input type="text" name="state" value="${employee.address }"></li>
			         <li>Postal Code<input type="text" name="postal_code" value="${employee.address }"></li>
			         <li>Country<input type="text" name="country_id" value="${employee.address }"></li>
			         <li>Phone<input type="text" name="phone" value="${employee.address }"></li>
			         </ul>
			        
			DOB: <input type="text" name="date_of_birth" value="${employee.dob}"><br>
			Job Title: <input type="text" name="job_title" value="${employee.jobTitle}"><br>
			Salary Level:<select name = "salaryLevel">
			<option value ="6">$1,000,000 +</option>
			<option value ="5">2.$90,000 +</option>
			<option value ="4">3.$60,000 +</option>
			<option value ="3">4.$45,000 +</option>
			<option value ="2">5.$35,000 +</option>
			<option value ="1">5.$18,000 +</option>
			</select> 
			Store ID: <select name = "store_ID">
			<option value ="1">Union Station Store</option>
			<option value ="2"> RiNo District Store</option>
			</select>
			Department:<select name = "department">
			<option value ="1">Executive Member +</option>
			<option value ="2">General Manager</option>
			<option value ="3">Store Manager</option>
			<option value ="4">Assistant Store Manager</option>
			<option value ="5">Full Time Employee</option>
			<option value ="6">Part Time Employee</option>
			</select> 
			Supervisor:<select name = "supervisor">
			<option value ="6">Union Store Manager +</option>
			<option value ="7">Union Assistant Manager</option>
			<option value ="8">RiNo Store Manager</option>
			<option value ="9">RiNo Assistant Manager</option>
			</select>
			Hire Date:<input type="text" name="hireDate"value=""><br>
			Email:<input type="text" name="email"value=""><br>
			Status:<select name = "status">
			<option value ="1">Active</option>
			<option value ="0">Inactive</option>
			</select>
			<button type="submit" value="submit">Submit!</button>
		</form>
	</c:if>
	</div>
	<%@ include file="endBody.jsp"%>

</body>
<%@ include file="footer.jsp"%>

</html>

