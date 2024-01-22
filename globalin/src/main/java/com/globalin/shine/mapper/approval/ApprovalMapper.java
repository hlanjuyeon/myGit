package com.globalin.shine.mapper.approval;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.globalin.shine.domain.approval.ApprovalEmpDTO;
import com.globalin.shine.domain.approval.ApprovalVO;
import com.globalin.shine.domain.approval.Criteria;
import com.globalin.shine.domain.dayoff.DayOffVO;
import com.globalin.shine.domain.employee.EmployeeVO;


@Mapper
@Repository
public interface ApprovalMapper {
//	public List<ApprovalVO> getApprovalList();
	public List<ApprovalVO> getTempList(Criteria criteri);
	public ApprovalEmpDTO getDetail(int no);
	public void insert(ApprovalVO approval);
	public void update(ApprovalVO approval);
	public void updateReply(ApprovalVO approval);
	public void delete(int no);
	/* 게시판 목록(페이징 적용) */
    public List<ApprovalVO> getListPagingIn(Criteria criteria);
    public List<ApprovalVO> getListPagingOut(Criteria criteria);
    /* 게시판 총 갯수 */
    public int getTotal();
    /* 첨언 삽입 */
    public void insertReply(ApprovalVO approval);
    public void insertYear(ApprovalVO approval);
    public List<EmployeeVO> getDeptList();
    public List<EmployeeVO> getUserList();
    public void updateApp(ApprovalVO approval);
    public void updateOriginNo(ApprovalVO approval);
    
    public DayOffVO selectTotal(int no);
    public DayOffVO selectRemind(int no);
    public ApprovalVO selectTemp(int no);
}