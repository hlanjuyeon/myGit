package com.globalin.shine.domain.board;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class BoardDTO {
	private Long bno;
	private String title;
	private String content;
	private String deptName;
	private String name;
	private String regDate;
	private String updateDate;
	private List<FileVO> files;

	public BoardDTO() {
	    this.files = new ArrayList<>();
	}
}
