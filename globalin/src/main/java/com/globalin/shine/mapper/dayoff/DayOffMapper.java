package com.globalin.shine.mapper.dayoff;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.domain.dayoff.DayOffVO;

@Mapper
public interface DayOffMapper {

	//개인 정보조회
	
	 public DayOffVO readInfo(int no);
	
	//개인 사용내역조회
	
	 public List<ApprovalVO> readList(int no);
	
	//관리자 전체 리스트조회
	
	 public List<DayOffVO> getInfo();
	
	//관리자 상세보기
	
	 public DayOffVO viewDetailsInfo(int no);
	 
	 public List<ApprovalVO> viewDetailsList(int no);
	
	//관리자 업데이트(추가연차-total)
	
	public int updateInfo(DayOffVO dayOff);
	
	//관리자 사원 검색하기
	
	//관리자 페이징처리

}
