package com.globalin.shine.service.dayoff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.domain.dayoff.DayOffDAO;
import com.globalin.shine.domain.dayoff.DayOffVO;

@Service
public class DayOffServiceImpl implements DayOffService {

	@Autowired
	DayOffDAO dayOffDAO;
	
	@Override
	public DayOffVO getSvInfo(int no) {	
		return dayOffDAO.getSvInfo(no);
	}

	@Override
	public List<ApprovalVO> getSvList(int no) {	
		return dayOffDAO.getSvList(no);
	}

	@Override
	public boolean modifyInfo(DayOffVO dayOff) {
		return dayOffDAO.modifyInfo(dayOff);
	}

	@Override
	public List<DayOffVO> getInfo() {	
		return dayOffDAO.getInfo();
	}

	@Override
	public DayOffVO viewDetailsInfo(int no) {	
		return dayOffDAO.getSvInfo(no);
	}

	@Override
	public List<ApprovalVO> viewDetailsList(int no) {	
		return dayOffDAO.getSvList(no);
	}


}
