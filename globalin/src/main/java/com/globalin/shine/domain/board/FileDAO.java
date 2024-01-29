package com.globalin.shine.domain.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.shine.mapper.board.FileMapper;

@Repository
public class FileDAO {
	
	@Autowired
	public FileMapper fileMapper;
	
	public void register(FileDTO file) {
		fileMapper.insert(file);
	}
	
}
