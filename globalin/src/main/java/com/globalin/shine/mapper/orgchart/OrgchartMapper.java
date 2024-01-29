package com.globalin.shine.mapper.orgchart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.globalin.shine.domain.employee.EmployeeVO;

@Mapper
public interface OrgchartMapper {
    List<EmployeeVO> getEmpListByDept(String deptName);
    EmployeeVO getEmp(Integer no);
}