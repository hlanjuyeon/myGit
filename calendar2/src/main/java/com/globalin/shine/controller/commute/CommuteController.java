package com.globalin.shine.controller.commute;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.globalin.shine.domain.commute.CommuteVO;
import com.globalin.shine.service.commute.CommuteService;
import com.globalin.shine.service.employee.EmployeeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommuteController {
	@Autowired
	CommuteService commuteService;
	@Autowired
	EmployeeService employeeService;
	
	// CommuteRecord
	/*
	 * date 		: 날짜			(String)
	 * intime 		: 출근 날짜		(String)
	 * outtime 		: 퇴근 날짜		(String)
	 * overtime		: 초과 근무 시간	(String)
	 * nighttime 	: 야간 근무 시간	(String)
	 * holidaytime	: 휴일 근무 시간	(String)
	 * sumtime		: 당일 총 근무 시간 -> summation(long)을 문자열 형태로 HH:mm:ss
	 * summation	: 당일 총 근무 시간 -> 근무 시간을 초 단위로 저장
	 */
	public class CommuteRecord {
		String date;			
		String intime;
		String outtime;
		String overtime;
		String nighttime;
		String holidaytime;
		String sumtime;
		long summation;
		
		public CommuteRecord(String d) { // 근무 기록이 없는 경우에는 Date만 초기화
			date = d;
			intime = outtime = overtime = nighttime = holidaytime = sumtime = " ";
			summation = 0;
		}
		
		public CommuteRecord(Timestamp in, Timestamp out) throws ParseException { // 출근 기록이 존재하면 / 퇴근 기록은 없을 수 있음
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 	// 날짜 추출 SimpleDateFormat
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");		// 시간 추출 SimpleDateFormat
			date = dateFormat.format(in);		// 출근 기록 일자
			intime = timeFormat.format(in);		// 출근 기록 시간
			
			if(out == null) { // 퇴근 기록이 존재하지 않으면
				outtime = overtime = nighttime = holidaytime = " "; // 근무 시간을 계산하지 않음
				summation = 0; 
				sumtime = "00:00:00";
			} else { // 퇴근 기록이 존재하면 계산이 필요함
				outtime = timeFormat.format(out); // 퇴근 시간 추출
				
				Timestamp tOut = new Timestamp(timeFormat.parse(outtime).getTime());		// 퇴근 시간
				Timestamp tTemp = new Timestamp(timeFormat.parse("18:00:00").getTime());	// 18:00:00시
				Duration dTemp;	// 차이를 저장하기 위한 Duration
				
				/* overtime 계산 */
				if(tOut.after(tTemp)) { // 만약, 퇴근시간이 18시 이후면 overtime 계산
					tTemp = new Timestamp(timeFormat.parse("22:00:00").getTime()); // 만약, 퇴근 시간이 22시 이후면 nighttime 계산
					if(tOut.before(tTemp)) { // 10시 이전 퇴근이면 오후 6 ~ 퇴근시간까지 overtime
						// 18:00 ~ 퇴근 시간까지 계산
						dTemp = Duration.between(new Timestamp(timeFormat.parse("18:00:00").getTime()).toLocalDateTime().toLocalTime(), tOut.toLocalDateTime().toLocalTime());
						long Hour = dTemp.toHours();
						long Min = dTemp.toMinutesPart();
						long Sec = dTemp.toSecondsPart();
						overtime = String.format("%02d:%02d:%02d", Hour, Min, Sec);
					} else { // 10시 이후 퇴근이면 초과 4시
						overtime = "04:00:00";
					}
				} else { // 초과 없으면
					overtime = " ";
				}
				
				/* nighttime 계산 */
				tTemp = new Timestamp(timeFormat.parse("22:00:00").getTime()); // 22:00:00시
				if(tOut.after(tTemp)) {// 퇴근시간이 22:00:00시 이후면 야간 근로 시간 계산 nightTime
					dTemp = Duration.between(tTemp.toLocalDateTime().toLocalTime(), out.toLocalDateTime().toLocalTime()); // 22:00 ~ 퇴근 시간
					long Hour = dTemp.toHours();
					long Min = dTemp.toMinutesPart();
					long Sec = dTemp.toSecondsPart();
					nighttime = String.format("%02d:%02d:%02d", Hour, Min, Sec);
				} else {
					nighttime = " ";
				}
				
				/* 주말 근무 시간 계산 */
				Calendar cal = Calendar.getInstance();
				cal.setTime(dateFormat.parse(date)); // calendar를 출근 날짜로 설정
				int dayofweek = cal.get(Calendar.DAY_OF_WEEK); // 출근 날짜 요일 가져오기
				if(dayofweek == 1 || dayofweek == 7) { // 일요일(1) 이거나 토요일(7) 이면 휴일 근무 시간으로 계산
					dTemp = Duration.between(in.toLocalDateTime().toLocalTime(), out.toLocalDateTime().toLocalTime()); // 출근 ~ 퇴근까지
					long Hour = dTemp.toHours();
					long Min = dTemp.toMinutesPart();
					long Sec = dTemp.toSecondsPart();
					holidaytime = String.format("%02d:%02d:%02d", Hour, Min, Sec);
				} else {
					holidaytime = " ";
				}
				
				// 총 근무 시간 (출근 ~ 퇴근)
				summation = Duration.between(in.toLocalDateTime().toLocalTime(), out.toLocalDateTime().toLocalTime()).getSeconds();
				sumtime = String.format("%02d:%02d:%02d", (int)(summation / 3600), (int)((summation % 3600)/60), (int)((summation % 3600)%60));
			}	
			/*
			System.out.println("Date: " + date);
			System.out.println("In: " + intime);
			System.out.println("Out: " + outtime);
			System.out.println("Over: " + overtime);
			System.out.println("Night: " + nighttime);
			System.out.println("Holiday: " + holidaytime);
			System.out.println("Sum: " + sumtime);
			*/
		}

		// JSP 에서 표현하기 위해서 쓰이는 Getter
		public String getDate() {
			return date;
		}
		
		public String getIntime() {
			return intime;
		}

		public String getOuttime() {
			return outtime;
		}
		
		public String getOvertime() {
			return overtime;
		}
		
		public String getNighttime() {
			return nighttime;
		}
		
		public String getHolidaytime() {
			return holidaytime;
		}
		
		public String getSumtime() {
			return sumtime;
		}
		
		public long getSummation() {
			return summation;
		}
	}
	
	// 출근
	@RequestMapping(value = "commute", method = RequestMethod.POST)
	public ModelAndView attendance(CommuteVO commuteVO, ModelAndView mv, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		if(((String)session.getAttribute("id")).equals("admin"))
			mv.setViewName("redirect:/admin");
		else
			mv.setViewName("redirect:/main");
		
		mv.addObject("canCommute", "disabled");
		CommuteVO temp = commuteService.viewAttendance(commuteVO);
		System.out.println(temp);
		if(temp == null || temp.equals("") || temp.equals("null")) { // First Attendance
			commuteService.attendance(commuteVO);
		}
		
		temp = commuteService.viewAttendance(commuteVO);
		if(temp.getIntimeDate() == null) {
			mv.addObject("mintime", "00:00");
		} else {
			mv.addObject("mintime", new SimpleDateFormat("HH:mm").format(temp.getIntimeDate()));
		}
		if(temp.getOutTime() == null) {
			mv.addObject("mouttime", "00:00");
		} else {
			mv.addObject("mouttime", new SimpleDateFormat("HH:mm").format(temp.getOutTime()));
		}
		System.out.println(temp);
		
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		mv.addObject("no", model.asMap().get("no"));
		return mv;
	}
	
	// 퇴근
	@RequestMapping(value = "leave", method = RequestMethod.POST)
	public ModelAndView leave(CommuteVO commuteVO, ModelAndView mv, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		
		if(((String)session.getAttribute("id")).equals("admin"))
			mv.setViewName("redirect:/admin");
		else
			mv.setViewName("redirect:/main");
		
		commuteService.leave(commuteVO);
		
		CommuteVO temp = commuteService.viewAttendance(commuteVO);
		
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
		System.out.println(temp);
		model.addAttribute("no", employeeService.getVOById((String) session.getAttribute("id")).getNo());
		mv.addObject("no",  model.asMap().get("no"));
		return mv;
	}
	
	//일간근태관리
	@RequestMapping(value = "/commute/dayWork", method = RequestMethod.GET)
	public ModelAndView dayWork(HttpSession session, CommuteVO commuteVO, Model mv, HttpServletRequest request) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("일간근태관리 페이지 GET");
		
		int num = (int)session.getAttribute("no");
		mav.setViewName("/commute/dayWork"); // Default Setting

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		if(startDate == null || startDate.equals("") || startDate.equals("null")) {
			startDate = new SimpleDateFormat("yyyyMM01").format(new Date());
		} else {
			startDate = startDate.replace("-", "");
		}
		if(endDate == null || endDate.equals("") || endDate.equals("null")) {
			endDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
		} else {
			endDate = endDate.replace("-", "");
		}
		System.out.println(startDate);
		System.out.println(endDate);
		commuteVO.setNo(num);
		commuteVO.setStartDate(startDate);
		commuteVO.setEndDate(endDate);
		System.out.println(commuteVO);
		List<CommuteVO> list = commuteService.DayCommute(commuteVO);
		System.out.println(list.size());
		
		// Calculate Duration
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate d1 = LocalDate.parse(startDate, dtf);	// startDate 부터
		LocalDate d2 = LocalDate.parse(endDate, dtf);	// endDate 까지
		long dur = Duration.between(d1.atStartOfDay(), d2.atStartOfDay()).toDays() + 1; // startDate ~ endDate까지 총 일수 계산
		
		// Add records
		List<CommuteRecord> records = new ArrayList<>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(java.sql.Date.valueOf(d1)); // Calendar를 startDate로 설정
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");		// 날짜 출력
		SimpleDateFormat viewFormat = new SimpleDateFormat("yyyy-MM-dd");	// View 출력 용
		int idx = 0;
		for(int i = 0 ; i < dur; i++) { // startDate ~ endDate까지 진행 ex) 1.1 ~ 1.30 일까지 진행
			//System.out.println(dateFormat.format(new Timestamp(cal.getTimeInMillis())));
			//System.out.println(dateFormat.format(list.get(idx).getIntimeDate()));
			if(idx < list.size() &&	// 근태 기록에서 가장 마지막 날짜가 계산 안 되었으면 -> 아직 계산할 근태 기록이 남아있으면
					dateFormat.format(new Timestamp(cal.getTimeInMillis())).equals(dateFormat.format(list.get(idx).getIntimeDate()))) { // cal[i] == list[idx] -> 현재 처리중인 일자와 같은지 비교
				// if 현재 계산 중인 일자에 근태 기록 시간이 있으면
				records.add(new CommuteRecord(list.get(idx).getIntimeDate(), list.get(idx).getOutTime())); // CommuteRecord Class를 통해서 출퇴근 시간을 이용하여 자동으로 여러 근무시간 계산
				// 출근 시간과 퇴근 시간을 이용하여 CommuteRecord를 생성, 자동으로 초과, 야간, 휴일, 총 근무시간 계산 후 records List에 추가.
				idx++;
				// 현재 일자의 근태 기록은 계산되었으니 다음 근태 기록으로 설정
			} else {
				// 만약 계산 중인 날짜에 근태 기록이 없으면, CommuteRecord에 날짜만 추가, records List에 추가
				records.add(new CommuteRecord(viewFormat.format(new Timestamp(cal.getTimeInMillis()))));
			}	
			cal.add(Calendar.DATE, 1); // 계산 중인 날짜 + 1
		}

		mav.addObject("list", records);

		return mav;
	}
	
	//주간근태관리
	@RequestMapping(value = "/commute/weekWork", method = RequestMethod.GET)
	public ModelAndView weekWork(HttpSession session, CommuteVO commuteVO, Model mv, HttpServletRequest request) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("주간근태관리 페이지 진입!");
		
		int num = (int)session.getAttribute("no");
		mav.setViewName("/commute/weekWork"); // Default Setting

		Calendar cal = Calendar.getInstance();
		String calendar = request.getParameter("calendar");
		String startDate = "";
		String endDate = "";
		if(calendar == null || calendar.equals("") || calendar.equals("null")) { // 주차 입력이 안된 경우 ex) 아예 처음 접속
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
			endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		} else { // 입력이 된 경우
			String[] year_week = calendar.split("-W"); // 2024-W02 -> 2024 / 02
			cal.set(Calendar.YEAR, Integer.parseInt(year_week[0]));
			cal.set(Calendar.WEEK_OF_YEAR, Integer.parseInt(year_week[1]));
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
			endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			System.out.println("WEEK: " + calendar);
		}
		
		System.out.println("START: " + startDate);
		System.out.println("END: " + endDate);
		commuteVO.setNo(num);
		commuteVO.setStartDate(startDate);
		commuteVO.setEndDate(endDate);
		List<CommuteVO> list = commuteService.DayCommute(commuteVO);
		
		// Calculate Duration
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate d1 = LocalDate.parse(startDate, dtf);
		LocalDate d2 = LocalDate.parse(endDate, dtf);
		long dur = Duration.between(d1.atStartOfDay(), d2.atStartOfDay()).toDays() + 1;
		
		// Add records
		List<CommuteRecord> records = new ArrayList<>();
		cal = Calendar.getInstance();
		cal.setTime(java.sql.Date.valueOf(d1));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat viewFormat = new SimpleDateFormat("yyyy-MM-dd");
		int idx = 0;
		for(int i = 0 ; i < dur; i++) {
			//System.out.println(dateFormat.format(new Timestamp(cal.getTimeInMillis())));
			//System.out.println(dateFormat.format(list.get(idx).getIntimeDate()));
			if(idx < list.size() &&
					dateFormat.format(new Timestamp(cal.getTimeInMillis())).equals(dateFormat.format(list.get(idx).getIntimeDate()))) {
				records.add(new CommuteRecord(list.get(idx).getIntimeDate(), list.get(idx).getOutTime()));
				idx++;
			} else {
				records.add(new CommuteRecord(viewFormat.format(new Timestamp(cal.getTimeInMillis()))));
			}	
			cal.add(Calendar.DATE, 1);
		}

		mav.addObject("list", records);

		return mav;
	}
	
	//월간근태관리
	@RequestMapping(value = "/commute/monthWork", method = RequestMethod.GET)
	public ModelAndView monthWork(HttpSession session, CommuteVO commuteVO, Model mv, HttpServletRequest request) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("월간근태관리 페이지 진입!");
		
		int num = (int)session.getAttribute("no");
		mav.setViewName("/commute/monthWork"); // Default Setting

		Calendar cal = Calendar.getInstance();
		String calendar = request.getParameter("calendar");
		String startDate = "";
		String endDate = "";
		if(calendar == null || calendar.equals("") || calendar.equals("null")) { // 월 입력이 안된 경우 sysdate달의 첫날 부터 마지막날까지 출력
			cal.set(Calendar.DAY_OF_MONTH, 1);
			startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		} else { // 월 입력이 존재하는 경우 해당 월의 첫날부터 마지막날까지 출력
			String[] year_week = calendar.split("-"); 
			cal.set(Calendar.YEAR, Integer.parseInt(year_week[0]));
			cal.set(Calendar.MONTH, Integer.parseInt(year_week[1])-1);
			cal.set(Calendar.DAY_OF_MONTH, 1);
			startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			System.out.println("MONTH: " + calendar);
		}
		
		System.out.println("START: " + startDate);
		System.out.println("END: " + endDate);
		commuteVO.setNo(num);
		commuteVO.setStartDate(startDate);
		commuteVO.setEndDate(endDate);
		System.out.println(commuteVO);
		List<CommuteVO> list = commuteService.DayCommute(commuteVO);
		System.out.println(list.size());
		
		// Calculate Duration
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate d1 = LocalDate.parse(startDate, dtf);
		LocalDate d2 = LocalDate.parse(endDate, dtf);
		long dur = Duration.between(d1.atStartOfDay(), d2.atStartOfDay()).toDays() + 1;
		System.out.println(dur);
		
		// Add records
		List<CommuteRecord> records = new ArrayList<>();
		cal = Calendar.getInstance();
		cal.setTime(java.sql.Date.valueOf(d1));
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat viewFormat = new SimpleDateFormat("yyyy-MM-dd");
		int idx = 0;
		for(int i = 0 ; i < dur; i++) {
			//System.out.println(dateFormat.format(new Timestamp(cal.getTimeInMillis())));
			//System.out.println(dateFormat.format(list.get(idx).getIntimeDate()));
			if(idx < list.size() &&
					dateFormat.format(new Timestamp(cal.getTimeInMillis())).equals(dateFormat.format(list.get(idx).getIntimeDate()))) {
				records.add(new CommuteRecord(list.get(idx).getIntimeDate(), list.get(idx).getOutTime()));
				idx++;
			} else {
				records.add(new CommuteRecord(viewFormat.format(new Timestamp(cal.getTimeInMillis()))));
			}	
			cal.add(Calendar.DATE, 1);
		}

		mav.addObject("list", records);

		return mav;
	}
}
