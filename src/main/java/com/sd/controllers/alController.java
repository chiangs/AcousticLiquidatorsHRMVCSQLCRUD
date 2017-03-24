package com.sd.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sd.data.Employee;
import com.sd.data.HRDAO;

@Controller
public class alController {

	@Autowired
	private HRDAO dao;

	@RequestMapping(value = "getEmployeeInfo.do", params = "name", method = RequestMethod.GET)
	public ModelAndView getByName(@RequestParam("name") String n) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.getEmployeeByName(n);
		mv.setViewName("home");
		mv.addObject("employee", emp);
		return mv;
	}

	@RequestMapping(value = "getEmployeeInfo.do", params = "address", method = RequestMethod.GET)
	public ModelAndView getByAddress(@RequestParam("address") String a) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.getEmployeeByName(a);
		mv.setViewName("home");
	    mv.addObject("employee", emp);
		return mv;
	}

	@RequestMapping(value = "getEmployeeInfo.do", params = "department", method = RequestMethod.GET)
	public ModelAndView getByDepartment(@RequestParam("department") String d) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.getEmployeeByDepartment(d);
		mv.setViewName("home");
		mv.addObject("employee", emp);
		return mv;
	}

	@RequestMapping(value = "getEmployeeInfo.do", params = "salary", method = RequestMethod.GET)
	public ModelAndView getByName(@RequestParam("salary") int s) {
		ModelAndView mv = new ModelAndView();
		Employee emp = dao.getEmployeeBySalary(s);
		mv.setViewName("home");
	    mv.addObject("employee", emp);
		return mv;

	}

	@RequestMapping(value = "addEmployee.do", method = RequestMethod.POST)
	public ModelAndView addEmployee(Employee employee) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		Employee emp = dao.addEmployee(employee);
		mv.addObject("newEmployee", emp);
		return mv;
	}

	@RequestMapping(value = "deleteEmployee.do", method = RequestMethod.POST)
	public ModelAndView deleteEmployee(int id) /*Are we getting employee by id?*/{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		String response = dao.deleteEmployee(id);
		mv.addObject("response", response);
		return mv;
	}

	@RequestMapping(value = "editPop.do", method = RequestMethod.POST)
	public ModelAndView editPopFilm(int id) {
		ModelAndView mv = new ModelAndView();
		System.out.println(id);
		Employee emp = dao.getEmployeeByID2(id);
		mv.setViewName("home");
		mv.addObject("editEmployee", emp);
		return mv;
	}

	@RequestMapping(value = "edit.do", method = RequestMethod.POST)
	public ModelAndView editEmployee(Employee employee) {
		ModelAndView mv = new ModelAndView();
		dao.editEmployee(employee);
		mv.setViewName("home");
		mv.addObject("employee", emp);
		return mv;
	}

}
