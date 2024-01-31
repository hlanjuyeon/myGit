package com.globalin.shine.controller.dayoff;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.shine.domain.dayoff.DayOffVO;
import com.globalin.shine.service.dayoff.DayOffService;
import com.globalin.shine.service.employee.EmployeeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/dayOff/*")
public class DayOffController {
	@Autowired
	private DayOffService dayOffService;
	
	@Autowired
	EmployeeService employeeService;

	@GetMapping("/read")
	public void readList(int no, Model model, HttpServletRequest request) {
		log.info("/read");
		HttpSession session = request.getSession();
		model.addAttribute("id", employeeService.getVOById((String) session.getAttribute("id")).getId());
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		model.addAttribute("dayOffInfo",dayOffService.getSvInfo(no));
		model.addAttribute("dayOffList",dayOffService.getSvList(no));
		}
	
	@GetMapping("/list")
	public void readInfo(Model model, HttpServletRequest request) {
		log.info("/list");
		HttpSession session = request.getSession();
		model.addAttribute("id", employeeService.getVOById((String) session.getAttribute("id")).getId());
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		model.addAttribute("dayOffInfo", dayOffService.getInfo());
	}
	
	@GetMapping("/modify")
	public String modify(DayOffVO dayOffVO, RedirectAttributes rttr, Model model) {
		log.info("/modify : " + dayOffVO);
		if(dayOffService.modifyInfo(dayOffVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		model.addAttribute("dayOffInfo",dayOffService.viewDetailsInfo(dayOffVO.getNo()));
		model.addAttribute("dayOffList",dayOffService.viewDetailsList(dayOffVO.getNo()));
		return "/dayOff/modify";
	}
	@PostMapping("/modify")
	public String modify(DayOffVO dayOffVO) {
		dayOffService.modifyInfo(dayOffVO);
		return "redirect:viewDetails?no=" + dayOffVO.getNo();
	}
	
	@GetMapping("/viewDetails")
	public void viewDetailsList(int no, Model model) {
		log.info("/viewDetails : " + no );
		model.addAttribute("dayOffInfo",dayOffService.viewDetailsInfo(no));
		model.addAttribute("dayOffList",dayOffService.viewDetailsList(no));
	}
	
}