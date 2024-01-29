package com.globalin.shine.domain.dayoff;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.globalin.shine.domain.approval.ApprovalVO;

@Repository
public interface DayOffDAO {

	public DayOffVO getSvInfo(int no);
	public List<ApprovalVO> getSvList(int no);
	public boolean modifyInfo(DayOffVO dayOff);
	public List<DayOffVO> getInfo();
	public DayOffVO viewDetailsInfo(int no);
	public List<ApprovalVO> viewDetailsList(int no);

}
