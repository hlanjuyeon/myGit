package com.globalin.shine.domain.employee;


import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeVO {
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
	private MultipartFile photoFile;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getExitDate() {
		return exitDate;
	}

	public void setExitDate(String exitDate) {
		this.exitDate = exitDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String path) {
		this.photo = path;
	}
	
	public void setphotoFile(MultipartFile file ) {
		this.photoFile = file;
	}
	
	public MultipartFile getphotoFile() {
		return photoFile;
	}

	public EmployeeVO() {
	}
	
	@Override
	public String toString() {
		return "UserVO [no= " + no + ", ID = " + id + ", pw = " + pw + ", name = " + name + ", position = " + position + phone + ", call = " + call + ",email = " + email + ", gender = " + gender + ", birth = " + birth + ", deptno = " + deptNo + ", deptname = " + deptName + ", deptno = " + deptNo + ", hiredate = " + hireDate + ", exitdate = " + exitDate + ", status = " + status + ", photo = " + photo;
	}
}
