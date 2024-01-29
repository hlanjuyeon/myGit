package com.globalin.shine.domain.orgchart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.globalin.shine.domain.employee.EmployeeVO;
import com.globalin.shine.mapper.orgchart.OrgchartMapper;

@Repository
@Primary
public class OrgchartDAOImpl implements OrgchartDAO {
	@Autowired
	private OrgchartMapper orgchartMapper;
	
	@Override
	public List<EmployeeVO> getEmpListByDept(String deptName){
		return orgchartMapper.getEmpListByDept(deptName);
	}
	
	@Override 
	public EmployeeVO getEmp(Integer no) { 
		return orgchartMapper.getEmp(no); 
	}
}