package com.globalin.shine.domain.commute;

public class TimeVO {
	String h;
	String m;
	
	public String getH() {
		updateTime();
		return h;
	}
	public void setH(String h) {
		this.h = h;
	}
	public String getM() {
		updateTime();
		return m;
	}
	public void setM(String m) {
		this.m = m;
	}
	
	private void updateTime() {
		int h, m;
		h = Integer.parseInt(this.h) + (int)(Integer.parseInt(this.m) / 60);
		m = (int)(Integer.parseInt(this.m) % 60);
		this.h = String.format("%02d", h);
		this.m = String.format("%02d", m);
	}
	@Override
	public String toString() {
		return "TimeVO [h=" + h + ", m=" + m + "]";
	}
}
