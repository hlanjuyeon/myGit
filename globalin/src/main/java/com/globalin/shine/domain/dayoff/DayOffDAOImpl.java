package com.globalin.shine.domain.dayoff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.mapper.dayoff.DayOffMapper;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class DayOffDAOImpl implements DayOffDAO {

	@Autowired
	DayOffMapper dayOffMapper;
	
	@Override
	public DayOffVO getSvInfo(int no) {
		return dayOffMapper.readInfo(no);
	}

	@Override
	public List<ApprovalVO> getSvList(int no) {
		return dayOffMapper.readList(no);
	}

	@Override
	public boolean modifyInfo(DayOffVO dayOff) {
		return dayOffMapper.updateInfo(dayOff) != 0;
	}

	@Override
	public List<DayOffVO> getInfo() {
		return dayOffMapper.getInfo();
	}

	@Override
	public DayOffVO viewDetailsInfo(int no) {
		return dayOffMapper.readInfo(no);
	}

	@Override
	public List<ApprovalVO> viewDetailsList(int no) {
		return dayOffMapper.readList(no);
	}

}
