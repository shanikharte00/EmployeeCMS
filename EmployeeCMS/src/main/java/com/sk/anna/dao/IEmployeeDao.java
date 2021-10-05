package com.sk.anna.dao;

import java.util.List;

import com.sk.anna.model.*;

public interface IEmployeeDao {
	Integer saveEmployee(Employee emp);

	List<Employee> getAllEmployees();

	void deleteEmployee(Integer id);

	void updateEmployee(Employee emp);

	Employee getOneEmployee(Integer id);

	long getEmpnameCount(String empName);
}
