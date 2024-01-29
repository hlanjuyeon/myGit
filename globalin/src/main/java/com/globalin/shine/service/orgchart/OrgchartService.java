package com.globalin.shine.service.orgchart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.employee.EmployeeVO;

@Service
public interface OrgchartService {
    List<EmployeeVO> getEmpListByDept(String deptName);
    EmployeeVO getEmp(Integer no);
}