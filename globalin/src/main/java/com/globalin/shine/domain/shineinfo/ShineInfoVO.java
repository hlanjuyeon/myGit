package com.globalin.shine.domain.shineinfo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ShineInfoVO {

	private int no;
	private String id;
	private String pw;
	private String name;
	private String position;
	private String phone;
	private String call;
	private String email;
	private String gender;
	private String birth;
	private String deptName;
	private int deptNo;
	private String hireDate;
	private String exitDate;
	private String status;
	private String photo;
	
}
