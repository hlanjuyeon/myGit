package com.globalin.shine.domain.calendar;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CalendarVO{
	private int no;
	private String title;
	private String startday;
	private String endday;
	private boolean allday;
	private String content;
	private String location;
	private String attendee;
	private String repeat;
	private String privacy;
	private	String color;
	private String writer;
	private String empNo;
}