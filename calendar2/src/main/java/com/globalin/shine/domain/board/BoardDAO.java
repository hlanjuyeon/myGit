package com.globalin.shine.domain.board;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface BoardDAO {
	public void register(BoardDTO board);
	public BoardVO get(Long bno);
	public boolean modify(BoardVO board);
	public boolean remove(Long bno);
	public List<BoardVO> getList(Criteria criteria);
	public int getTotal(Criteria criteria);
	public List<FileVO> getFiles(Long bno);
	public boolean removeReply(Long bno);
}
