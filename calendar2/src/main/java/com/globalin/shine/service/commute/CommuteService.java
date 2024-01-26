package com.globalin.shine.service.commute;


import java.util.List;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.commute.CommuteVO;
import com.globalin.shine.domain.commute.TimeVO;

@Service
public interface CommuteService {
	// 출근
	public int attendance(CommuteVO commuteVO);
	
	// 퇴근
	public int leave(CommuteVO commuteVO);
	
	// 근태 조회
	public List<CommuteVO> DayCommute(CommuteVO commuteVO);
	public List<CommuteVO> viewDayWork(CommuteVO commuteVO);
	
	// 메인화면 출근,퇴근시간 출력
	public CommuteVO viewAttendance(CommuteVO commuteVO);
	
	// 중복 출근 확인
	public String checkDuplicateAttendance(CommuteVO commuteVO);
	
	// 메인화면 근무시간 출력
	public TimeVO mainCommute(CommuteVO commuteVO, TimeVO timeVO);
	
}