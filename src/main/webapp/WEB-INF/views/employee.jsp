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

	<c:if test="${! empty employees}">
		<c:forEach items="${employees}" var="employee">
			<tr>
				<td>${employee.employeeID}</td>
			</tr>
		</c:forEach>
	</c:if>

</body>
</html>