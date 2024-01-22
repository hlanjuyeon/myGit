package com.globalin.shine.domain.commute;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommuteDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 출근처리
	public int attendance(CommuteVO commuteVO) {
		return sqlSessionTemplate.insert("commute.attendance", commuteVO);
	}
	
	// 퇴근처리
	public int leave(CommuteVO commuteVO) {
		return sqlSessionTemplate.insert("commute.leave", commuteVO);
	}
	
	// 근태 조회
	public List<CommuteVO> DayCommute(CommuteVO commuteVO) {
		return sqlSessionTemplate.selectList("commute.DayCommute", commuteVO);				
	}

	public List<CommuteVO> viewDaywork(CommuteVO commuteVO) {
		return sqlSessionTemplate.selectList("commute.viewDayWork", commuteVO);
	}
	
	// 메인화면 출근시간 출력
	public CommuteVO viewAttendance(CommuteVO commuteVO) {
		return sqlSessionTemplate.selectOne("commute.viewAttendance", commuteVO);
	}
	
	// 중복 시간 확인
	public String checkDuplicateAttendance(CommuteVO commuteVO) {
		return sqlSessionTemplate.selectOne("commute.checkDuplicateAttendance", commuteVO); 
	}
	
	// 메인화면 근무시간 출력
	public TimeVO mainCommute(CommuteVO commuteVO, TimeVO timeVO) {
		return sqlSessionTemplate.selectOne("commute.mainCommute", commuteVO);
	}
	
}
