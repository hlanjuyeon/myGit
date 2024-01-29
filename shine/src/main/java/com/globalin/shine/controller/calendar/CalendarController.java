package com.globalin.shine.controller.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.globalin.shine.domain.calendar.CalendarVO;
import com.globalin.shine.service.calendar.CalendarService;
import com.globalin.shine.service.employee.EmployeeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/calendar/*", method = {RequestMethod.GET, RequestMethod.POST})
public class CalendarController {	
	
	
	private final CalendarService calendarService;
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired(required=false)
	public CalendarController(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

	@RequestMapping(value="/monthPlan", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> month() {
		List<Map<String, Object>> list = calendarService.getCalendarList();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();		
		
		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).get("TITLE")); 
			hash.put("start", list.get(i).get("STARTDAY")); 
			hash.put("end", list.get(i).get("ENDDAY"));
			hash.put("titleModal", list.get(i).get("TITLE")); 
			hash.put("startModal", list.get(i).get("STARTDAY")); 
			hash.put("endModal", list.get(i).get("ENDDAY"));
			hash.put("allDay", list.get(i).get("ALLDAY"));
			hash.put("allday", list.get(i).get("ALLDAY"));
			hash.put("location", list.get(i).get("LOCATION")); 
			hash.put("content", list.get(i).get("CONTENT")); 
			hash.put("attendee", list.get(i).get("ATTENDEE")); 
			hash.put("writer", list.get(i).get("WRITER"));
			hash.put("privacy", list.get(i).get("PRIVACY"));
			hash.put("color", list.get(i).get("COLOR"));
			hash.put("colorModal", list.get(i).get("COLOR"));
			hash.put("no", list.get(i).get("NO"));
					
			jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}
	
	@RequestMapping(value="/monthEdit", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> monthEdit(@RequestParam("no") int no) {
		List<Map<String, Object>> list = calendarService.getCalendarByNo(no);
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();		
		
		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).get("TITLE")); 
			hash.put("start", list.get(i).get("STARTDAY")); 
			hash.put("end", list.get(i).get("ENDDAY"));
			hash.put("titleModal", list.get(i).get("TITLE")); 
			hash.put("startModal", list.get(i).get("STARTDAY")); 
			hash.put("endModal", list.get(i).get("ENDDAY"));
			hash.put("allDay", list.get(i).get("ALLDAY"));
			hash.put("allday", list.get(i).get("ALLDAY"));
			hash.put("location", list.get(i).get("LOCATION")); 
			hash.put("content", list.get(i).get("CONTENT")); 
			hash.put("attendee", list.get(i).get("ATTENDEE")); 
			hash.put("writer", list.get(i).get("WRITER"));
			hash.put("privacy", list.get(i).get("PRIVACY"));
			hash.put("color", list.get(i).get("COLOR"));
			hash.put("colorModal", list.get(i).get("COLOR"));
			hash.put("no", list.get(i).get("NO"));
					
			jsonObj = new JSONObject(hash); //중괄호 {key:value , key:value, key:value}
			jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
		}
		
		log.info("jsonArrCheck: {}", jsonArr);
		
		return jsonArr;
	}
	

	@GetMapping("/list")
	public String list() {
		log.info("/main");
		return "/calendar/main";
	}
	
	@GetMapping("/edit")
	public String edit() {
	    log.info("/edit");
	    return "/calendar/edit";
	}
	
	@GetMapping("/add")
	public String add(Model model, HttpServletRequest request) {
		log.info("/add");
		HttpSession session = request.getSession();
		model.addAttribute("name", employeeService.getVOById((String) session.getAttribute("id")).getName());
		return "/calendar/add";
	}
	
	@GetMapping("/delete")
	public String eventDeleteGet(@RequestParam("no") int no) {
		calendarService.delete(no);
		log.info("/delete");
		return "redirect:/calendar/list";
	}
	
	@GetMapping("/insert")
	public String evenetInsertGet(CalendarVO calendar) {
		log.info("/insert");
		log.info("CalendarVO : " + calendar);
		
		calendarService.insert(calendar);
		return "redirect:/calendar/list";
	}
	
	@GetMapping("/update")
	public String evenetUpdateGet(CalendarVO calendar) {
		log.info("/update");
		log.info("CalendarVO : " + calendar);
		
		calendarService.update(calendar);
		return "redirect:/calendar/list";
	}

}