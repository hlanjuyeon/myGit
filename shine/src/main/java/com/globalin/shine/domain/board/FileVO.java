package com.globalin.shine.domain.board;

import lombok.Data;

@Data
public class FileVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
}
