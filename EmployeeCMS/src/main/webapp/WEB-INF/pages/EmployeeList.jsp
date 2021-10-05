<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link href="https://cdn.datatables.net/1.11.2/css/dataTables.bootstrap4.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.2/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>
	<%@include file="menu.html" %>
	<div class="flex container">
		<a href="excel" class="btn btn-success">EXCEL EXPORT <i class="fa fa-file-excel-o" aria-hidden="true"></i></a> |
        
        <a href="pdf" class="btn btn-success">PDF EXPORT <i class="fa fa-file-pdf-o" aria-hidden="true"></i></a> |
          
		<table id="example" class="table table-striped table-bordered" style="width:100%">
		<thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>SAL</th>
                <th>DEPT</th>
                <th>HRA</th>
                <th>TA</th>
                <th>Operation</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ob">
            <tr>
                <td>${ob.empId}</td>
                <td>${ob.empName}</td>
                <td>${ob.empSal}</td>
                <td>${ob.empDept}</td>
                <td>${ob.empHra}</td>
                <td>${ob.empTa}</td>
                <td>
                	<a href="delete?id=${ob.empId}" class="btn btn-danger">DELETE <i class="fa fa-trash-o" aria-hidden="true"></i> </a>
                	
                	<a href="edit?id=${ob.empId}" class="btn btn-warning">Edit <i class="Example of pencil-square-o fa-pencil-square-o" aria-hidden="true"></i> </a>
                </td>
            </tr>
            
         </c:forEach>   
        </tbody>    
					
	</table>
	</div>
	
	
	<script>
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	
	</script>
</body>
</html>