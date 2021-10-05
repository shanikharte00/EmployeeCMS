package com.sk.anna.service;

import java.util.List;

import com.sk.anna.model.Employee;

public interface IEmployeeService {
	Integer saveEmployee(Employee emp);
	
	List<Employee> getAllEmployees();

	void deleteEmployee(Integer id);
	
	Employee getOneEmployee(Integer id);
	
	void updateEmployee(Employee emp);

	long getEmpnameCount(String empName);

	
}
