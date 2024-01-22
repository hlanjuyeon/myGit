package com.globalin.shine.service.calendar;

import java.util.List;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.calendar.CalendarVO;
import com.globalin.shine.mapper.calendar.CalendarMapper;

@Service
public class CalendarService {
	
	@Autowired
	private CalendarMapper calendarMapper;

	public List<Map<String, Object>>getCalendarList(){
		return calendarMapper.getCalendarList();
	};
	
	public List<Map<String, Object>> getCalendarByNo(int no) {
	    return calendarMapper.getCalendarByNo(no);
	}
	
	public int delete(int no) {
		return calendarMapper.delete(no);
	}
	
	public void insert(CalendarVO calendar) {
		calendarMapper.insert(calendar);
	}
	
	public void update(CalendarVO calendar) {
		calendarMapper.update(calendar);
	}
}