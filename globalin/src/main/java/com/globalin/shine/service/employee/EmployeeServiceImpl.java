package com.globalin.shine.service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.employee.EmployeeDAO;
import com.globalin.shine.domain.employee.EmployeeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Override
	public EmployeeVO login(EmployeeVO employeeVO) {
		return employeeDAO.login(employeeVO);
	}

	@Override
	public EmployeeVO getVOById(String id) {
		return employeeDAO.selectById(id);
	}

	@Override
	public int insert(EmployeeVO employeeVO) throws Exception {
		return employeeDAO.insert(employeeVO);
	}

	@Override
	public EmployeeVO myPage(EmployeeVO employeeVO) throws Exception {
		return employeeDAO.myPage(employeeVO);
	}

	@Override
	public int update(EmployeeVO employeeVO) throws Exception {
		return employeeDAO.update(employeeVO);
	}

//	@Override
//	public int idChk(EmployeeVO employeeVO) throws Exception {
//		return employeeDAO.idChk(employeeVO);
//	}

	@Override
	public int checkIdDup(EmployeeVO employeeVO) throws Exception {
		return employeeDAO.checkIdDup(employeeVO);
	}
}
