package com.globalin.shine.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.globalin.shine.domain.board.BoardDTO;
import com.globalin.shine.domain.board.BoardVO;
import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.FileVO;
import com.globalin.shine.domain.board.PageDTO;
import com.globalin.shine.domain.employee.EmployeeVO;
import com.globalin.shine.service.board.BoardService;

import lombok.extern.log4j.Log4j;

/*
 * Task			URL						Method			Parameter			Form						URL 이동
 * 
 * 전체 목록		/board/list				GET										
 * 등록 처리		/board/register		POST			모든 항목				입력화면 필요			이동
 * 조회			/board/read			GET				bno												
 * 삭제 처리		/board/remove		GET				bno					입력화면 필요			이동
 * 수정 처리		/board/modify		POST			모든 항목				입력화면 필요			이동
 */

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping({"/list", "/notice"})
	public String list(Criteria criteria, Model model) {
		log.info("/list");
		model.addAttribute("boardList", boardService.getList(criteria));
		model.addAttribute("pageDTO", new PageDTO(boardService.getTotal(criteria), criteria));
		return "/board/list";
	}
	
	@PostMapping("/register")
	public String register(BoardDTO boardDTO, RedirectAttributes rttr, HttpSession session) {
	    EmployeeVO employee = (EmployeeVO) session.getAttribute("employee");
	    boardDTO.setName(employee.getName());
	    boardDTO.setDeptName(employee.getDeptName());
	    log.info("/register : " + boardDTO);
	    boardService.register(boardDTO);
	    rttr.addFlashAttribute("bno", boardDTO.getBno());
	    return "redirect:/board/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(Criteria criteria, Long bno, HttpServletRequest request, Model model, HttpSession session) {
	    String url = request.getRequestURI();
	    log.info(url.substring(url.lastIndexOf("/")) + " : " + bno);

	    EmployeeVO employee = (EmployeeVO) session.getAttribute("employee");
	    // employee 정보를 이용해서 게시글을 조회하는 로직 추가
	    model.addAttribute("board",  boardService.get(bno));
	}
	
	@GetMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		log.info("/remove : " + bno);
		boardService.removeReply(bno);
		if(boardService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modify(Criteria criteria, BoardVO boardVO, RedirectAttributes rttr) {
		log.info("/modify : " + boardVO);
		if(boardService.modify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/board/list" + criteria.getParams();
	}
	
	@GetMapping("/register")
	public void register() {}
	
//	첨부파일 전체 목록
	@GetMapping(value = "/files", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<FileVO> getFiles(Long bno) {
		return boardService.getFiles(bno);
	}
	
//	 @GetMapping("/testlogin")
//	    public String testLogin(HttpSession session) {
//	        Employee employee = new Employee();
//	        employee.setId("testId");
//	        employee.setPassword("testPassword");
//	        employee.setName("testName");
//	        employee.setDeptName("testDeptName");
//	        session.setAttribute("employee", employee);
//	        return "redirect:/board/list";
//	    }
}
