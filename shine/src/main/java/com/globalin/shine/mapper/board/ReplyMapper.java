package com.globalin.shine.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.ReplyVO;

@Mapper
public interface ReplyMapper {
	
	public int insert(ReplyVO replyVO);
	public ReplyVO select(Long rno);
	public int delete(Long rno);
	public int deleteAll(Long bno);
	public int update(ReplyVO replyVO);
	public List<ReplyVO> selectAll(@Param("cri") Criteria criteria, @Param("bno") Long bno);
	public int getTotal(Long bno);
}
