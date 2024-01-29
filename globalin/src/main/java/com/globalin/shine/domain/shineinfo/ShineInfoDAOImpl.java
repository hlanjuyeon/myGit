package com.globalin.shine.domain.shineinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.shine.mapper.shineinfo.ShineInfoMapper;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class ShineInfoDAOImpl implements ShineInfoDAO {

	@Autowired
	ShineInfoMapper shineInfoMapper;

	@Override
	public List<ShineInfoVO> shineInfoListadmin() {
		return shineInfoMapper.shineInfoList();
	}

	@Override
	public ShineInfoVO viewDetailsAdmin(int no) {
		return shineInfoMapper.viewDetailsShineInfo(no);
	}

	@Override
	public boolean modifyadmin(ShineInfoVO shineInfo) {
		return shineInfoMapper.updateAdmin(shineInfo) != 0;
	}
	
	@Override
	public ShineInfoVO modifyadminRead(int no) {
		return shineInfoMapper.updateAdminRead(no);
	}
	
	//페이징처리 - myPage_admin페이지 
	
    //검색기능 - myPage_admin페이지 
		
	//사원사진 변경 - mypageUpdate페이지

}
