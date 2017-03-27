package com.sd.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sd.data.Address;
import com.sd.data.Employee;
import com.sd.data.HRDAO;

@Controller
public class alController {

	@Autowired
	private HRDAO dao;
	
	@RequestMapping(value = "home.do")
	public String home() {
		return ("home");
	}
	
	@RequestMapping(value = "contact.do")
	public String contact() {
		return ("contact");
	}
	
	// get list of all employees
	@RequestMapping(value = "listEmployeeInfo.do", method = RequestMethod.GET)
	public ModelAndView getEmployeeById(){
		ModelAndView mv = new ModelAndView();
		List<Employee> empList = dao.listEmployees();
		mv.setViewName("listEmployee");
		mv.addObject("employees", empList);
		return mv;
	}
	
	// gets individual employee by ID
	@RequestMapping(value = "getEmployeeInfo.do", params = "id", method = RequestMethod.GET)
	public ModelAndView getEmployeeById(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.getEmployeeById(id);
		mv.setViewName("employeeCard");
		mv.addObject("employee", emp);
		return mv;
	}
	
	// gets individ id returns to edit page
	@RequestMapping(value = "getEmployeeInfo2.do", params = "id", method = RequestMethod.POST)
	public ModelAndView getEmployeeById2(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		List<Employee> employees = dao.listEmployees();
		Employee emp = dao.getEmployeeById(id);
		mv.setViewName("empActions");
		mv.addObject("employee", emp);
		mv.addObject("employees", employees);
		return mv;
	}

	
	// deletes employee via button
	@RequestMapping(value = "deleteEmployee.do", method = RequestMethod.POST)
	public ModelAndView deleteEmployee(@RequestParam("empObj") int id) {
		ModelAndView mv = new ModelAndView();
		String response = dao.deleteEmployee(id);
		mv.addObject("response", response);
		return getEmployeeById();
	}

	// populates the edit form for editing on empActions.jsp
	@RequestMapping(value = "editPop.do", method = RequestMethod.GET)
    public ModelAndView editPop() {
		ModelAndView mv = new ModelAndView();
		List<Employee> employees = dao.listEmployees();
		mv.setViewName("empActions");
		mv.addObject("employees", employees);
        return mv;
    }
	
	
	
	@RequestMapping(value = "addEmployee.do", method = RequestMethod.POST)
	public ModelAndView addEmp(Employee e) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.addEmployee(e);
		mv.setViewName("listEmployee");
		mv.addObject("editEmployee", emp);
		return getEmployeeById();
	}
	
	// Actual editing/updating of employee
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public ModelAndView addEmployee(Employee employee, @RequestParam("address_id") int id) {
		ModelAndView mv = new ModelAndView();
		Address a = new Address();
		a.setId(id);
		employee.setAddress(a);
		mv.setViewName("editEmployee");
		dao.updateEmployee(employee);
		return getEmployeeById();
	}
	
	@RequestMapping(value = "updateAddress.do", method = RequestMethod.POST)
	public ModelAndView addEmployee(Address a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editEmployee");
		dao.updateAddress(a);
		return getEmployeeById();
	}


}
