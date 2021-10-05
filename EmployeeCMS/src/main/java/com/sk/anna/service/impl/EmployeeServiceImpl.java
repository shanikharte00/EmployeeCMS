package com.sk.anna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sk.anna.dao.IEmployeeDao;
import com.sk.anna.model.Employee;
import com.sk.anna.service.IEmployeeService;
@Service
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Autowired
	IEmployeeDao dao;

	@Override
	@Transactional
	public Integer saveEmployee(Employee emp) {
		//CALCULATIONS
		double sal=emp.getEmpSal();
		emp.setEmpHra(sal * 25/100.0);
		emp.setEmpTa(sal * 12/100.0);
		return dao.saveEmployee(emp);
	}

	@Override
	@Transactional
	public List<Employee> getAllEmployees() {
		List<Employee> list= dao.getAllEmployees();		
		return list;
	}

	@Override
	@Transactional
	public void deleteEmployee(Integer id) {
		dao.deleteEmployee(id);
	}

	@Override
	@Transactional
	public void updateEmployee(Employee emp) {
		double sal = emp.getEmpSal();
		emp.setEmpHra(sal * 25/100.0);
		emp.setEmpTa(sal * 12/100.0);
		dao.updateEmployee(emp);
	}

	@Override
	@Transactional
	public Employee getOneEmployee(Integer id) {
		Employee emp=dao.getOneEmployee(id);
		return emp;
	}

	@Override
	@Transactional(readOnly = true)
	public long getEmpnameCount(String empName) {
		
		return dao.getEmpnameCount(empName);
	}

}
