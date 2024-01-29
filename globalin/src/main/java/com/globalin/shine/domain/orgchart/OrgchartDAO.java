package com.globalin.shine.domain.orgchart;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.globalin.shine.domain.employee.EmployeeVO;

@Repository
public interface OrgchartDAO {
    List<EmployeeVO> getEmpListByDept(String deptName);
    EmployeeVO getEmp(Integer no);
}