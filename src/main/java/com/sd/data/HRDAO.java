package com.sd.data;

import java.util.List;

public interface HRDAO {
	 	Employee getEmployeeById(Employee emp);
//	 	Employee getEmployeeByNameContains(Employee emp);
	 	Employee addEmployee(Employee emp);
		Employee updateEmployee(Employee emp);
		void deactivateEmployee(Employee emp);
		List<Employee> listEmployees();
	}