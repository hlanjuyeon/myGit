package com.globalin.shine.mapper.board;

import org.apache.ibatis.annotations.Mapper;

import com.globalin.shine.domain.board.FileDTO;

@Mapper
public interface FileMapper {
//	첨부파일 추가
	public void insert(FileDTO file);
}
