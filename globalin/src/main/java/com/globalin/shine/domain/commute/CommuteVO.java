package com.globalin.shine.domain.commute;

import java.sql.Timestamp;

public class CommuteVO {
	Timestamp IntimeDate;
	Timestamp outTime;
	int no;
	String startDate;
	String endDate;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Timestamp getIntimeDate() {
		return IntimeDate;
	}

	public void setIntimeDate(Timestamp intimeDate) {
		IntimeDate = intimeDate;
	}

	public Timestamp getOutTime() {
		return outTime;
	}

	public void setOutTime(Timestamp outTime) {
		this.outTime = outTime;
	}

	public CommuteVO() {
		
	}
	
	public void setStartDate(String s) {
		this.startDate = s;
	}
	public void setEndDate(String s) {
		this.endDate = s;
	}
	public String getStartDate() {
		return startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	
	@Override
	public String toString() {
		return "CommuteVO [no = " + no + ", IntimeDate = " + IntimeDate + ", outTime = " + outTime + ", startDate = " + startDate + ", endDate = " + endDate + "]\n";
	}
}
