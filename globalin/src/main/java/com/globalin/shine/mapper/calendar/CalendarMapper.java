package com.globalin.shine.mapper.calendar;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.globalin.shine.domain.calendar.CalendarVO;

@Mapper
@Repository
public interface CalendarMapper {
	
	public List<Map<String, Object>> getCalendarList();	
	public List<Map<String, Object>> getCalendarByNo(@Param("no") int no);
	public void insert(CalendarVO calendar);
	public void update(CalendarVO calendar);
	public int delete(@Param("no") int no);
}