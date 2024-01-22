package com.globalin.shine.service.commute;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.commute.CommuteDAO;
import com.globalin.shine.domain.commute.CommuteVO;
import com.globalin.shine.domain.commute.TimeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CommuteServiceImpl implements CommuteService {
	@Autowired
	CommuteDAO commuteDAO;
	
	@Override
	public int attendance(CommuteVO commuteVO) {
		return commuteDAO.attendance(commuteVO);
	}

	@Override
	public int leave(CommuteVO commuteVO) {
		return commuteDAO.leave(commuteVO);
	}

	@Override
	public CommuteVO viewAttendance(CommuteVO commuteVO) {
		return commuteDAO.viewAttendance(commuteVO);
	}

	@Override
	public String checkDuplicateAttendance(CommuteVO commuteVO) {
		return commuteDAO.checkDuplicateAttendance(commuteVO);
	}

	@Override
	public List<CommuteVO> DayCommute(CommuteVO commuteVO) {
		return commuteDAO.DayCommute(commuteVO);
	}

	@Override
	public List<CommuteVO> viewDayWork(CommuteVO commuteVO) {
		return commuteDAO.viewDaywork(commuteVO);
	}

	@Override
	public TimeVO mainCommute(CommuteVO commuteVO, TimeVO timeVO) {
		return commuteDAO.mainCommute(commuteVO, timeVO);
	}
	

}
