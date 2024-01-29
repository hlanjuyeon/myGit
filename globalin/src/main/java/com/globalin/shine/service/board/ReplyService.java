package com.globalin.shine.service.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.ReplyVO;

@Service
public interface ReplyService {
	public boolean register(ReplyVO replyVO);
	public ReplyVO findByRNO(Long rno);
	public boolean remove(Long rno);
	public boolean removeAllByBNO(Long bno);
	public boolean modify(ReplyVO replyVO);
	public List<ReplyVO> findAllByBNO(Criteria criteria, Long bno);
	public int getToal(Long bno);
}
