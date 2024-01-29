package com.globalin.shine.domain.employee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 로그인
	public EmployeeVO login(EmployeeVO employeeVO) {
		return sqlSessionTemplate.selectOne("employee.login", employeeVO);
	}
	public EmployeeVO selectById(String id) {
		return sqlSessionTemplate.selectOne("employee.selectById", id);
	}
	
	// 사원 등록
	public int insert(EmployeeVO employeeVO) {
		return sqlSessionTemplate.insert("employee.insert", employeeVO);
	}
	
	// 마이 페이지
	public EmployeeVO myPage(EmployeeVO employeeVO) {
		return sqlSessionTemplate.selectOne("employee.myPage", employeeVO);
	}

	// 아이디 중복 체크
//	public int idChk(EmployeeVO employeeVO) throws Exception {
//		int result = sqlSessionTemplate.selectOne("employee.idChk", employeeVO);
//		return result;
//	}
	
	// 사원정보 수정 (일반 사용자)
	public int update(EmployeeVO employeeVO) {
		return sqlSessionTemplate.update("employee.update", employeeVO);
	}
	
	// 사원정보 수정 (일반 사용자)
	public int checkIdDup(EmployeeVO employeeVO) {
		return sqlSessionTemplate.selectOne("employee.checkIdDup", employeeVO);
	}
}
