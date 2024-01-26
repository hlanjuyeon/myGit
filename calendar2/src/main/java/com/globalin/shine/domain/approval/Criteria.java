package com.globalin.shine.domain.approval;

import java.util.Arrays;

import lombok.Data;

@Data
public class Criteria{
	/* 현재 페이지 */
    private int pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;
    
	/* 검색 키워드 */
    private String keyword;
    
    /* 검색 타입 */
    private String type;
    
    /* 검색 타입 배열 */
    private String[] typeArr;
    
    private String loginNo;
    
    /* 기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 12 */
    public Criteria() {
        this(1, 12);
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
    
    public void setType(String type) {
    	this.type = type;
    	this.typeArr = type.split("");
    }
    
    @Override
    public String toString() {
    	return "Criteria [pageNum" + pageNum + ", amount=" + amount + ", keyword=" + keyword + 
    			", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
    }
}
