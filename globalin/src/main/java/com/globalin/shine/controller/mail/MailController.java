package com.globalin.shine.controller.mail;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.globalin.shine.service.employee.EmployeeService;
import com.globalin.shine.service.mail.MailService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MailController {	
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired(required=false)
	public MailController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@RequestMapping("/mail/send")
	public String send(String name, String emailfrom, String emailto, String title, String body, Model model, HttpServletRequest request) {
		Map<String, Object> sendRs = mailService.send(emailfrom, name, emailto, title, body);
		System.out.println("sendRs " + sendRs);
		
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
	    
//		return (String) sendRs.get("msg");
		return "redirect:/main?no=" + model.asMap().get("no");
	}

}