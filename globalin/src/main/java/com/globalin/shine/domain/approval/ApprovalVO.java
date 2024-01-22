package com.globalin.shine.domain.approval;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ApprovalVO{
	private int no;
	private String startDept;
	private String endDept;
	private String replyDept;
	private int empNo;
	private String writer;
	private String form;
	private String title;
	private String content;
	private byte[] files;
	private String state;
	private String writeDay;
	private int appNo1;
	private String appName1;
	private String appState1;
	private String appDay1;
	private String appReply1;
	private int appNo2;
	private String appName2;
	private String appState2;
	private String appDay2;
	private String appReply2;
	private int appNo3;
	private String appName3;
	private String appState3;
	private String appDay3;
	private String appReply3; 
	private String refDept;
	private String refName1;
	private String refName2;
	private String updateDay;
	private String temp;
	private String SendReceive;
	private String titleReply;
	private String contentReply;
	private byte[] filesReply;
	private float yearUseDays;
	private String yearUseDateStart;
	private String yearUseDateEnd;
	private String yearAmPm;
	private String yearReason;
	private int refNo1;
	private int refNo2;
	private int writerNo;
	private int writerReplyNo;
	private String writerReply;
	private int countTemp;
	
    /*
     * 계층형 게시판을 위한 추가 필드
     * originNo, groupOrd, groupLayer 
     */
    
    /** 원글 번호 **/
    private int originNo;
    
    /** 원글(답글포함)에 대한 순서 **/
    private int groupOrd;
}
