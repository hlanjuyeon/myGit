package com.globalin.shine.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.globalin.shine.domain.board.BoardDTO;
import com.globalin.shine.domain.board.BoardVO;
import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.FileVO;

@Mapper
public interface BoardMapper {
	public List<BoardVO> getList(Criteria criteria);
	public void insert(BoardDTO board);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO board);
	public int getTotal(Criteria criteria);
	public List<FileVO> getFiles(Long bno);
	public int deleteReply(Long bno);
	
	public List<BoardVO> getListMain(Criteria criteria);
}
