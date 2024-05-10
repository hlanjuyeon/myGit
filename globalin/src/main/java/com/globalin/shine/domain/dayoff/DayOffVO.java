package com.globalin.shine.domain.dayoff;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class DayOffVO {

	private int no;
	private String name;
	private int total;
	private int remind;
	private int usedTotal;
	private int kind;
	private String useDate;
	private String reason;
	private int loginNo;
}
