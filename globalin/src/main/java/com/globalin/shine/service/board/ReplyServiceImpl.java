package com.globalin.shine.service.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.ReplyDAO;
import com.globalin.shine.domain.board.ReplyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private final ReplyDAO replyDAO;
	
	@Override
	public boolean register(ReplyVO replyVO) {
		return replyDAO.register(replyVO);
	}

	@Override
	public ReplyVO findByRNO(Long rno) {
		return replyDAO.findByRNO(rno);
	}

	@Override
	public boolean remove(Long rno) {
		return replyDAO.remove(rno);
	}

	@Override
	public boolean removeAllByBNO(Long bno) {
		return replyDAO.removeAllByBNO(bno);
	}

	@Override
	public boolean modify(ReplyVO replyVO) {
		return replyDAO.modify(replyVO);
	}

	@Override
	public List<ReplyVO> findAllByBNO(Criteria criteria, Long bno) {
		return replyDAO.findAllByBNO(criteria, bno);
	}
	
	@Override
	public int getToal(Long bno) {
		return replyDAO.getTotal(bno);
	}
}
