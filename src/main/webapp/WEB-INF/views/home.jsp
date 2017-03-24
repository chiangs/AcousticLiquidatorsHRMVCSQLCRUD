<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="headStyles.jsp"%>

<title>AL HR Mgr App</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<h1>Welcome!</h1>

	<!-- Icons/links to functions -->
	<div class="projectthumbs">
		<div class="col-xs-4 col-md-12">
			<div class="icon">
				<a href="listEmployee.do"><img id="inv"
					src="images/empListIcon.png" alt="employee list button"></a>
				<h4 class="text">List Employees (All)</h4>
			</div>
		</div>
		<div class="col-xs-4 col-md-12">
			<div class="icon">
				<a href="editEmployee.do"><img id="inv" src="images/empIcon.png"
					alt="employee actions button"></a>
				<h4 class="text">Employee Actions (Add/Edit/Delete)</h4>
			</div>
		</div>
	</div>


	



</body>
<!-- footer code fragment -->
<%@ include file="footer.jsp"%>

</html>
