package com.globalin.shine.controller.employee;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.PageDTO;
import com.globalin.shine.domain.commute.CommuteVO;
import com.globalin.shine.domain.commute.TimeVO;
import com.globalin.shine.domain.employee.EmployeeVO;
import com.globalin.shine.service.approval.ApprovalService;
import com.globalin.shine.service.board.BoardService;
import com.globalin.shine.service.commute.CommuteService;
import com.globalin.shine.service.employee.EmployeeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	CommuteService commuteService;
	
	@Autowired
	ApprovalService approvalService;
	
	@Autowired
	private BoardService boardService;
	
	// 로그인 화면
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView viewAttendance(HttpServletRequest request, ModelAndView mv) throws Exception {
		mv.setViewName("/main/index");
		return mv;
	}
	
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public ModelAndView admin(HttpServletRequest request, ModelAndView mv) throws Exception {
		mv.setViewName("/main/admin");
		return mv;	
	}
	
	@RequestMapping(value="/checkdup", method = RequestMethod.GET)
	public ModelAndView checkDup(HttpServletRequest request, ModelAndView mv, @RequestParam String id) throws Exception {
		mv.setViewName("/main/checkdup");
		EmployeeVO employee = new EmployeeVO();		
		System.out.println(id);
		employee.setId(id);
		System.out.println(employee);
		int res = employeeService.checkIdDup(employee);
		System.out.println(res);
		if(res > 0) {
			mv.addObject("result", "failed");
			mv.addObject("string", "존재하는 ID입니다.");
		} else {
			mv.addObject("result", "success");
			mv.addObject("string", "사용 가능한 ID입니다.");
		}
		return mv;	
	}
	
	// 로그인 처리
	@RequestMapping("/index")
	public String login(HttpServletRequest request, Model model, CommuteVO commuteVO) {
		HttpSession session = request.getSession();
		if (session != null) {
			String id = (String) session.getAttribute("id");
			if (id == null || ((String) id).equals("") || ((String) id).equals("null")) { // 안된경우
				// TODO: 경고문 EX) 로그인이 되지 않았습니다. 로그인 후 사용해주세요
			} else { // 로그인된 경우
				if (session.getAttribute("id").equals("admin")) { // id = admin 인 경우
					model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
					return "/main/admin";
				} else if (session.getAttribute("id") != null) { // id는 있지만, id != admin 인 경우
					model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
					return "/main/main";
				}
			}
		}
		return "/main/index";
	}
	
	// 메인 화면
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, ModelAndView mav, CommuteVO commuteVO, TimeVO timeVO, int no, Model model, Criteria criteria) {
		HttpSession session = request.getSession();
		String str = (String)session.getAttribute("id");
		System.out.println("메인 get");
		int num = (int) session.getAttribute("no");
		mav.setViewName("redirect:/main/index"); // Default Setting
		commuteVO.setNo(num);
		CommuteVO temp = commuteService.viewAttendance(commuteVO);
		Calendar cal = Calendar.getInstance();
		String startDate = "";
		String endDate = "";
		String h = "";
		String m = "";

		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		cal.add(Calendar.WEEK_OF_YEAR, 1); // 한 주를 더 해줌 (다음주)
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		endDate = new SimpleDateFormat("YYYYMMDD").format(cal.getTime());
		// 일 ~ 토 / 월 ~ 일
		System.out.println("Start : " + startDate);
		System.out.println("End : " + endDate);
		
		commuteVO.setStartDate(startDate);
		commuteVO.setEndDate(endDate);
		
		String intime = "00:00";
		String outTime = "00:00";
		
		if(temp == null || temp.getIntimeDate() == null) {
			mav.addObject("mintime",intime);
			System.out.println(intime);			
		} else {
			intime = new SimpleDateFormat("HH:mm").format(temp.getIntimeDate());
			System.out.println(intime);
		}
		
		if(temp == null || temp.getOutTime() == null) {
			mav.addObject("mouttime", outTime);
			System.out.println(outTime);
		} else {
			outTime = new SimpleDateFormat("HH:mm").format(temp.getOutTime());
			System.out.println(outTime);
		}
				
		if (str.equals("admin")) {
			mav.setViewName("/main/admin");
			return mav;
		} else if (str != null && !str.equals("")) {
			mav.setViewName("/main/main");
			if(temp == null || temp.getIntimeDate() == null) {
				mav.addObject("mintime", "00:00");
			} else {
				mav.addObject("mintime", new SimpleDateFormat("HH:mm").format(temp.getIntimeDate()));
			}
			if(temp == null || temp.getOutTime() == null) {
				mav.addObject("mouttime", "00:00");
			} else {
				mav.addObject("mouttime", new SimpleDateFormat("HH:mm").format(temp.getOutTime()));
			}
		
			mav.addObject("mstartDate", startDate);
			mav.addObject("mendDate", endDate);
			
			System.out.println(mav);
			TimeVO sum = commuteService.mainCommute(commuteVO, timeVO);
			if(sum == null || sum.getH() == null) {
				mav.addObject("sumtimeH", "00");
				mav.addObject("sumtimeM", "00");
			} else {
				mav.addObject("sumtimeH", sum.getH());
				mav.addObject("sumtimeM", sum.getM());
			}
		}
		
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		model.addAttribute("total", approvalService.selectTotal(no));
		model.addAttribute("remind", approvalService.selectRemind(no));
		model.addAttribute("temp", approvalService.selectTemp(no));
		model.addAttribute("inbox", approvalService.selectInbox(no));
		model.addAttribute("boardList", boardService.getListMain(criteria));
		model.addAttribute("pageDTO", new PageDTO(boardService.getTotal(criteria), criteria));
		return mav;
	}

	// 메인 화면
	@RequestMapping("/main")
	public ModelAndView main(@RequestParam String id, String pw, EmployeeVO employeeVO,CommuteVO commuteVO, HttpServletRequest request,
			ModelAndView mv, Model model) throws Exception {
		EmployeeVO str = employeeService.login(employeeVO);
		HttpSession session = request.getSession();
		mv.setViewName("redirect:/index"); // Default Setting
		
		System.out.println(str);
		if(str == null || str.equals("") || str.equals("null")) {
			mv.addObject("login", "failed");
			System.out.println("Login failed");
			mv.setViewName("redirect:/");
			return mv;
		}
		
		if (str.getId().equals("admin")) {
			mv.setViewName("redirect:/admin");
			session.setAttribute("employee", str);
			session.setAttribute("id",str.getId());
			session.setAttribute("no", str.getNo());
		} else if (str != null && !str.equals("")) {
			mv.setViewName("redirect:/main");
			session.setAttribute("employee",str);
			session.setAttribute("id",str.getId());
			session.setAttribute("no", str.getNo());
		}
		
		commuteVO.setNo(str.getNo());
		CommuteVO temp = commuteService.viewAttendance(commuteVO);		
//		CommuteVO commute = commuteService.viewCommute(commuteVO);	
		if(temp == null || temp.getIntimeDate() == null) {
			mv.addObject("mintime", "00:00");
		} else {
			mv.addObject("mintime", new SimpleDateFormat("HH:mm").format(temp.getIntimeDate()));
		}
		if(temp == null || temp.getOutTime() == null) {
			mv.addObject("mouttime", "00:00");
		} else {
			mv.addObject("mouttime", new SimpleDateFormat("HH:mm").format(temp.getOutTime()));
		}
		mv.addObject("login", "success");
		
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		mv.addObject("no",  model.asMap().get("no"));
		System.out.println(mv);
		return mv;
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("logout");
		return "redirect:/";
	}

	// 마이 페이지
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView MyPage(HttpSession session, EmployeeVO employeeVO, Model mv, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/myPage");
		String id = null;
		try {
			EmployeeVO employeeVO2 = (EmployeeVO) session.getAttribute("employeeVO");
			id = employeeVO2.getId();
		} catch (Exception e) {
			mav.setViewName("/main/myPage");
			return mav;
		}
		employeeVO.setId(id);

		return mav;
	}

	// 사원등록
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {
		return "/main/insert";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, Model model) throws Exception {
		// 입력한 파일은 자동으로 photoFile 매개변수에 담겨서 옴
		
		EmployeeVO emp = new EmployeeVO();
		emp.setId(request.getParameter("id"));
		emp.setPw(request.getParameter("pw"));
		emp.setName(request.getParameter("name"));
		emp.setPosition(request.getParameter("position"));
		emp.setPhone(request.getParameter("phone"));
		emp.setCall(request.getParameter("call"));
		emp.setEmail(request.getParameter("email"));
		emp.setGender(request.getParameter("gender"));
		emp.setBirth(request.getParameter("birth"));
		emp.setDeptName(request.getParameter("deptName"));
		emp.setDeptNo(Integer.parseInt(request.getParameter("deptNo")));
		emp.setHireDate(request.getParameter("hireDate"));
		emp.setStatus(request.getParameter("status"));
				
		MultipartFile file = ((MultipartHttpServletRequest)request).getFile("photoFile");
		
		// 사진을 저장할 위치
		String uploadPath = "C:\\spring_workspace\\calendar2\\src\\main\\webapp\\resources\\photos\\";
		
		// 그 위치에 폴더가 있는지 확인하고, 없으면 생성
		File folder = new File(uploadPath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		// 실제로 저장된 임시 파일의 위치
		String fileRealName = file.getOriginalFilename();
		// 새롭게 저장할 사진 파일의 emp 여기서는 ex) id.jpg
		String newName = emp.getId() + fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
				
		//System.out.println(fileRealName);
		//System.out.println(newName);

		// 파일 객체 생성 후, 
		File saveFile = new File(uploadPath + newName);
		// 임시 파일을 새롭게 저장할 위치로 옮기기
		file.transferTo(saveFile);

		// 새롭게 저장한 파일 위치를 DB에 설정
		emp.setPhoto(newName);
		//System.out.println(employeeVO);
		employeeService.insert(emp);
		
		HttpSession session = request.getSession();
	    model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		
		return "redirect:/admin?no=" + model.asMap().get("no");
	}
	
	// 사원정보 수정(일반)
	@RequestMapping(value = "/update", method = RequestMethod.GET )
	public String update(HttpSession session, Model model,EmployeeVO employeeVO) throws Exception {

		return "/main/update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST )
	public String update(@ModelAttribute EmployeeVO employeeVO, HttpSession session) throws Exception {
		int num = (int) session.getAttribute("no");
		employeeService.update(employeeVO);
		return "redirect:/main";
	}
}
	