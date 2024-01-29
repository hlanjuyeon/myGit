package com.globalin.shine.service.orgchart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.employee.EmployeeVO;
import com.globalin.shine.domain.orgchart.OrgchartDAO;

@Service
@Primary
public class OrgchartServiceImpl implements OrgchartService {
    @Autowired
    private OrgchartDAO orgchartDAO;

    @Override
    public List<EmployeeVO> getEmpListByDept(String deptName) {
        return orgchartDAO.getEmpListByDept(deptName);
    }

    @Override
    public EmployeeVO getEmp(Integer no) {
        return orgchartDAO.getEmp(no);
    }
}