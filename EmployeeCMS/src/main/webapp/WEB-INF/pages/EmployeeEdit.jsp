<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee CMS</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
</head>

<body>
	<%@include file="menu.html"%>
	<div class="flex container">
		<div class="card">
			<div class="card-header bg-primary text-white text-center">
				<h3>EMPLOYEE CMS Edit</h3>
			</div>

			<div class="card-body">
				<form:form action="update" method="post" modelAttribute="employee">

					<label for="empId">Id:</label>
					<form:input path="empId" class="form-control" readonly="true" />

					<label for="empName">Name</label>
					<form:input path="empName" class="form-control" />

					<label for="empSal">Salary</label>
					<form:input path="empSal" class="form-control" min="0"/>

					<label for="empDept">Department Select</label>
					<form:select path="empDept" class="form-control">
						<form:option value=" ">-SELECT-</form:option>
						<form:option value="BA">BA</form:option>
						<form:option value="QA">QA</form:option>
						<form:option value="SD">SD</form:option>
					</form:select>

					<input type="submit" value="UPDATE" class="btn btn-success">

				</form:form>
			</div>
			<div class="card-footer">
				<b>${message}</b>
			</div>

		</div>
	</div>
</body>
</html>