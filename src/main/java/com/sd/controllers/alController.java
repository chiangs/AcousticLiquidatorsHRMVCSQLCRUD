package com.sd.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sd.data.Employee;
import com.sd.data.HRDAO;
import com.sd.data.HRDAOImpl;

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
	
	@RequestMapping(value = "listEmployeeInfo.do", method = RequestMethod.GET)
	public ModelAndView getEmployeeById(){
		ModelAndView mv = new ModelAndView();
		List<Employee> empList = dao.listEmployees();
		mv.setViewName("listEmployee");
		mv.addObject("employees", empList);
		return mv;
	}
	
	@RequestMapping(value = "edit.do", method = RequestMethod.GET)
	public ModelAndView editEmployeeById(Employee employee) {
		ModelAndView mv = new ModelAndView();
		List<Employee> empList2 = dao.listEmployees();
		dao.updateEmployee(employee);
		mv.setViewName("editEmployee");
		mv.addObject("employees", empList2);
		return mv;
	}
	
	@RequestMapping(value = "getEmployeeInfo.do", params = "id", method = RequestMethod.GET)
	public ModelAndView getEmployeeById(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.getEmployeeById(id);
		mv.setViewName("employeeCard");
		mv.addObject("employee", emp);
		return mv;
	}
//
//	@RequestMapping(value = "getEmployeeInfo.do", params = "name", method = RequestMethod.GET)
//	public ModelAndView getByName(@RequestParam("name") String n) {
//		ModelAndView mv = new ModelAndView();
//		Employee emp = dao.getEmployeeByName(n);
//		mv.setViewName("home");
//		mv.addObject("employee", emp);
//		return mv;
//	}

//	@RequestMapping(value = "getEmployeeInfo.do", params = "address", method = RequestMethod.GET)
//	public ModelAndView getByName(@RequestParam("address") String a) {
//		ModelAndView mv = new ModelAndView();
//		Employee emp = dao.getEmployeeByName(a);
//		mv.setViewName("home");
//	    mv.addObject("employee", emp);
//		return mv;
//	}

//	@RequestMapping(value = "getEmployeeInfo.do", params = "department", method = RequestMethod.GET)
//	public ModelAndView getByName(@RequestParam("department") String d) {
//		ModelAndView mv = new ModelAndView();
//		Employee emp = dao.getEmployeeByDepartment(d);
//		mv.setViewName("home");
//		mv.addObject("employee", emp);
//		return mv;
//	}

//	@RequestMapping(value = "getEmployeeInfo.do", params = "salary", method = RequestMethod.GET)
//	public ModelAndView getByName(@RequestParam("salary") int s) {
//		ModelAndView mv = new ModelAndView();
//		Employee emp = dao.getEmployeeBySalary(s);
//		mv.setViewName("home");
//	    mv.addObject("employee", emp);
//		return mv;
//
//	}

	@RequestMapping(value = "addEmployee.do", method = RequestMethod.POST)
	public ModelAndView addEmployee(Employee employee) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addEmployee");
		Employee emp = dao.addEmployee(employee);
		mv.addObject("newEmployee", emp);
		return mv;
	}

	@RequestMapping(value = "deleteEmployee.do", method = RequestMethod.GET)
	public ModelAndView deleteEmployee() {
		ModelAndView mv = new ModelAndView();
		List<Employee> empList2 = dao.listEmployees();
//		dao.updateEmployee(employee);
		mv.setViewName("deleteEmp");
		mv.addObject("employees", empList2);
		return mv;
	}
	
	@RequestMapping(value = "deleteEmployee.do", method = RequestMethod.POST)
	public ModelAndView deleteEmployee(@RequestParam("empObj") int id) {
		System.out.println(id);
		ModelAndView mv = new ModelAndView();
		String response = dao.deleteEmployee(id);
		mv.addObject("response", response);
		return getEmployeeById();
	}

//	@RequestMapping(value = "editPop.do", method = RequestMethod.POST)
//	public ModelAndView editPopFilm(Employee employee) {
//		ModelAndView mv = new ModelAndView();
//		System.out.println(id);
//		Employee emp = dao.getEmployeeByID2(employee);
//		mv.setViewName("home");
//		mv.addObject("editEmployee", emp);
//		return mv;
//	}


}
