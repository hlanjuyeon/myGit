package com.globalin.shine.domain.approval;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ApprovalEmpDTO {

	private int docNo;
	private String startDept;
	private String endDept;
	private String replyDept;
	private String writer;
	private String form;
	private String title;
	private String content;
	private String writeDay;
	private String state;
	private int appNo1;
	private String appState1;
	private String appDay1;
	private String appReply1;
	private int appNo2;
	private String appState2;
	private String appDay2;
	private String appReply2;
	private int appNo3;
	private String appState3;
	private String appDay3;
	private String appReply3; 
	private String updateDay;
	private String temp;
	private String SendReceive;
	private String titleReply;
	private String contentReply;
	private String yearUseDays;
	private String yearUseDateStart;
	private String yearUseDateEnd;
	private String yearAmPm;
	private String yearReason;
	private int refNo1;
	private int refNo2;
	private String appNo1name;
	private String appNo2name;
	private String appNo3name;
	private String refNo1name;
	private String refNo2name;
	private String appNo1dept;
	private String appNo2dept;
	private String appNo3dept;
	private String refNo1dept;
	private String refNo2dept;
	private String appNo1id;
	private String appNo2id;
	private String appNo3id;
	private String appNo1pw;
	private String appNo2pw;
	private String appNo3pw;
	private String writerReply;
	
    /*
     * 계층형 게시판을 위한 추가 필드
     * originNo, groupOrd, groupLayer 
     */
    
    /** 원글 번호 **/
    private int originNo;
    
    /** 원글(답글포함)에 대한 순서 **/
    private int groupOrd;
    
	private String empName;
	private String empDept;
	
	private String Name;
	private String DeptName;
}
