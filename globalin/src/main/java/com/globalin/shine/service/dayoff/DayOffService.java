package com.globalin.shine.service.dayoff;

import java.util.List;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.domain.dayoff.DayOffVO;

@Service
public interface DayOffService {
	
	//연차 정보, 리스트 가져오기
	public DayOffVO getSvInfo(int no);	
	public List<ApprovalVO> getSvList(int no);
	
	//연차 수정 - 관리자
	public boolean modifyInfo(DayOffVO dayOff);
	
	//전체 연차 가져오기 - 관리자
	public List<DayOffVO> getInfo();

	//연차 상세보기 - 관리자
	public DayOffVO viewDetailsInfo(int no);	
	public List<ApprovalVO> viewDetailsList(int no);
	
	//검색기능 - 관리자
	
	//페이징처리 - 관리자
}
