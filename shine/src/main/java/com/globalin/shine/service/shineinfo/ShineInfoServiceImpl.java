package com.globalin.shine.service.shineinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.shineinfo.ShineInfoDAO;
import com.globalin.shine.domain.shineinfo.ShineInfoVO;

@Service
public class ShineInfoServiceImpl implements ShineInfoService {

	@Autowired
	ShineInfoDAO shineInfoDAO;

	@Override
	public List<ShineInfoVO> shineInfoListadmin() {
		return shineInfoDAO.shineInfoListadmin();
	}

	@Override
	public ShineInfoVO viewDetailsadmin(int no) {
		return shineInfoDAO.viewDetailsAdmin(no);
	}

	@Override
	public boolean modifyadmin(ShineInfoVO shineInfo) {
		return shineInfoDAO.modifyadmin(shineInfo);
	}
	
	@Override
	public ShineInfoVO modifyadminRead(int no) {
		return shineInfoDAO.modifyadminRead(no);
	}
	
	//페이징처리 - myPage_admin페이지 
	
	//검색기능 - myPage_admin페이지 
	
	//사원사진 변경 - mypageUpdate페이지

}
