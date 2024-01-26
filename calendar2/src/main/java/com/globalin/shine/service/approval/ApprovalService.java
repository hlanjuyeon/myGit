package com.globalin.shine.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.approval.ApprovalEmpDTO;
import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.domain.approval.Criteria;
import com.globalin.shine.domain.dayoff.DayOffVO;
import com.globalin.shine.domain.employee.EmployeeVO;
import com.globalin.shine.mapper.approval.ApprovalMapper;

@Service
public class ApprovalService {
	
	@Autowired
	private ApprovalMapper approvalMapper;
	
//	public List<ApprovalVO> getApprovalList() {
//		return approvalMapper.getApprovalList();
//	}
//	
	public List<ApprovalVO> getTempList(Criteria criteri) {
		return approvalMapper.getTempList(criteri);
	}
	
	public ApprovalEmpDTO getDetail(int no) {
		return approvalMapper.getDetail(no);
	}
	
	public void insert(ApprovalVO approval) {
		approvalMapper.insert(approval);
	}
	
	public void update(ApprovalVO approval) {
		approvalMapper.update(approval);
	}
	
	public void delete(int no) {
		approvalMapper.delete(no);
	}
	
	public List<ApprovalVO> getListPagingIn(Criteria criteria) {
		return approvalMapper.getListPagingIn(criteria);
	}
	
	public List<ApprovalVO> getListPagingOut(Criteria criteria) {
		return approvalMapper.getListPagingOut(criteria);
	}
	
	/* 게시판 총 갯수 */
    public int getTotal() {
    	return approvalMapper.getTotal();
    }
    
    public void insertReply(ApprovalVO approval) {
		approvalMapper.insertReply(approval);
	}
    
    public void insertYear(ApprovalVO approval) {
		approvalMapper.insertYear(approval);
	}
    
    public List<EmployeeVO> getDeptList() {
    	return approvalMapper.getDeptList();
    }
    
    public List<EmployeeVO> getUserList() {
    	return approvalMapper.getUserList();
    }
    
    public void updateApp(ApprovalVO approval) {
		approvalMapper.updateApp(approval);
	}
    
    public void updateReply(ApprovalVO approval) {
    	approvalMapper.updateReply(approval);
    }
    
    public void updateOriginNo(ApprovalVO approval) {
    	approvalMapper.updateOriginNo(approval);
    }
    
    public DayOffVO selectTotal(int no) {
    	return approvalMapper.selectTotal(no);
    }
    
    public DayOffVO selectRemind(int no) {
    	return approvalMapper.selectRemind(no);
    }
    
    public ApprovalVO selectTemp(int no) {
    	return approvalMapper.selectTemp(no);
    }
}