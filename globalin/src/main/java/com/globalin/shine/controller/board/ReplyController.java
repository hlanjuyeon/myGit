package com.globalin.shine.controller.board;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.globalin.shine.domain.board.Criteria;
import com.globalin.shine.domain.board.ReplyDTO;
import com.globalin.shine.domain.board.ReplyVO;
import com.globalin.shine.service.board.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequiredArgsConstructor
@RequestMapping("/replies/*")
@Log4j
public class ReplyController {
	
	private final ReplyService replyService;
	
//	댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) {
		log.info("create...... : " + replyVO);
		return replyService.register(replyVO) ? new ResponseEntity<>("success", HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	게시글 댓글 전체 조회
	@GetMapping(value = "/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDTO> getList(@PathVariable("bno") Long bno, @PathVariable int page) {
		log.info("getList..... : " + bno);
		return new ResponseEntity<>(new ReplyDTO(replyService.findAllByBNO(new Criteria(page, 10), bno), replyService.getToal(bno)), HttpStatus.OK);
	}

//	댓글 1개 조회
	@GetMapping(value = "/{rno}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ReplyVO getReply(@PathVariable("rno") Long rno) {
		log.info("getReply........ : " + rno);
		return replyService.findByRNO(rno);
	}
	
//	댓글 삭제
	@DeleteMapping(value = "/{rno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String remove(@PathVariable Long rno) {
		log.info("remove.......: " + rno);
		return replyService.remove(rno) ? "success" : "fail";
	}
	
//	댓글 수정
//	PUT : 자원의 전체 수정, 자원 내 모든 필드를 전달해야 함
//	PATCH : 자원의 일부 수정, 수정할 필드만 전송
	@PutMapping(value = "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String modify(@PathVariable Long rno, @RequestBody ReplyVO replyVO) {
		replyVO.setRno(rno);
		return replyService.modify(replyVO) ? "success" : "fail";
	}
}






















