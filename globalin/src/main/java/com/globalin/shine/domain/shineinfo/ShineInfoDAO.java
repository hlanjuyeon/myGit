package com.globalin.shine.domain.shineinfo;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface ShineInfoDAO {

	// 사원정보 리스트 - 관리자
	public List<ShineInfoVO> shineInfoListadmin();

	// 사원정보 상세보기 - 관리자
	public ShineInfoVO viewDetailsAdmin(int no);

	// 사원정보 업데이트 - 관리자
	public boolean modifyadmin(ShineInfoVO shineInfo);

	// 사원정보 업데이트목록 - 관리자
		public ShineInfoVO modifyadminRead(int no);
	
	// 사원정보 페이징 처리 - 관리자

	// 사원정보 검색기능(사원명, 부서명) - 관리자

}
