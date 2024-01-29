package com.globalin.shine.controller.shineinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.shine.domain.shineinfo.ShineInfoVO;
import com.globalin.shine.service.shineinfo.ShineInfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shineInfo/*")
public class ShineInfoController {

	@Autowired
	public ShineInfoService shineInfoService;
	
	//마이페이지_관리자(사원리스트)
	@GetMapping("/myPage_admin")
	public void shineInfoList(Model model) {
		log.info("/shineInfoList : " );
	model.addAttribute("shineInfoList",shineInfoService.shineInfoListadmin());
		}
	
	//마이페이지_관리자(특정 사원 상세 보기)
	@GetMapping("/viewDetails_admin")
	public void viewDetailsShineInfo(int no, Model model) {
		log.info("/viewDetails : " + no );
	model.addAttribute("viewDetailsShineInfo",shineInfoService.viewDetailsadmin(no));
		}
	
	//업데이트_관리자
	@GetMapping("/update_admin")
	public String modifyadmin(ShineInfoVO shineInfoVO, RedirectAttributes rttr, Model model) {
		log.info("/modify : " + shineInfoVO);
//		if(shineInfoService.modifyadminread(shineInfoVO.getNo())) {
//			rttr.addFlashAttribute("result", "success");
//		}
		int a = shineInfoVO.getNo();
		model.addAttribute("shineInfo",shineInfoService.viewDetailsadmin(shineInfoVO.getNo()));
		shineInfoService.modifyadminRead(a);
	
		return "/shineInfo/update_admin";
	}
	@PostMapping("/modifyAdmin")
	public String modifyadmin(ShineInfoVO shineInfoVO) {
		int a = shineInfoVO.getNo();
		shineInfoService.modifyadmin(shineInfoVO);
		return "redirect:/shineInfo/myPage_admin";
	}
	
	
	//페이징처리 - myPage_admin페이지 
	
	//검색기능 - myPage_admin페이지 
	
}
