package com.globalin.shine.controller.orgchart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalin.shine.domain.employee.EmployeeVO;
import com.globalin.shine.mapper.orgchart.OrgchartMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/orgchart/*")
public class OrgchartController {
    @Autowired
    private OrgchartMapper orgchartMapper;

    @GetMapping({"/employeeInfo", "/address"})
    public String showEmployeeInfo(HttpSession session, Model model) {
        EmployeeVO employee = (EmployeeVO) session.getAttribute("employee");
        model.addAttribute("employee", employee);
        return "/orgchart/employeeInfo";
    }

    @GetMapping("/departments/{deptName}")
    public String listEmployees(@PathVariable String deptName,HttpSession session, Model model) {
		model.addAttribute("employees", orgchartMapper.getEmpListByDept(deptName));	 
        EmployeeVO employee = (EmployeeVO) session.getAttribute("employee");
        model.addAttribute("employee", employee);
        return "/orgchart/employees";
    }

    @GetMapping("/employees/{no}")
    public String getEmployee(@PathVariable Integer no, HttpSession session, Model model) {
        model.addAttribute("no", orgchartMapper.getEmp(no));
        EmployeeVO employee = (EmployeeVO) session.getAttribute("employee");
        model.addAttribute("employee", employee);
        return "/orgchart/employee_detail";
    }
    
    @GetMapping("/email")
    public String emailGet() {
    	return "/orgchart/email";
    }
    
//	  @GetMapping("/testlogin")
//	    public String testLogin(HttpSession session) {
//	        Orgchart employee = new Orgchart();
//	        employee.setId("testId");
//	        employee.setPassword("testPassword");
//	        employee.setName("testName");
//	        employee.setDeptName("testDeptName");
//	        session.setAttribute("employee", employee);
//	        return "redirect:/address";
//	    }
    
}