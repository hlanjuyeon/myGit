package com.globalin.shine.service.employee;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.employee.EmployeeVO;

@Service
public interface EmployeeService {
	// 로그인
	public EmployeeVO login(EmployeeVO employeeVO);
	public EmployeeVO getVOById(String id);
	
	// 사원 등록
	public int insert(EmployeeVO employeeVO) throws Exception;

	// 아이디 중복체크
//	public int idChk(EmployeeVO employeeVO) throws Exception;
	
	// 마이 페이지
	public EmployeeVO myPage(EmployeeVO employeeVO) throws Exception;
	
	// 사원정보 수정(일반)
	public int update(EmployeeVO employeeVO) throws Exception;
	
	// ID 중복 체크
	public int checkIdDup(EmployeeVO employeeVO) throws Exception;
}
