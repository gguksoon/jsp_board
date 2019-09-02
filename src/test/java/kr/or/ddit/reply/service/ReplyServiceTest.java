package kr.or.ddit.reply.service;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.ddit.reply.model.Reply;

public class ReplyServiceTest {

	private IReplyService replyService;
	
	@Before
	public void setUp() throws Exception {
		replyService = new ReplyService();
	}

	/**
	* Method : getReplyListTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : postSeq에 해당하는 댓글리스트 반환 테스트
	*/
	@Test
	public void getReplyListTest() {
		/***Given***/

		/***When***/
		List<Reply> replyList = replyService.getReplyList(1);

		/***Then***/
		assertEquals(8, replyList.size());
	}
	
	/**
	* Method : insertReplyTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 댓글 추가 테스트
	*/
	@Test
	public void insertReplyTest() {
		/***Given***/
		Reply reply = new Reply(0, 2, "brown", "테스트내용", new Date(), new Date(), 1);

		/***When***/
//		int insertCnt = replyService.insertReply(reply);

		/***Then***/
//		assertEquals(1, insertCnt);
	}
	
	/**
	* Method : deleteReplyTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 댓글 삭제 테스트
	*/
	@Test
	public void deleteReplyTest() {
		/***Given***/
		int replySeq = 2; 

		/***When***/
//		int deleteCnt = replyService.deleteReply(replySeq);

		/***Then***/
//		assertEquals(1, deleteCnt);
	}

}
