package com.sd.data;

import java.util.List;

public interface HRDAO {
	 	Employee getEmployeeById(int id);
//	 	Employee getEmployeeByNameContains(Employee emp);
	 	Employee addEmployee(Employee newEmp);
		Employee updateEmployee(Employee emp);
		String deleteEmployee(Employee emp);
		List<Employee> listEmployees();
		List<Employee> listEmployeesActiveOnly();
	}