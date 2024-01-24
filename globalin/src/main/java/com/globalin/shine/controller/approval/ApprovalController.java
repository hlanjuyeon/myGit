package com.globalin.shine.controller.approval;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.domain.approval.Criteria;
import com.globalin.shine.domain.approval.PageMakerDTO;
import com.globalin.shine.service.approval.ApprovalService;
import com.globalin.shine.service.employee.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/approval/*")
public class ApprovalController {	
	
	private final ApprovalService approvalService;

	@Autowired
	EmployeeService employeeService;
	
	@Autowired(required=false)
	public ApprovalController(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}
	
//	결재 날짜 최근 순으로 출력
	/* 게시판 목록 페이지 접속(페이징 적용) */
    @GetMapping("/listIn")
    public void ApprovalListInGET(Model model, Criteria criteria, ApprovalVO approval, HttpServletRequest request) {
        log.info("/게시판 목록 페이지(수신함)");
        HttpSession session = request.getSession();
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
        approvalService.updateOriginNo(approval);
        model.addAttribute("list", approvalService.getListPagingIn(criteria));
        int total = approvalService.getTotal();
        PageMakerDTO pageMake = new PageMakerDTO(criteria, total);
        model.addAttribute("pageMaker", pageMake);
    }
    
    @GetMapping("/listInYet")
    public String ApprovalListInYetGET(Model model, Criteria criteria, ApprovalVO approval, HttpServletRequest request) {
    	log.info("/게시판 목록 페이지(미결재 수신함)");
    	HttpSession session = request.getSession();
    	model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
    	approvalService.updateOriginNo(approval);
    	model.addAttribute("list", approvalService.getListPagingInYet(criteria));
    	int total = approvalService.getTotal();
    	PageMakerDTO pageMake = new PageMakerDTO(criteria, total);
    	model.addAttribute("pageMaker", pageMake);

    	return "/approval/listIn";
    }
    
    @GetMapping("/listOut")
    public void ApprovalListOutGET(Model model, Criteria criteria, ApprovalVO approval, HttpServletRequest request) {
        log.info("/게시판 목록 페이지(수신함)");
        HttpSession session = request.getSession();
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
        approvalService.updateOriginNo(approval);
        model.addAttribute("list", approvalService.getListPagingOut(criteria));
        int total = approvalService.getTotal();
        PageMakerDTO pageMake = new PageMakerDTO(criteria, total);
        model.addAttribute("pageMaker", pageMake);
    }
    
	@GetMapping("/detail")
	public void DetailGet(int no, Model model, Criteria criteria, HttpServletRequest request) {
		log.info("/게시글 상세내용 조회하기");
		HttpSession session = request.getSession();
		model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
		model.addAttribute("deptName", employeeService.getVOById((String) session.getAttribute("id")).getDeptName());
		model.addAttribute("detail", approvalService.getDetail(no));
		model.addAttribute("criteria", criteria);
		log.info("ApprovalVO : " + model);
	}
	
	@GetMapping("/write")
	public void writeGet(Model model, HttpServletRequest request) {
		log.info("/문서작성 페이지로 이동하기");
		HttpSession session = request.getSession();
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
		model.addAttribute("deptName", employeeService.getVOById((String) session.getAttribute("id")).getDeptName());
		model.addAttribute("emp", approvalService.getDeptList());
		model.addAttribute("user", approvalService.getUserList());
	}

	@PostMapping("/write")
	public String writePost(ApprovalVO approval, Model model, HttpServletRequest request) {
	    log.info("/게시글 작성하기");
	    HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
	    approvalService.insert(approval);
	    log.info("ApprovalVO : " + approval);
	    return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@GetMapping("/temp")
	public void TempListGet(Model model, HttpServletRequest request, Criteria criteria) {
		log.info("/상신 임시저장 목록 페이지로 이동하기");
		HttpSession session = request.getSession();
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		model.addAttribute("temp", approvalService.getTempList(criteria));
		int total = approvalService.getTotal();
        PageMakerDTO pageMake = new PageMakerDTO(criteria, total);
        model.addAttribute("pageMaker", pageMake);
	}
	
	@GetMapping("/modify")
	public void ModifyGet(int no, Model model) {
		log.info("/임시저장글 상세내용 조회하기");
		model.addAttribute("detail", approvalService.getDetail(no));
		log.info("ApprovalVO : " + model);
		model.addAttribute("emp", approvalService.getDeptList());
		model.addAttribute("user", approvalService.getUserList());
	}
	
	@PostMapping("/modify")
	public String ModifyPost(ApprovalVO approval, Model model, HttpServletRequest request) {
		log.info("/임시저장글 수정하고 상신하기");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		approvalService.update(approval);
		log.info("ApprovalVO : " + approval);
		return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@PostMapping("/delete")
	public String DeletePost(int no, Model model, HttpServletRequest request) {
		log.info("/게시글 삭제하기");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		approvalService.delete(no);
		return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@GetMapping("/reply")
	public void replyGet(int no, Model model, HttpServletRequest request) {
		log.info("/첨언작성 페이지로 이동하기");
		HttpSession session = request.getSession();
		model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
		model.addAttribute("deptName", employeeService.getVOById((String) session.getAttribute("id")).getDeptName());
		model.addAttribute("detail", approvalService.getDetail(no));
		model.addAttribute("emp", approvalService.getDeptList());
	}
	
	@PostMapping("/reply")
	public String replyPost(ApprovalVO approval, Model model, HttpServletRequest request) {
		log.info("/첨언 작성하기");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		approvalService.insertReply(approval);
		log.info("ApprovalVO : " + approval);
		return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@GetMapping("/detailReply")
	public void DetailReplyGet(int no, Model model, Criteria criteria) {
		log.info("/첨언ver : 게시글 상세내용 조회하기");
		model.addAttribute("detail", approvalService.getDetail(no));
		model.addAttribute("criteria", criteria);
	}
	
	@GetMapping("/modifyReply")
	public void ModifyReplyGet(int no, Model model) {
		log.info("/첨언 ver : 임시저장글 상세내용 조회하기");
		model.addAttribute("detail", approvalService.getDetail(no));
		model.addAttribute("emp", approvalService.getDeptList());
		model.addAttribute("user", approvalService.getUserList());
	}
	
	@PostMapping("/modifyReply")
	public String ModifyReplyPost(ApprovalVO approval, Model model, HttpServletRequest request) {
		log.info("/첨언 ver : 임시저장글 수정하고 등록하기");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		approvalService.updateReply(approval);
		log.info("ApprovalVO : " + approval);
		return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@GetMapping("/writeYear")
	public void writeYearGet(Model model, HttpServletRequest request) {
		log.info("/연차ver : 문서작성 페이지로 이동하기");
		HttpSession session = request.getSession();
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
		model.addAttribute("deptName", employeeService.getVOById((String) session.getAttribute("id")).getDeptName());
		model.addAttribute("emp", approvalService.getDeptList());
		model.addAttribute("user", approvalService.getUserList());
	}

	@PostMapping("/writeYear")
	public String writeYearPost(ApprovalVO approval, Model model, HttpServletRequest request) {
		log.info("/연차ver : 게시글 작성하기");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		approvalService.insertYear(approval);
		log.info("ApprovalVO : " + approval);
		return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@GetMapping("/detailYear")
	public void DetailYearGet(int no, Model model, Criteria criteria) {
		log.info("/연차ver : 게시글 상세내용 조회하기");
		model.addAttribute("detail", approvalService.getDetail(no));
		model.addAttribute("criteria", criteria);
	}
	
	@GetMapping("/modifyYear")
	public void ModifyYearGet(int no, Model model) {
		log.info("/첨언 ver : 임시저장글 상세내용 조회하기");
		model.addAttribute("detail", approvalService.getDetail(no));
		model.addAttribute("emp", approvalService.getDeptList());
		model.addAttribute("user", approvalService.getUserList());
	}
	
	@PostMapping("/modifyYear")
	public String ModifyYearPost(ApprovalVO approval, Model model, HttpServletRequest request) {
		log.info("/첨언 ver : 임시저장글 수정하고 등록하기");
		approvalService.updateReply(approval);
		log.info("ApprovalVO : " + approval);
		return "redirect:/approval/listOut?loginNo=" + model.asMap().get("no");
	}
	
	@PostMapping("/updateApp")
	public String updateAppPost(ApprovalVO approval, Model model, HttpServletRequest request) {
		log.info("/결재정보 삽입");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		approvalService.updateApp(approval);
		approvalService.updateState(approval);
		log.info("ApprovalVO : " + approval);
		
		try {
		    Thread.sleep(3000); // 3초 지연
		} catch (InterruptedException e) {
		    e.printStackTrace();
		}
		return "redirect:/approval/listIn?loginNo=" + model.asMap().get("no");
	}
	
	@PostMapping("/updateAppFail")
	public String updateAppFailPost(int no, Model model, HttpServletRequest request) {
		log.info("/결재권자 비밀번호 입력 실패");
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		return "redirect:/approval/listIn?loginNo=" + model.asMap().get("no");
	}
}