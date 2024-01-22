package com.globalin.shine.domain.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.globalin.shine.mapper.board.BoardMapper;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public void register(BoardDTO board) {
		boardMapper.insert(board);
	}

	@Override
	public BoardVO get(Long bno) {
		return boardMapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return boardMapper.update(board) != 0;
	}

	@Override
	public boolean remove(Long bno) {
		return boardMapper.delete(bno) != 0;
	}

	@Override
	public List<BoardVO> getList(Criteria criteria) {
		return boardMapper.getList(criteria);
	}

	@Override
	public int getTotal(Criteria criteria) {
		return boardMapper.getTotal(criteria);
	}
	
	@Override
	public List<FileVO> getFiles(Long bno) {
		return boardMapper.getFiles(bno);
	}
	
	@Override
	public boolean removeReply(Long bno) {
		return boardMapper.deleteReply(bno) != 0;
	}
}
