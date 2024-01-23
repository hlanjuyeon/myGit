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
	 * date 		: �궇吏�			(String)
	 * intime 		: 異쒓렐 �궇吏�		(String)
	 * outtime 		: �눜洹� �궇吏�		(String)
	 * overtime		: 珥덇낵 洹쇰Т �떆媛�	(String)
	 * nighttime 	: �빞媛� 洹쇰Т �떆媛�	(String)
	 * holidaytime	: �쑕�씪 洹쇰Т �떆媛�	(String)
	 * sumtime		: �떦�씪 珥� 洹쇰Т �떆媛� -> summation(long)�쓣 臾몄옄�뿴 �삎�깭濡� HH:mm:ss
	 * summation	: �떦�씪 珥� 洹쇰Т �떆媛� -> 洹쇰Т �떆媛꾩쓣 珥� �떒�쐞濡� ���옣
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
		
		public CommuteRecord(String d) { // 洹쇰Т 湲곕줉�씠 �뾾�뒗 寃쎌슦�뿉�뒗 Date留� 珥덇린�솕
			date = d;
			intime = outtime = overtime = nighttime = holidaytime = sumtime = " ";
			summation = 0;
		}
		
		public CommuteRecord(Timestamp in, Timestamp out) throws ParseException { // 異쒓렐 湲곕줉�씠 議댁옱�븯硫� / �눜洹� 湲곕줉�� �뾾�쓣 �닔 �엳�쓬
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 	// �궇吏� 異붿텧 SimpleDateFormat
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");		// �떆媛� 異붿텧 SimpleDateFormat
			date = dateFormat.format(in);		// 異쒓렐 湲곕줉 �씪�옄
			intime = timeFormat.format(in);		// 異쒓렐 湲곕줉 �떆媛�
			
			if(out == null) { // �눜洹� 湲곕줉�씠 議댁옱�븯吏� �븡�쑝硫�
				outtime = overtime = nighttime = holidaytime = " "; // 洹쇰Т �떆媛꾩쓣 怨꾩궛�븯吏� �븡�쓬
				summation = 0; 
				sumtime = "00:00:00";
			} else { // �눜洹� 湲곕줉�씠 議댁옱�븯硫� 怨꾩궛�씠 �븘�슂�븿
				outtime = timeFormat.format(out); // �눜洹� �떆媛� 異붿텧
				
				Timestamp tOut = new Timestamp(timeFormat.parse(outtime).getTime());		// �눜洹� �떆媛�
				Timestamp tTemp = new Timestamp(timeFormat.parse("18:00:00").getTime());	// 18:00:00�떆
				Duration dTemp;	// 李⑥씠瑜� ���옣�븯湲� �쐞�븳 Duration
				
				/* overtime 怨꾩궛 */
				if(tOut.after(tTemp)) { // 留뚯빟, �눜洹쇱떆媛꾩씠 18�떆 �씠�썑硫� overtime 怨꾩궛
					tTemp = new Timestamp(timeFormat.parse("22:00:00").getTime()); // 留뚯빟, �눜洹� �떆媛꾩씠 22�떆 �씠�썑硫� nighttime 怨꾩궛
					if(tOut.before(tTemp)) { // 10�떆 �씠�쟾 �눜洹쇱씠硫� �삤�썑 6 ~ �눜洹쇱떆媛꾧퉴吏� overtime
						// 18:00 ~ �눜洹� �떆媛꾧퉴吏� 怨꾩궛
						dTemp = Duration.between(new Timestamp(timeFormat.parse("18:00:00").getTime()).toLocalDateTime().toLocalTime(), tOut.toLocalDateTime().toLocalTime());
						long Hour = dTemp.toHours();
						long Min = dTemp.toMinutesPart();
						long Sec = dTemp.toSecondsPart();
						overtime = String.format("%02d:%02d:%02d", Hour, Min, Sec);
					} else { // 10�떆 �씠�썑 �눜洹쇱씠硫� 珥덇낵 4�떆
						overtime = "04:00:00";
					}
				} else { // 珥덇낵 �뾾�쑝硫�
					overtime = " ";
				}
				
				/* nighttime 怨꾩궛 */
				tTemp = new Timestamp(timeFormat.parse("22:00:00").getTime()); // 22:00:00�떆
				if(tOut.after(tTemp)) {// �눜洹쇱떆媛꾩씠 22:00:00�떆 �씠�썑硫� �빞媛� 洹쇰줈 �떆媛� 怨꾩궛 nightTime
					dTemp = Duration.between(tTemp.toLocalDateTime().toLocalTime(), out.toLocalDateTime().toLocalTime()); // 22:00 ~ �눜洹� �떆媛�
					long Hour = dTemp.toHours();
					long Min = dTemp.toMinutesPart();
					long Sec = dTemp.toSecondsPart();
					nighttime = String.format("%02d:%02d:%02d", Hour, Min, Sec);
				} else {
					nighttime = " ";
				}
				
				/* 二쇰쭚 洹쇰Т �떆媛� 怨꾩궛 */
				Calendar cal = Calendar.getInstance();
				cal.setTime(dateFormat.parse(date)); // calendar瑜� 異쒓렐 �궇吏쒕줈 �꽕�젙
				int dayofweek = cal.get(Calendar.DAY_OF_WEEK); // 異쒓렐 �궇吏� �슂�씪 媛��졇�삤湲�
				if(dayofweek == 1 || dayofweek == 7) { // �씪�슂�씪(1) �씠嫄곕굹 �넗�슂�씪(7) �씠硫� �쑕�씪 洹쇰Т �떆媛꾩쑝濡� 怨꾩궛
					dTemp = Duration.between(in.toLocalDateTime().toLocalTime(), out.toLocalDateTime().toLocalTime()); // 異쒓렐 ~ �눜洹쇨퉴吏�
					long Hour = dTemp.toHours();
					long Min = dTemp.toMinutesPart();
					long Sec = dTemp.toSecondsPart();
					holidaytime = String.format("%02d:%02d:%02d", Hour, Min, Sec);
				} else {
					holidaytime = " ";
				}
				
				// 珥� 洹쇰Т �떆媛� (異쒓렐 ~ �눜洹�)
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

		// JSP �뿉�꽌 �몴�쁽�븯湲� �쐞�빐�꽌 �벐�씠�뒗 Getter
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
	
	// 異쒓렐
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
	
	// �눜洹�
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
	
	//�씪媛꾧렐�깭愿�由�
	@RequestMapping(value = "/commute/dayWork", method = RequestMethod.GET)
	public ModelAndView dayWork(HttpSession session, CommuteVO commuteVO, Model mv, HttpServletRequest request) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("�씪媛꾧렐�깭愿�由� �럹�씠吏� GET");
		
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
		LocalDate d1 = LocalDate.parse(startDate, dtf);	// startDate 遺��꽣
		LocalDate d2 = LocalDate.parse(endDate, dtf);	// endDate 源뚯�
		long dur = Duration.between(d1.atStartOfDay(), d2.atStartOfDay()).toDays() + 1; // startDate ~ endDate源뚯� 珥� �씪�닔 怨꾩궛
		
		// Add records
		List<CommuteRecord> records = new ArrayList<>();
		Calendar cal = Calendar.getInstance();
		cal.setTime(java.sql.Date.valueOf(d1)); // Calendar瑜� startDate濡� �꽕�젙
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");		// �궇吏� 異쒕젰
		SimpleDateFormat viewFormat = new SimpleDateFormat("yyyy-MM-dd");	// View 異쒕젰 �슜
		int idx = 0;
		for(int i = 0 ; i < dur; i++) { // startDate ~ endDate源뚯� 吏꾪뻾 ex) 1.1 ~ 1.30 �씪源뚯� 吏꾪뻾
			//System.out.println(dateFormat.format(new Timestamp(cal.getTimeInMillis())));
			//System.out.println(dateFormat.format(list.get(idx).getIntimeDate()));
			if(idx < list.size() &&	// 洹쇳깭 湲곕줉�뿉�꽌 媛��옣 留덉�留� �궇吏쒓� 怨꾩궛 �븞 �릺�뿀�쑝硫� -> �븘吏� 怨꾩궛�븷 洹쇳깭 湲곕줉�씠 �궓�븘�엳�쑝硫�
					dateFormat.format(new Timestamp(cal.getTimeInMillis())).equals(dateFormat.format(list.get(idx).getIntimeDate()))) { // cal[i] == list[idx] -> �쁽�옱 泥섎━以묒씤 �씪�옄�� 媛숈�吏� 鍮꾧탳
				// if �쁽�옱 怨꾩궛 以묒씤 �씪�옄�뿉 洹쇳깭 湲곕줉 �떆媛꾩씠 �엳�쑝硫�
				records.add(new CommuteRecord(list.get(idx).getIntimeDate(), list.get(idx).getOutTime())); // CommuteRecord Class瑜� �넻�빐�꽌 異쒗눜洹� �떆媛꾩쓣 �씠�슜�븯�뿬 �옄�룞�쑝濡� �뿬�윭 洹쇰Т�떆媛� 怨꾩궛
				// 異쒓렐 �떆媛꾧낵 �눜洹� �떆媛꾩쓣 �씠�슜�븯�뿬 CommuteRecord瑜� �깮�꽦, �옄�룞�쑝濡� 珥덇낵, �빞媛�, �쑕�씪, 珥� 洹쇰Т�떆媛� 怨꾩궛 �썑 records List�뿉 異붽�.
				idx++;
				// �쁽�옱 �씪�옄�쓽 洹쇳깭 湲곕줉�� 怨꾩궛�릺�뿀�쑝�땲 �떎�쓬 洹쇳깭 湲곕줉�쑝濡� �꽕�젙
			} else {
				// 留뚯빟 怨꾩궛 以묒씤 �궇吏쒖뿉 洹쇳깭 湲곕줉�씠 �뾾�쑝硫�, CommuteRecord�뿉 �궇吏쒕쭔 異붽�, records List�뿉 異붽�
				records.add(new CommuteRecord(viewFormat.format(new Timestamp(cal.getTimeInMillis()))));
			}	
			cal.add(Calendar.DATE, 1); // 怨꾩궛 以묒씤 �궇吏� + 1
		}

		mav.addObject("list", records);

		return mav;
	}
	
	//二쇨컙洹쇳깭愿�由�
	@RequestMapping(value = "/commute/weekWork", method = RequestMethod.GET)
	public ModelAndView weekWork(HttpSession session, CommuteVO commuteVO, Model mv, HttpServletRequest request) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("二쇨컙洹쇳깭愿�由� �럹�씠吏� 吏꾩엯!");
		
		int num = (int)session.getAttribute("no");
		mav.setViewName("/commute/weekWork"); // Default Setting

		Calendar cal = Calendar.getInstance();
		String calendar = request.getParameter("calendar");
		String startDate = "";
		String endDate = "";
		if(calendar == null || calendar.equals("") || calendar.equals("null")) { // 二쇱감 �엯�젰�씠 �븞�맂 寃쎌슦 ex) �븘�삁 泥섏쓬 �젒�냽
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
			startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
			endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		} else { // �엯�젰�씠 �맂 寃쎌슦
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
	
	//�썡媛꾧렐�깭愿�由�
	@RequestMapping(value = "/commute/monthWork", method = RequestMethod.GET)
	public ModelAndView monthWork(HttpSession session, CommuteVO commuteVO, Model mv, HttpServletRequest request) throws Exception {
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		System.out.println("�썡媛꾧렐�깭愿�由� �럹�씠吏� 吏꾩엯!");
		
		int num = (int)session.getAttribute("no");
		mav.setViewName("/commute/monthWork"); // Default Setting

		Calendar cal = Calendar.getInstance();
		String calendar = request.getParameter("calendar");
		String startDate = "";
		String endDate = "";
		if(calendar == null || calendar.equals("") || calendar.equals("null")) { // �썡 �엯�젰�씠 �븞�맂 寃쎌슦 sysdate�떖�쓽 泥ル궇 遺��꽣 留덉�留됰궇源뚯� 異쒕젰
			cal.set(Calendar.DAY_OF_MONTH, 1);
			startDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
			cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			endDate = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
		} else { // �썡 �엯�젰�씠 議댁옱�븯�뒗 寃쎌슦 �빐�떦 �썡�쓽 泥ル궇遺��꽣 留덉�留됰궇源뚯� 異쒕젰
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
