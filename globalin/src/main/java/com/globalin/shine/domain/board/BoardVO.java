package com.globalin.shine.domain.board;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String deptName;
	private String name;
	private String regDate;
	private String updateDate;
	private List<FileVO> files;
}
