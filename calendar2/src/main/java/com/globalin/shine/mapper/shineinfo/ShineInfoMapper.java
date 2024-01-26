package com.globalin.shine.mapper.shineinfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.globalin.shine.domain.shineinfo.ShineInfoVO;

@Mapper
public interface ShineInfoMapper {
		
		//사원정보 리스트 - 관리자
		public List<ShineInfoVO> shineInfoList();
		
		//사원정보 상세보기 - 관리자
		public ShineInfoVO viewDetailsShineInfo(int no);
		
		//사원정보 업데이트 - 관리자
		public int updateAdmin(ShineInfoVO shineInfo);
		
		//사원정보 업데이트 - 관리자
		public ShineInfoVO updateAdminRead(int no);
		
		//사원정보 페이징 처리 - 관리자
		
		
		//사원정보 검색기능(사원명, 부서명) - 관리자
	
}
