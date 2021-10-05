package com.sk.anna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sk.anna.model.Employee;
import com.sk.anna.service.IEmployeeService;

@Controller
@RequestMapping("/employee")
public class MainController {
	@Autowired
	IEmployeeService service;
	
	//1. show register page
	@GetMapping("/register")
	public String showRegister() {
		return "EmployeeRegister";
	}
	//2. Insert records
	@PostMapping("/save")
	public String saveEmployee(@ModelAttribute("employee")Employee emp,Model model) {
		Integer id = service.saveEmployee(emp);
		
		String msg="Employee id "+id+" Created";
		model.addAttribute("message",msg);
		return "EmployeeRegister";
	}
	
	//3. display all employees
	@GetMapping("/showall")
	public String showEmployee(Model model) {
		List<Employee> emp= service.getAllEmployees();        
		model.addAttribute("list", emp);
		return "EmployeeList";
	}
	
	@GetMapping("/delete")
	public String deleteEmployee(@RequestParam("id")Integer id,Model model,RedirectAttributes ra) {
		System.out.println("id"+id);
		service.deleteEmployee(id);
		String message = "Employee "+id+" deleted";
		ra.addFlashAttribute("id", id);
		model.addAttribute("message",message);
		return "EmployeeMessage";
	}

	@GetMapping("/edit")
	public String showEdit(@RequestParam("id")Integer id ,Model model) {
		Employee emp = service.getOneEmployee(id);
		 
		model.addAttribute("employee", emp );
		return "EmployeeEdit";
	}
	
	@PostMapping("/update")
	public String doUpdate(@ModelAttribute("employee") Employee emp, Model model) {
		service.updateEmployee(emp);
		
		String message="Employee"+emp.getEmpId()+"updated";
				
		model.addAttribute("message",message);
		
		return "EmployeeEdit";
		
	}
	
	//7. AJAX validation
		@GetMapping("/validate")
		@ResponseBody
		public String validateName(@RequestParam("name") String empName) {
			String message = "";
			if (service.getEmpnameCount(empName) > 0) {
				message = "Employee Name " + empName + " already exist!";
			}
			return message; // return type is not page name
		}
		
		//8. Export data to excel
		@GetMapping("/excel")
		public ModelAndView showExcelData() {
			ModelAndView m = new ModelAndView();
			m.setViewName("empExcelView"); //set UI page
			
			List<Employee> list =  service.getAllEmployees();
			m.addObject("list", list); //add model
			
			return m;
		}
		
		//9. export data to PDF
		@GetMapping("/pdf")
		public ModelAndView showPdfData() {
			ModelAndView m = new ModelAndView();
			m.setViewName("empPdfView");

			//fetch data from DB and send to Document
			List<Employee> list =  service.getAllEmployees();
			m.addObject("list", list);
			
			return m;
		}
	
}
