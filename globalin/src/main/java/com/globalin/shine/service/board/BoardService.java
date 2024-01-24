package com.globalin.shine.service.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.board.BoardDTO;
import com.globalin.shine.domain.board.BoardVO;
import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.FileVO;

@Service
public interface BoardService {
	//게시글 등록
	public void register(BoardDTO board);
	//특정 게시글 가져오기
	public BoardVO get(Long bno);
	//게시글 수정
	public boolean modify(BoardVO board);
	//게시글 삭제
	public boolean remove(Long bno);
	//전체 게시글 가져오기
	public List<BoardVO> getList(Criteria criteria);
	//전체 게시글 개수
	public int getTotal(Criteria criteria);
	
	public List<FileVO> getFiles(Long bno);
	
	public boolean removeReply(Long bno);
	
	//전체 게시글 가져오기
	public List<BoardVO> getListMain(Criteria criteria);
}
