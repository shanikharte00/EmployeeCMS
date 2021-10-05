<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee CMS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>

<body>
<%@include file="menu.html" %>
	<div class="flex container">
	<div class="card">
	<div class="card-header bg-primary text-white text-center">
		<h3>EMPLOYEE CMS</h3>
	</div>
	
	<div class="card-body">
	<form id="myEmpForm" action="save" method="post">
		
		<div class="form-group">
			<label for="empName">Name</label> 
			<input type="text" class="form-control" id="empName"
				aria-describedby="emailHelp" name="empName" placeholder="Enter Name"> 
		</div>
		<div id="empNameError"></div> 
		<div class="form-group">
			<label for="empSal">Salary</label> 
			<input type="number" class="form-control" name="empSal" id="empSal"
				placeholder="Enter Employee Salary">
		</div>
		<div id="empSalError"></div> 
		<div class="form-group">
			<label for="empDept">Department Select</label> 
			<select class="form-control" name="empDept" id="empDept">
				<option>-SELECT-</option>
				<option>BA</option>
				<option>QA</option>
				<option>SD</option>
			</select>
		</div>
		<div id="empDeptError"></div>
		<button type="submit" class="btn btn-primary">Submit</button>
		
	</form>
	</div>
	<div class="card-footer">
		<b>${message}</b>
	</div>
	
</div>
</div>
<script>
$(document).ready(function () {
    $("#empNameError").hide();
    $("#empSalError").hide();
    $("#empDeptError").hide();

    var empNameError = false;
    var empSalError = false;
    var empDeptError = false;
    function validate_empName() {
        var val = $("#empName").val();
        var exp =/^[A-Z]{4,10}$/;
        if (val == "") {
          $("#empNameError").show();
          $("#empNameError").css("color", "red");
          $("#empNameError").html("**Please Enter Employee Name");
          empNameError = false;
        } else if (!exp.test(val)) {
          $("#empNameError").show();
          $("#empNameError").css("color", "red");
          $("#empNameError").html("**Name must be 4-10 Chars only");
          empNameError = false;
        } else {
          $.ajax({
             url : 'validate',
             data : { 'name' : val},
             success:function(resTxt) {
             		if(resTxt!=''){
             			$("#empNameError").show();
          			$("#empNameError").css("color", "red");
          			$("#empNameError").html(resTxt);
          			empNameError = false;
             		} else {
             			 $("#empNameError").hide();
          			  empNameError = true;
             		} 
             }
          });
        }
        return empNameError;
      }
	
    function validate_empSal() {
      var val = $("#empSal").val();
      if (val == "") {
        $("#empSalError").show();
        $("#empSalError").css("color", "red");
        $("#empSalError").html("**Please Enter Employee Salary");
        empSalError = false;
      } else {
        $("#empSalError").hide();
        empSalError = true;
      }
      return empSalError;
    }

    function validate_empDept() {
      var val = $("#empDept").val();
      if (val == "") {
        $("#empDeptError").show();
        $("#empDeptError").css("color", "red");
        $("#empDeptError").html("**Please Select Employee Department");
        empDeptError = false;
      } else {
        $("#empDeptError").hide();
        empDeptError = true;
      }
      return empDeptError;
    }

    $("#empName").keyup(function () {
      $(this).val($(this).val().toUpperCase());
      validate_empName();
    });

    $("#empSal").keyup(function () {
      validate_empSal();
    });
    $("#empDept").change(function () {
      validate_empDept();
    });

    $("#myEmpForm").submit(function () {
      validate_empSal();
      validate_empName();
      validate_empDept();

      if (empDeptError && empNameError && empSalError) return true;
      else return false;
    });
  });


</script>

</body>
</html>