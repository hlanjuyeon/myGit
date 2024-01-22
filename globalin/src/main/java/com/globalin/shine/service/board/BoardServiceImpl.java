package com.globalin.shine.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalin.shine.domain.board.BoardDAO;
import com.globalin.shine.domain.board.BoardDTO;
import com.globalin.shine.domain.board.BoardVO;
import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.FileDAO;
import com.globalin.shine.domain.board.FileDTO;
import com.globalin.shine.domain.board.FileVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	FileDAO fileDAO;
	
	@Override
	public void register(BoardDTO board) {
		boardDAO.register(board);
		
		for(FileVO file : board.getFiles()) {
			FileDTO fileDTO = new FileDTO();
			fileDTO.setUuid(file.getUuid());
			fileDTO.setUploadPath(file.getUploadPath());
			fileDTO.setFileName(file.getFileName());
			fileDTO.setFileType(file.isFileType());
			fileDTO.setBno(board.getBno());
			
			fileDAO.register(fileDTO);
		}
	}

	@Override
	public BoardVO get(Long bno) {
		return boardDAO.get(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		return boardDAO.modify(board);
	}

	@Override
	public boolean remove(Long bno) {
		return boardDAO.remove(bno);
	}

	@Override
	public List<BoardVO> getList(Criteria criteria){
		return boardDAO.getList(criteria);
	}
	
	@Override
	public int getTotal(Criteria criteria) {
		return boardDAO.getTotal(criteria);
	}
	
	@Override
	public List<FileVO> getFiles(Long bno) {
		return boardDAO.getFiles(bno);
	}
	
	@Override
	public boolean removeReply(Long bno) {
		return boardDAO.removeReply(bno);
	}

}
